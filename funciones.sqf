fn_CargaDatosJugador =
{
	private ["_edad", "_nombre", "_query", "_resultado"];

	_edad = 1989;
	_nombre = "Pepe";
	
	_query = format["ExisteJugador:%1:%2", _nombre, _edad];
	_resultado = ([_query, 2] call fn_query_async) select 0;
		
	if (!_resultado) then
	{
		_query = format["InsertarJugador:%1:%2", _nombre,_edad];
		[_query, 1] call fn_query_async;
		diag_log "Registro añadido a DB";
	}
};