function aproximar(_valor_inicial,_valor_final,_quantidade){
	if (_valor_inicial < _valor_final)
	{
	    _valor_inicial += _quantidade;
	    if (_valor_inicial > _valor_final)
	        return _valor_final;
	}
	else
	{
	    _valor_inicial -= _quantidade;
	    if (_valor_inicial < _valor_final)
	        return _valor_final;
	}
	return _valor_inicial;
}

