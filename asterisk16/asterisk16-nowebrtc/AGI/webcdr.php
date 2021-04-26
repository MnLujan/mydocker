<?php

class CDR2
{
    private $data;
    private $count;
    private $agi;
    private $callid;
    private $channel;
    private $caller;
    private $dialed;
    private $destination;
    private $start;
    private $end;
    private $result;
    private $closing;
    private $closed;
    private $cdruniqueid;
    private $restriction;
    private $trunk;
    private $pbx;
    private $call_file;
    private $outboundvm_id;
    private $corp;

    function __construct(&$agi)
    {
        $this->agi = &$agi;
        $this->pbx = $this->agi->request['agi_callerid'];
        $callerID_info = explode('_', $this->pbx); //Extraigo la corp y la guardo.
        $this->corp = $callerID_info[0];
        //$this->callid = $this->get_variable('SIPCALLID');
        $this->channel = $this->get_variable('CHANNEL');

        if (preg_match('/\d+\_\d+/', $this->channel, $preg_result)) {
            $this->caller = $preg_result[0];
        } else {
            $this->caller = $this->get_variable('CALLERID(num)');
        }

        $this->cdruniqueid = $this->get_variable('CDR(uniqueid)');
        $this->dialed = $this->agi->request['agi_dnid'];
        $this->destination = $this->dialed;
        $this->data = array();
        $this->count = 0;
        $this->result = '';
        $this->closing = false;
        $this->closed = false;
        $this->restriction = '';
        $this->trunk = '';
        $this->call_file = '';
        $this->outboundvm_id = '';
        //$this->step("Procesing Call");

        if ($this->get_variable('ParentCallId') == null || $this->get_variable('ParentCallId') == '') {
            $this->agi->set_variable('__ParentCallId', $this->callid);
        }

        if ($this->destination != 'h') {
            //$this->database_put('callid', $this->callid);
            $this->database_put('caller', $this->pbx);
            $this->database_put('dialed', $this->dialed);
            $this->database_put('destination', $this->destination);
            //$this->database_put('start', $this->start);
            $this->database_put('count', $this->count);
            $this->database_put('restriction', $this->restriction);
            $this->database_put('trunk', $this->trunk);
            $this->database_put('outboundvm_id', $this->outboundvm_id);
            //guardar uniqueid en base de asterisk
            $this->database_put('uniqueid', $this->cdruniqueid);
        } else {
            $this->closing = true;
            $this->callid = $this->database_get('callid');
            if ($this->callid != '') {
                $this->load_parameters();
            } elseif ($this->isZombie()) {
                $aux_channel = str_replace('Transfered/', '', $this->channel);
                $this->channel = str_replace('<ZOMBIE>', '', $aux_channel);
                //pisar unique id de la clase con el de la base de asterisk
                $this->cdruniqueid = $this->database_get('uniqueid');

                $this->callid = $this->database_get('callid');
                $this->load_parameters();
            } else {
                $this->closed = true;
            }
        }
    }

    function isZombie()
    {
        if (preg_match('/Transfered/', $this->channel)) {
            return true;
        }
        return false;
    }

    function isTransfered()
    {
        if ($this->callid != $this->get_variable('ParentCallId')) {
            return true;
        }
        return false;
    }

    function set_closed($val)
    {
        $this->closed = $val;
    }

    function load_parameters()
    {
        $this->caller = $this->database_get('caller');
        $this->destination = $this->database_get('destination');
        $this->dialed = $this->database_get('dialed');
        //$this->start = $this->database_get('start');
        $this->count = $this->database_get('count');
        $this->restriction = $this->database_get('restriction');
        $this->trunk = $this->database_get('trunk');
        $this->call_file = $this->database_get('call_file');
        $this->outboundvm_id = $this->database_get('outboundvm_id');
    }

    function set($key, $value)
    {
        $this->data[$key] = $value;
    }

    function remove($key)
    {
        if (array_key_exists($key, $this->data)) {
            unset($this->data[$key]);
            $this->database_put('data', implode(';', $this->data));
        }
    }

