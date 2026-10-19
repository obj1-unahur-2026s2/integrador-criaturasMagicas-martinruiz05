class Criaturas {
  const poderMagico
  const astucia
  var rolEnElParque
  method poderOfensivo(){
    return (poderMagico * 10) + rolEnElParque.extraDePoder()
  }
  method esFormidable(criatura){
    return criatura.esAstuta() or criatura.esExtraordinaria()
}
method esAstuta()
method esExtraordinaria() {
  return rolEnElParque.determinaSiEsExtraordinario(self)
}
method poderMagico(){
  return poderMagico
}

method cambiarRol(nuevaMascota){
  if(rolEnElParque == Guardian and nuevaMascota.edad() == 1 and not nuevaMascota.tieneCuerno()){
    rolEnElParque = new Domadores()
    rolEnElParque.agregarMascota(nuevaMascota)
  }
  else{
    if(rolEnElParque == Hechicero){
      rolEnElParque == Guardian
    }
    else{
      if(nuevaMascota.tieneCuerno()){
        rolEnElParque == Hechicero
      }
      else raise Exception("Se cancela el ritual")
    }
  }
}

}


class Hadas inherits Criaturas {
  var kilometrosQueVuelan = 2
  method aumentarKilometros(){
    kilometrosQueVuelan = kilometrosQueVuelan.min(25) + 1
  }
  override method esAstuta(){
    return astucia > 50
  }
  override method esExtraordinaria(){
    return super() and kilometrosQueVuelan > 10

  }
}

class Duendes inherits Criaturas{
  override method poderOfensivo(){
    return super() * 1.1
  }
  override method esAstuta(){
    return false
  }
}


class Domadores {
  const mascotas = []
  method agregarMascota(mascota){
    mascotas.add(mascota)
  }
  method mascotasConCuerno(){
    return mascotas.filter({m=>m.tieneCuerno()})
  }
  method edadDeSusMascotas(){
    return mascotas.map({m=>m.edad()})
  }
  method extraDePoder(){
    return 150 * self.mascotasConCuerno().size()
  }
  method determinaSiEsExtraordinario(criatura){
    return criatura.poderMagico() > 15 and self.edadDeSusMascotas().all({m=>m >=10})
  }

  

}
class Guardian {
  method extraDePoder(){
    return 100
  }
  method determinaSiEsExtraordinario(criatura){
    return criatura.poderMagico() > 50
  }
}
class Hechicero {
   method determinaSiEsExtraordinario(criatura){
    return true
   }
}

class Mascotas {
  const tieneCuernos
  const edad
  method tieneCuerno(){
    return tieneCuernos
  }
  method edad(){
    return edad
  }

}