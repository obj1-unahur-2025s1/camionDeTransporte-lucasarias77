object cosas {
    
}

object knightRider{
    method peso() = 500
    method peligrosidad() = 10
}

object bumblebee {
  var esAuto = false
  method peso() = 800
  method peligrosidad(){
    if (esAuto){
        return 15
    }
    else{
        return 30
    }
  }
  method transformar(){
    esAuto = !esAuto
  } 
}

object ladrillos {
  var cantLadrillos = 5
  method peso() = cantLadrillos * 2
  method peligrosidad() = 2
  method cambiarCantidad(unaCantidad){
    cantLadrillos = unaCantidad
  }
}

object arenaGranel {
  var peso = 5
  method peso()= peso
  method peligrosidad()= 1
  method cambiarPeso(unPeso){
    peso = unPeso
  }
}

object bateriaAntiaerea {
  var esConMisiles = false
  method peso(){
    if(esConMisiles){
        return 300
    }
    else{
        return 200
    }
  }
  method peligrosidad(){
    if(esConMisiles){
        return 100
    }
    else{
        return 0
    }
  }
  method cambiarEstadoMisiles(){
    esConMisiles = !esConMisiles
  }
}

object contenedorPortuario {
  var cosas = []
  method peso() = 100 + cosas.sum({c => c.peso()})
  method peligrosidad() = cosas.max({c => c.peligrosidad()})
  method anadir(unObjeto) = cosas.add(unObjeto)
}

object embalaje {
    var objeto = null
    method peso() = objeto.peso()
    method peligrosidad() = objeto.peligrosidad() / 2 
    method anadir(unObjeto){
        objeto = unObjeto
    }
}

object residuos {
  method peso() = 30
  method peligrosidad() = 30
}

