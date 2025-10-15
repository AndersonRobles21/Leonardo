console.log("Hols");
class Deporte {
    constructor(tipo, numjugadores) {
        this.tipo = "Futbol"
        this.numjugadores = 10
        
    }
    reglas(){

    }
    configuracion(){

    }
}
let deporte = new (Deporte)

console.log(deporte.numjugadores);

