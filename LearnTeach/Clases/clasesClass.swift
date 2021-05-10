//
//  clasesClass.swift
//  LearnTeach
//
//  Created by Raul Fernandez on 4/5/21.
//

import Foundation

/**
 * Clase clase para gestionar las clases de la aplicacion
 */
class Clase {
    var idClase:Int
    var nombre:String
    var precioHora:Double
    var descripcion:String
    var nombreProfesor:String
    var categoria:Int
    var alumnos = [String]()
    
    init(idClase:Int, nombre:String, precioHora:Double, descripcion:String, nombreProfesor:String, categoria:Int) {
        self.idClase = idClase
        self.nombre = nombre
        self.precioHora = precioHora
        self.descripcion = descripcion
        self.nombreProfesor = nombreProfesor
        self.categoria = categoria
        self.alumnos = []
    }
    init() {
        self.idClase = 0
        self.nombre = ""
        self.precioHora = 0.0
        self.descripcion = ""
        self.nombreProfesor = ""
        self.categoria = 1
        self.alumnos = []
    }
    
}