    function step($action)
    {
        $this->count++;
        $this->log("CALL - {$this->count} - $action");
        //$this->set('step_'.$this->count,$action);
        $this->database_put('count', print_r($this->count, true));
    }

    function close($msg = '')
    {

        if (!$this->closed) {
            if ($msg != '') {
                $this->log("DEBUG - $msg");
            }

            if ($this->result == '') {
                $status = $this->get_variable('DIALSTATUS');
                $this->result = $status;
            }

            if ($this->result == '') {
                $status = $this->get_variable('HANGUPCAUSE');
                if ($status != '0') {
                    $status_text = $this->hangup2text($status);
                    $this->result = ($status_text != '' ? $status_text : $status);
                } else {
                    $this->result = str_replace(' ', '_', trim(str_replace('*', '', $msg)));
                }
            }

            /*$this->end = microtime(true);
            $this->duration = $this->end - $this->start;*/

            if ($this->caller != '') {
                $recordFile = date("YmdHis") . "_" . $this->caller . "_" . $this->destination . "_" . $this->cdruniqueid . ".wav";
                $callFilePath = $this->database_get('call_file_path');
                system("sudo mv {$callFilePath}{$this->get_record_file()}.wav {$callFilePath}{$recordFile}");
                $sql = "call create_CDRs('{$this->caller}','{$this->dialed}','{$this->destination}',0,0,'{$this->restriction}','{$this->result}','{$this->cdruniqueid}','{$this->callid}','{$this->trunk}','{$recordFile}','','');";
                $this->log("SQL - $sql");
                //$res = query($sql, __LINE__);
            }

            $this->closed = true;
            $this->database_deltree();
            $this->log("CALL - " . ($this->count + 1) . " - Hangup");

        }
        //$this->agi->hangup();
    }

    function log($msg)
    {
        $mess = substr($msg, strpos($msg, " - ") + 2);
        //$type = substr($msg, 0, strpos($msg, " - "));
        $type = "DEBUG";
        switch ($type) {
            case "DEBUG":
                if (true) {
                    $this->agi->verbose("   -- <{$this->agi->request["agi_channel"]}> $mess");
                }

                break;
            case "SQL":
                if (LOGGING_LEVEL >= 3) {
                    $this->agi->verbose("   -- <{$this->agi->request["agi_channel"]}> $mess");
                }

                break;
            case "CALL":
                if (LOGGING_LEVEL >= 2) {
                    $this->agi->verbose("   -- <{$this->agi->request["agi_channel"]}> $mess");
                }

                break;
            case "ERROR":
                if (LOGGING_LEVEL >= 1) {
                    $this->agi->verbose("   -- <{$this->agi->request["agi_channel"]}> $mess");
                }

                break;
        }
        if (AST_DEBUG) {
            $ddf = fopen(AST_DEBUG_FILE, 'a');
            if (preg_match('/\d+/', $this->pbx)) {
                fwrite($ddf, '[' . date("M j G:i:s") . "] CENTREX[CTX3-C{$this->pbx}-{$this->callid}] - $msg\n");
            } else {
                fwrite($ddf, '[' . date("M j G:i:s") . "] CENTREX[CTX3-VSC-{$this->callid}] - $msg\n");
            }
            fclose($ddf);
        }
    }

    function exec($app, $opts)
    {
        $this->log("DEBUG - Execute $app," . (is_array($opts) ? join(',', $opts) : $opts));
        if ($app == 'Dial') {
            $this->step("Calling");
            $this->database_put('restriction', $this->restriction);
        }
        return $this->agi->exec($app, $opts);
    }

    function say_phonetic($text, $escape_digits = '')
    {
        $this->log("DEBUG - Say Phonetic $text $escape_digits");
        return $this->agi->say_phonetic($text, $escape_digits);
    }

    function say_digits($digits, $escape_digits = '')
    {
        $this->log("DEBUG - Say Digits $digits $escape_digits");
        return $this->agi->say_digits($digits, $escape_digits);
    }

    function say_number($dest)
    {
        $this->log("DEBUG - Say Number $dest");
        $this->agi->say_number($dest);
    }

