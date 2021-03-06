object knightRider {
	
	method peso() = 500
	method peligrosidad() = 10	
}

object bumblebee {
	var estaTransformadoEnAuto = true
	
	method peso() = 800
	method peligrosidad() = if(estaTransformadoEnAuto){15} else {30}
	method transformar() {estaTransformadoEnAuto = !estaTransformadoEnAuto}
}

object paqueteLadrillos{
	var property cantidadDeLadrillos =
	const property pesoPorLadrillo = 2
	
	method peso() = cantidadDeLadrillos * pesoPorLadrillo
	method peligrosidad() = 2	
}


object arena {
	var property peso = 0
	
	method peligrosidad() = 1
}

object bateriaAntiarea {
	const estaConMisiles = true    //VER DENUEVO
	
	method peso() = if(estaConMisiles) {300} else {200}
	method peligrosidad() = if(estaConMisiles) {100} else {0}
}

object contenedor {
	var property cosas = []
	
	method cargar(cosa) = cosas.add(cosa)
	method descargar(cosa) = cosas.remove(cosa)
	method peso() = cosas.sum( { c => c.peso() } ) + 100 
	method peligrosidad() = if(cosas.isEmpty()){0} 
							else {cosas.max( { c => c.peligrosidad() } ).peligrosidad()} // VER DENUEVO 
	
}

object residuosRadioactivos {
	var property peso = 0
	
	method peligrosidad() = 200
}

object embalajeSeguridad {
	var property cosa = 
	
	method peso() = cosa.peso()
	method peligrosidad() = cosa.peligrosidad() / 2

}




