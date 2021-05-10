//
//  usuarioClass.swift
//  LearnTeach
//
//  Created by Raul Fernandez on 5/5/21.
//

import Foundation

/**
 * Clase usuario 
 */
class Usuario {
    var nombreUsuario:String
    var nombre:String
    var apellido:String
    var correo:String
    
    init(nombreUsuario:String, nombre:String, apellido:String, correo:String) {
        self.nombreUsuario = nombreUsuario
        self.nombre = nombre
        self.apellido = apellido
        self.correo = correo
    }
    init() {
        self.nombreUsuario = ""
        self.nombre = ""
        self.apellido = ""
        self.correo = ""
    }
    
}
