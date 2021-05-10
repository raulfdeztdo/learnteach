//
//  ViewControllerPerfil.swift
//  LearnTeach
//
//  Created by Raul Fernandez on 1/5/21.
//

import UIKit

class ViewControllerPerfil: UIViewController {

    // Outlets del view controller
    @IBOutlet weak var imgUsuario: UIImageView!
    @IBOutlet weak var fieldUsuario: UITextField!
    @IBOutlet weak var fieldNombre: UITextField!
    @IBOutlet weak var fieldApellido: UITextField!
    @IBOutlet weak var fieldCorreo: UITextField!
    @IBOutlet weak var viewFormulario: UIView!
    @IBOutlet weak var btnEditar: UIButton!
    
    let colorRojo = #colorLiteral(red: 0.8901960784, green: 0.09019607843, blue: 0.1568627451, alpha: 1)
    let colorRojoClaro = #colorLiteral(red: 1, green: 0.4256298145, blue: 0.4113036256, alpha: 1)
    
    // Creación del usuario con datos estaticos que luego pueden ser editados
    var usuario:Usuario = Usuario(nombreUsuario: "rft0005", nombre: "Raul", apellido: "Fernandez Tirado", correo: "rft00005@red.ujaen.es")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Mi perfil"
        
        // Personalizacion de la imagen y la vista de formulario
        imgUsuario.tintColor = colorRojoClaro
        viewFormulario.layer.cornerRadius = 8.0
        btnEditar.titleLabel?.font = UIFont(name: "Avenir-Light", size: 18.0)
        btnEditar.tintColor = .white
        btnEditar.titleLabel?.text = "Editar"
        btnEditar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.6527855283)
        btnEditar.layer.cornerRadius = 8.0
        
        // Mostramos los datos del usuario en los fieldText
        fieldUsuario.text = usuario.nombreUsuario
        fieldNombre.text = usuario.nombre
        fieldApellido.text = usuario.apellido
        fieldCorreo.text = usuario.correo
        
        // Deshabilitamos la edicion en esta vista
        fieldUsuario.isUserInteractionEnabled = false
        fieldNombre.isUserInteractionEnabled = false
        fieldApellido.isUserInteractionEnabled = false
        fieldCorreo.isUserInteractionEnabled = false
        
    }
    
    // Accion boton editar
    @IBAction func btnEditarAction(_ sender: Any) {
        performSegue(withIdentifier: "segueEditarPerfil", sender: self)
    }
    
    // Utilizamos esta función sobreescrita para poner el titulo en la barra de navegacion
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      self.tabBarController?.navigationItem.title = "Mi perfil"
    }
    
    // Configuración del segue para enviar los datos al ViewControllerEditarPerfil
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destino = segue.destination as? ViewControllerEditarPerfil {
            destino.usuario = self.usuario
        }
    }
    
    // Declaracion del unwind que devuelve los datos del usuario editados desde ViewControllerEditarPerfil
    @IBAction func unwindEditaPerfil(_ unwindSegue:UIStoryboardSegue) {}

}
