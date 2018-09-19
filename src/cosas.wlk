object knightRider
{
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bulto(){return 1}
}

object bumblebee 
{
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method bulto(){return 2}
}

object paqueteDeLadrillos
{
	var property cantidadLadrillos_=0
	const pesoPorLadrillo=2
	method peso(){return pesoPorLadrillo*cantidadLadrillos_}
	method nivelPeligrosidad(){return 2}
	
	//con el property me ahorro el tema de setear.
	method setCantidadDeLadrillos(ladri)
	{
		cantidadLadrillos_=ladri
	}
	method bulto()
	{
		if(cantidadLadrillos_=100)
		{
			return 1
		}
		else if((cantidadLadrillos_>=100) && (cantidadLadrillos_<300))
		{
		
			return 2
			
		}
		else if(cantidadLadrillos_>301)
		{
			return 3
		}
		else
		return false
	}
}

object arenaAGranel
{
	var peso_=100
	
	method peso(){return peso_}
	method peso(nuevoPeso){peso_=nuevoPeso}
	method nivelPeligrosidad(){return 1}
	method bulto(){return 1}
	
}

object bateriaAntiAerea
{
	var estaConMisiles = true
	method peso(){return if (estaConMisiles) {300} else {200}}
	method nivelPeligrosidad(){return if (estaConMisiles) {100} else {0}}
	method bulto()
	{
		if(estaConMisiles)
		{
			return 2
		}
		else
		return 1
	}
}

object contenedorPortuario
{
	const cosas = []
	const pesoPropio=100
	const bultoPropio=1
	method peso(){pesoPropio + cosas.sum({cosa => cosa.peso()})}
	method nivelPeligrosidad()
	{
		if([cosas].isEmpty())
    	{
    		return 0 //para que no falle si esta vacia.
    	}
    	else
    	{
    		return cosas.map({cosa => cosa.nivelDePeligrosidad()}).max()
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
	
	method bulto()
	{
		return bultoPropio+cosas.map({cosa=>cosa.bulto()})
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
    method bulto(){return 1}
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
	method bulto(){return 2}
}