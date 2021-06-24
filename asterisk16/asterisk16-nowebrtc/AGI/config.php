<?php

/* IMPORTANTE: verificar que al final del archivo NO existan saltos de linea adicionales, esto genera un error con el AGI */

// database configuration
define('DB_HOST', '127.0.0.1');
define('DB_USER', 'centrex');
define('DB_PASS', 'centrex123');
define('DB_BASE', 'newcentrex');

// web configuration
define('LIST_CANT_ROWS', 30);
define('SQL_DEBUG', false);
define('SQL_DEBUG_FILE', '../logs/sql.html');
define('WEB_SOUNDS_FOLDER', '/var/www/sounds/');
define('WEB_SOUNDS_DEBUG_FILE', 'logs/upload.html');
define('LOGMON_USER', 'voipgroup');
define('LOGMON_PASS', 'voipgroup123');
define('AST_DEBUG', false);
define('AST_DEBUG_FILE', '/var/www/logs/console.html');
define('OUTBOUNDVM_FOLDER', '/var/www/sounds/outboundvm/');

// old centrex_ws configuration
define('WS_SERVICENAME', 'WSCentrex');
define('WS_NAMESPACE', 'com.voipgroup.centrex.ws');

// agi-bin configuration
define('AGI_SQL_DEBUG', false);
define('AGI_SQL_DEBUG_FILE', '/var/www/logs/agi_sql.html');
define('AGI_LOCAL_MEDIA_SERVER', false);
define('AGI_DIAL_E164', false);
define('AGI_DIAL_TIMEOUT', 60);

// configuraciones de monitor
define('MON_SLEEP_BETWEEN_PACKS', '1800');
define('MON_MAX_ERRORS_PACKS', '2');
define('MON_ASTERISK_LOCAL', '127.0.0.1');
define('MON_LOGFILE', '/var/www/logs/monitor.log');

// collect calls configuration
// se debe setear IP-VSC en /etc/asterisk/extensions_custom.conf
define('COLLECT_CALLS', false);

// wsadmin configuration
define('WS_ADMIN_USER', 'ws_admin_user');
define('WS_ADMIN_PASSWORD', 'ws_admin_password');
define('WS_ADMIN_IP', '127.0.0.1');

// khomp configuration
define('KHOMP_ROUTING', false);

//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

// nuevos datos de config unificada ws
define('SITE_ROOT', '/var/www/ws'); //CHANGE FOR /var/www/ws
define('SITE_DOMAIN', '');
define('SESSION_EXPIRE_TIME', (20 * 60));
define('SITE_ENCRYPT_KEY', '*');
define('SITE_WRITE_DICTIONARY', true);

// DB settings
define('DB_PREFIX', '');

// debug settings
define("LOGGING_LEVEL", 2); // 1-> error, 2-> activity, 3-> sql, 4-> debug

// asterisk Manager settings
define('AST_SERVER', '127.0.0.1');
define('AST_PORT', '5038');
define('AST_USER', 'centrex');
define('AST_PASS', 'centrex123');

// ELITE -  ISP integrator
define('INTEGRATION_ENABLED', true); // cerrar y volver a abrir web para aplicar cambios
define('ELITE_SERVER', '');
define('ELITE_USER', '');
define('ELITE_PASS', '');

// cdrs VSC
define('VSC_CDRS_ENABLED', false); // cerrar y volver a abrir web para aplicar cambios
define('VSC_CDRS_SERVER', '');
define('VSC_CDRS_USER', '');
define('VSC_CDRS_PASS', '');

// Discador instalado
define('DISCADOR_ENABLED', true);

// Ruteo
define('OUTGOING_ROUTING', false);
?>