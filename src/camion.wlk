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
		return (self.pesoTotal()>pesoMaximo)//para llamar metodos de la misma clase usar !!!SELF!!!
	}
	
	method objetosPeligrosos(nivel)
	{
		cosas.filter({cosa => cosa.nivelDePeligrosidad()>nivel})
	}
	
	method objetoMasPeligrosoQue(cosa)
	{
		cosas.filter({c => c.nivelDePeligrosidad()>cosa})
		//return self.objetosPeligrosos(cosa.nivelDePeligrosidad())
	}
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad)
	{
		cosas.any({cosa => cosa.nivelDePeligrosidad()>nivelMaximoPeligrosidad})
	}
	
	method tieneAlgoQuePesaEntre(min, max)
	{
		cosas.filter({cosa=> cosa.peso().beetwen()})
	}
	
	method cosaMasPesada()
	{
		cosas.find({cosa=>cosa.peso()}).max()
	}
	
	method totalBultos()
	{
		cosas.sum({cosa=>cosa.bulto()})
	}
	
	
}