    function wait_for_digit($timeout = -1)
    {
        $this->log("DEBUG - Wait for digit $timeout ms");
        return $this->agi->wait_for_digit($timeout);
    }

    function get_variable($var)
    {
        $this->log("DEBUG - Get variable $var");
        return $this->agi->get_variable($var, true);
    }

    function set_variable($var, $value)
    {
        $this->log("DEBUG - Set variable $var = $value");
        return $this->agi->set_variable($var, $value);
    }

    function set_context($ctx)
    {
        $this->log("DEBUG - Set context $ctx");
        return $this->agi->set_context($ctx);
    }

    function database_put($key, $value)
    {
        $this->log("DEBUG - DB put $key, $value");
        return $this->agi->database_put($this->channel, $key, $value);
    }

    function database_get($key)
    {
        $ret = $this->agi->database_get($this->channel, $key);
        $this->log("DEBUG - DB get $key: " . $ret['data']);
        return $ret['data'];
    }

    function database_deltree()
    {
        $this->log("DEBUG - DB deltree");
        return $this->agi->database_deltree($this->channel);
    }

    function set_callerid($id)
    {
        $this->log("DEBUG - Set Caller ID: $id");
        return $this->agi->set_callerid($id);
    }

    function set_restriction($res)
    {
        $this->log("DEBUG - Set Restriction: $res");
        $this->restriction = $res;
    }

    function set_destination($des)
    {
        $this->log("DEBUG - Set Destination: $des");
        $this->destination = $des;
        $this->database_put('destination', $this->destination);
    }

    function set_trunk($trunk)
    {
        $this->log("DEBUG - Set Trunk: $trunk");
        $this->trunk = $trunk;
        $this->database_put('trunk', $this->trunk);
    }

    function get_channel()
    {
        return $this->channel;
    }

    function get_caller()
    {
        return $this->caller;
    }

    function get_pbx()
    {
        return $this->pbx;
    }

    function get_agi(): AGI
    {
        return $this->agi;
    }

    function get_Corp(): string
    {
        return $this->corp;
    }

    function get_destination()
    {
        return $this->destination;
    }

    function get_callid()
    {
        return $this->callid;
    }

    function get_dialed()
    {
        return $this->dialed;
    }

    function is_closing()
    {
        return $this->closing;
    }

    function is_voicemail()
    {
        return $this->outboundvm_id != '';
    }

    function set_outboundvm_id($id)
    {
        $this->log("DEBUG - Set OutboundVM ID: $id");
        $this->outboundvm_id = $id;
        $this->database_put('outboundvm_id', $this->outboundvm_id);
    }

    function get_outboundvm_id()
    {
        return $this->outboundvm_id;
    }

    function get_cdruniqueid()
    {
        return $this->cdruniqueid;
    }

    function get_record_file()
    {
        if ($this->get_variable('ParentCallId') == null || $this->get_variable('ParentCallId') == '') {
            return $this->callid;
        }
        $parentCallId = $this->get_variable('ParentCallId');
        //$this->agi->set_variable('CDR(userfield)', $parentCallId);
        return $parentCallId;
    }

    function is_closed()
    {
        return $this->closed;
    }

