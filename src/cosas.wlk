object knightRider
{
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object bumblebee 
{
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
}

object paqueteDeLadrillos
{
	var cantidadLadrillos_
	method peso(){return 2*cantidadLadrillos_}
	method nivelPeligrosidad(){return 2}
	method cantidadLadrillos(){cantidadLadrillos_}
	
	method setCantidadDeLadrillos(ladri)
	{
		cantidadLadrillos_=ladri
	}
}

object arenaAGranel
{
	method nivelPeligrosidad(){return 1}
	
}

object bateriaAntiAerea
{
	var estaConMisiles = true
	method peso(){return if (estaConMisiles) {300} else {200}}
	method nivelPeligrosidad(){return if (estaConMisiles) {100} else {0}}
}

object contenedorPortuario
{
	const cosas = []
	method peso(){100 + cosas.sum({cosa => cosa.peso()})}
	method nivelPeligrosidad()
	{
		if([cosas].isEmpty())
    	{
    		return cosas.max({cosa => cosa.nivelDePeligrosidad()})
    	}
    	else
    	{
    		return 0
    	}
	}
	method agregar(cosa)
	{
		return cosas.add(cosa)
	}
	method cantidadDeCosas()
	{
		return cosas.size()
	}
}

object residuoRadioactivo
{
	var peso_
	method setPeso(peso)
	{
		peso_=peso
	}
    method peso(){peso_}
    method nivelPeligrosidad(){return 200}
}

object embalajeDeSeguridad
{
	var cosas_ = null
	method setEmbolver(cosa)
	{
		 cosas_ =cosa
	}
	
	method peso()
	{
		cosas_.peso()
	}
	method nivelPeligrosidad()
	{
	    cosas_.nivelDePeligrosidad()/2	
	}
}