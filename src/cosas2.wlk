object knightRider {
	
	method peso() = 500
	method peligrosidad() = 10	
	
	method totalDeBultos() = 1
	method consecuencia(){}
}

object bumblebee {
	var estaTransformadoEnAuto = true
	
	method peso() = 800
	method peligrosidad() = if(estaTransformadoEnAuto){15} else {30}
	method transformar() {estaTransformadoEnAuto = !estaTransformadoEnAuto}
	method estaTransformadoEnAuto() = estaTransformadoEnAuto
	
	method totalDeBultos() = 2
	method consecuencia() {estaTransformadoEnAuto = false}
}

object paqueteLadrillos{
	var property cantidadDeLadrillos = 0
	const property pesoPorLadrillo = 2
	
	method peso() = cantidadDeLadrillos * pesoPorLadrillo
	method peligrosidad() = 2	
	
	method totalDeBultos() {
		var totalDeBultos
		
		if(cantidadDeLadrillos.between(1,100)){totalDeBultos = 1}
		if(cantidadDeLadrillos.between(101,300)){totalDeBultos = 2}
		if(cantidadDeLadrillos >= 301){totalDeBultos = 3}
		return totalDeBultos
	}
	method consecuencia(){cantidadDeLadrillos += 12}
}	


object arena {
	var property peso = 0
	
	method peligrosidad() = 1
	
	method totalDeBultos() = 1
	method consecuencia(){peso += 20}
}

object bateriaAntiarea {
	const estaConMisiles = true    //VER DENUEVO
	
	method peso() = if(estaConMisiles) {300} else {200}
	method peligrosidad() = if(estaConMisiles) {100} else {0}
	
	method totalDeBultos() = if(estaConMisiles){2} else {1}
	method consecuencia(){estaConMisiles = true}
}

object contenedor {
	var property cosas = []
	
	method cargar(cosa) = cosas.add(cosa)
	method descargar(cosa) = cosas.remove(cosa)
	method peso() = cosas.sum( { c => c.peso() } ) + 100 
	method peligrosidad() = if(cosas.isEmpty()){0} 
							else {cosas.max( { c => c.peligrosidad() } ).peligrosidad()} // VER DENUEVO 
	
	method totalDeBultos() = 1 + cosas.size()
	method consecuencia(){cosas.forEach {c => c.consecuencia()}}
}

object residuosRadioactivos {
	var property peso = 0
	
	method peligrosidad() = 200
	
	method totalDeBultos() = 1
	method consecuencia(){peso += 15}
}

object embalajeSeguridad {
	var property cosa = []
	
	method peso() = cosa.peso()
	method peligrosidad() = cosa.peligrosidad() / 2
	
	method totalDeBultos() = 2
	method consecuencia(){}
}