    function hangup2text($h)
    {

        /*
            AST_CAUSE_NOTDEFINED 0
            AST_CAUSE_NORMAL 1
            AST_CAUSE_BUSY 2
            AST_CAUSE_FAILURE 3
            AST_CAUSE_CONGESTION 4
            AST_CAUSE_UNALLOCATED 5
        */

        $causes = array('cd0' => 'AST_CAUSE_NOTDEFINED',
            'cd1' => 'AST_CAUSE_UNALLOCATED',
            'cd2' => 'AST_CAUSE_NO_ROUTE_TRANSIT_NET',
            'cd3' => 'AST_CAUSE_NO_ROUTE_DESTINATION',
            'cd6' => 'AST_CAUSE_CHANNEL_UNACCEPTABLE',
            'cd7' => 'AST_CAUSE_CALL_AWARDED_DELIVERED',
            'cd16' => 'AST_CAUSE_NORMAL_CLEARING',
            'cd17' => 'AST_CAUSE_USER_BUSY',
            'cd18' => 'AST_CAUSE_NO_USER_RESPONSE',
            'cd19' => 'AST_CAUSE_NO_ANSWER',
            'cd20' => 'AST_CAUSE_NO_USER_REGISTER',
            'cd21' => 'AST_CAUSE_CALL_REJECTED',
            'cd22' => 'AST_CAUSE_NUMBER_CHANGED',
            'cd23' => 'AST_CAUSE_NUMBER_CHANGED',
            'cd27' => 'AST_CAUSE_DESTINATION_OUT_OF_ORDER',
            'cd28' => 'AST_CAUSE_INVALID_NUMBER_FORMAT',
            'cd29' => 'AST_CAUSE_FACILITY_REJECTED',
            'cd30' => 'AST_CAUSE_RESPONSE_TO_STATUS_ENQUIRY',
            'cd31' => 'AST_CAUSE_NORMAL_UNSPECIFIED',
            'cd34' => 'AST_CAUSE_NORMAL_CIRCUIT_CONGESTION',
            'cd38' => 'AST_CAUSE_NETWORK_OUT_OF_ORDER',
            'cd41' => 'AST_CAUSE_NORMAL_TEMPORARY_FAILURE',
            'cd42' => 'AST_CAUSE_SWITCH_CONGESTION',
            'cd43' => 'AST_CAUSE_ACCESS_INFO_DISCARDED',
            'cd44' => 'AST_CAUSE_REQUESTED_CHAN_UNAVAIL',
            'cd45' => 'AST_CAUSE_PRE_EMPTED',
            'cd47' => 'AST_CAUSE_RESOURCE_UNAVAILABLE',
            'cd50' => 'AST_CAUSE_FACILITY_NOT_SUBSCRIBED',
            'cd52' => 'AST_CAUSE_OUTGOING_CALL_BARRED',
            'cd54' => 'AST_CAUSE_INCOMING_CALL_BARRED',
            'cd55' => 'AST_CAUSE_INCOMING_CALL_BARRED',
            'cd57' => 'AST_CAUSE_BEARERCAPABILITY_NOTAUTH',
            'cd58' => 'AST_CAUSE_BEARERCAPABILITY_NOTAVAIL',
            'cd65' => 'AST_CAUSE_BEARERCAPABILITY_NOTIMPL',
            'cd66' => 'AST_CAUSE_CHAN_NOT_IMPLEMENTED',
            'cd69' => 'AST_CAUSE_FACILITY_NOT_IMPLEMENTED',
            'cd70' => 'AST_CAUSE_ONLY_DIGITAL_AVAILABLE',
            'cd79' => 'AST_CAUSE_SERVICE_NOT_IMPLEMENTED',
            'cd81' => 'AST_CAUSE_INVALID_CALL_REFERENCE',
            'cd87' => 'AST_CAUSE_INVALID_CALL_REFERENCE',
            'cd88' => 'AST_CAUSE_INCOMPATIBLE_DESTINATION',
            'cd95' => 'AST_CAUSE_INVALID_MSG_UNSPECIFIED',
            'cd96' => 'AST_CAUSE_MANDATORY_IE_MISSING',
            'cd97' => 'AST_CAUSE_MESSAGE_TYPE_NONEXIST',
            'cd98' => 'AST_CAUSE_WRONG_MESSAGE',
            'cd99' => 'AST_CAUSE_IE_NONEXIST',
            'cd100' => 'AST_CAUSE_INVALID_IE_CONTENTS',
            'cd101' => 'AST_CAUSE_WRONG_CALL_STATE',
            'cd102' => 'AST_CAUSE_RECOVERY_ON_TIMER_EXPIRE',
            'cd103' => 'AST_CAUSE_MANDATORY_IE_LENGTH_ERROR',
            'cd111' => 'AST_CAUSE_PROTOCOL_ERROR',
            'cd127' => 'AST_CAUSE_INTERWORKING');

        return $causes['cd' . $h];
    }
}

?>