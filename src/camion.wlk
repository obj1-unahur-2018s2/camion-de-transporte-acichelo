import cosas.*

object camion 
{
	const property cosas = []
	const tara=1000
	const pesoMaximo=2500
	
	method cargar(unaCosa) 
	{
		cosas.add(unaCosa)
	}
	
	method descargar(unaCosa)
	{
		cosas.remove(unaCosa)
	}
	
	method pesoTotal()
	{
	  return tara + cosas.sum({cosa => cosa.peso()})
	}
	
	method excedidoDePeso()
	{
		return (cosas.pesoTotal()>pesoMaximo)
	}
	
	method objetosPeligrosos(nivel)
	{
		cosas.filter({cosa => cosa.nivelDePeligrosidad()>nivel})
	}
	
	method objetoMasPeligrosoQue(cosa)
	{
		cosas.filter({c => c.nivelDePeligrosidad()>cosa})
	}
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad)
	{
		cosas.any({c => c.nivelDePeligrosidad()>nivelMaximoPeligrosidad})
	}
	
	
	
	
}
