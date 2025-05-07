import cosas.*
object cosas {
    
}

object knightRider{
    method peso() = 500
    method peligrosidad() = 10
    method bulto() = 1
    method alCargar(){

    }
}

object bumblebee {
  var estado = false
  method peso() = 800
  method peligrosidad(){
    if (estado){
        return 15
    }
    else{
        return 30
    }
  }
  method transformarARobot(){
    estado = !estado
  }
  method bulto()= 2
  method alCargar(){
    estado = true
  }
  method esRobot(){
    return estado
  }
}

object ladrillos {
  var cantLadrillos = 5
  method peso() = cantLadrillos * 2
  method peligrosidad() = 2
  method cambiarCantidad(unaCantidad){
    cantLadrillos = unaCantidad
  }
  method bulto(){
    if(cantLadrillos <= 100){
        return 1
    }
    else if (cantLadrillos.between(101, 300)){
        return 2
    }
    else{
        return 3
    }
  }
  method alCargar(){
    cantLadrillos = cantLadrillos + 12
  }
}

object arenaGranel {
  var peso = 20
  method peso()= peso
  method peligrosidad()= 1
  method cambiarPeso(unPeso){
    peso = unPeso
  }
  method bulto()= 1
  method alCargar(){
    peso = peso - 10
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

  method bulto(){
    if (esConMisiles){
        return 1
    }
    else{
        return 2
    }
  }

  method alCargar(){
    esConMisiles = true
  }
}

object contenedorPortuario {
  var cosas = []
  method peso() = 100 + cosas.sum({c => c.peso()})
  method peligrosidad() = cosas.max({c => c.peligrosidad()})
  method anadir(unObjeto) = cosas.add(unObjeto)
  method bulto() = 1 + cosas.sum({c => c.bulto()})
  method alCargar()= cosas.forEach({c => c.alCargar()})
}

object embalaje {
    var objeto = null
    method peso() = objeto.peso()
    method peligrosidad() = objeto.peligrosidad() / 2 
    method anadir(unObjeto){
        objeto = unObjeto
    }
    method alCargar(){
        
    }
}

object residuos {
  var peso = 30
  method peso() = peso
  method peligrosidad() = 30
  method bulto()= 1
  method alCargar(){
    peso = peso + 15
  }
}

/*Agregamos al dominio la información sobre la cantidad total de bultos que el camión tiene cargados. Cada cosa puede ocupar en el camión 1 o más bultos, y depende de cada cosa:

KnightRider, arena a granel y residuos radioactivos ocupan 1 bulto cada uno en el camión.
Bumblebee y embalaje de seguridad ocupan 2 bultos cada uno.
Paquete de ladrillos depende de la cantidad de ladrilos:
hasta 100 ladrillos ocupa 1 bulto.
Entre 101 y 300, 2 bultos.
301 o más, ocupa 3 bultos.
Batería antiaérea: ocupa 1 bulto si no tiene los misiles y 2 si los tiene cargados.
Contenedor portuario: 1 + los bultos de las cosas que tiene adentro.*/