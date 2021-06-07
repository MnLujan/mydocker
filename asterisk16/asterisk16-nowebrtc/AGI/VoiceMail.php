#!/usr/bin/php -q
<?php
/**
 * @brief Script encargado de ejecutar las funciones de VoiceMail. Cualquier cambio se ruega documentar.
 */

/* Pido los archivos que necesito */
require 'config.php';
require 'Db.php';
require_once 'phpagi.php';
require_once 'webcdr.php';

/* AGI e Interfaz */
$agi = new AGI();
$cdr = new CDR2($agi);

$out_id = $cdr->get_destination();

$corpID = getCorpVM($out_id);

$wav_file = getSoundVM($out_id);

$wav_file_array = explode(".", $wav_file);

$call_file = WEB_SOUNDS_FOLDER.'reminders/Corp'.$corpID.'/'.$wav_file_array[0];

$agi->stream_file($call_file, '', 0);

updateReminder($out_id);


?>