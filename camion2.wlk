

object camion {
    var maxPeligrosidad = 10
    var carga = []
    method pesoCarga() = carga.sum({c => c.peso()})
    method cargarYDescargar(unaCosa,otraCosa){
        carga.add(unaCosa)
        carga.remove(otraCosa)
    }
    method peso() = 1000 + self.pesoCarga()
    method cargaPesoEsPar() = carga.all({c => c.peso().even()})
    method algunoPesa(unPeso) = carga.any({c => c.peso() == unPeso})
    method primeroConNivelDePeligro(unNivel) = carga.filter({p => p.peligrosidad() > unNivel}).first()
    method cosasConNivel(unNivel) = carga.filter({p => p.peligrosidad() > unNivel})
    method cosasMasPeligrosasQue(unaCosa) = carga.filter({p => p.peligrosidad() > unaCosa.peligrosidad()})
    method esPesoExcedido() = carga.sum({p => p.peso()}) > 2500
    method ningunElementoSupera(unNivel) = carga.all({c => c.peligrosidad() < unNivel})
    method puedeCircular() = not self.esPesoExcedido() && self.ningunElementoSupera(maxPeligrosidad)

    method cargar(unObjeto){
        unObjeto.alCargar()
        carga.add(unObjeto)
    }

}


/*Saber si el camión puede circular en ruta. Eso depende de que no exceda el peso máximo permitido y
 ninguno de los objetos cargados supere un nivel máximo de peligrosidad que depende del viaje,
 por eso para este caso el valor del nivel se pasará como argumento.*/