#define DATABASE_NAME "Database"
fn_query_async = compile preprocessFileLineNumbers "fn_asyncCall.sqf";
call compile preprocessFileLineNumbers "funciones.sqf";

private "_resultado";

_resultado = call compile ("extDB3" callExtension format["9:ADD_DATABASE:%1", DATABASE_NAME]);

if (_resultado select 0 == 0) exitWith {
	 diag_log format ["Error al añadir la DB %1", _resultado]
 };

diag_log "Conectado correctamente a  la DB";

protocolID = compileFinal str round(random(123));
	
_resultado = call compile ("extDB3" callExtension format["9:ADD_DATABASE_PROTOCOL:%1:SQL_CUSTOM:%2:sql_custom.ini", DATABASE_NAME, call protocolID]);
if (_resultado select 0 == 0) exitWith {
	 diag_log format ["Error al añadir protocolo sql custom %1", _resultado] 
};

"extDB3" callExtension "9:LOCK";
diag_log "DB bloqueada";
	