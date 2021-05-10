//
//  ViewControllerEditarPerfil.swift
//  LearnTeach
//
//  Created by Raul Fernandez on 5/5/21.
//

import UIKit

class ViewControllerEditarPerfil: UIViewController {
    
    // Outlets
    @IBOutlet weak var fieldUsuario: UITextField!
    @IBOutlet weak var fieldNombre: UITextField!
    @IBOutlet weak var fieldApellidos: UITextField!
    @IBOutlet weak var fieldCorreo: UITextField!
    
    @IBOutlet weak var btnGuardar: UIButton!
    @IBOutlet weak var imgUsuario: UIImageView!
    @IBOutlet weak var viewFormulario: UIView!
    
    let colorRojo = #colorLiteral(red: 0.8901960784, green: 0.09019607843, blue: 0.1568627451, alpha: 1)
    let colorRojoClaro = #colorLiteral(red: 1, green: 0.4256298145, blue: 0.4113036256, alpha: 1)
    
    var usuario:Usuario = Usuario()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Personalizacion de la imagen y la vista de formulario
        imgUsuario.tintColor = colorRojoClaro
        viewFormulario.layer.cornerRadius = 8.0
        btnGuardar.titleLabel?.font = UIFont(name: "Avenir-Light", size: 18.0)
        btnGuardar.tintColor = .white
        btnGuardar.titleLabel?.text = "Editar"
        btnGuardar.backgroundColor = #colorLiteral(red: 0.02364811839, green: 0.6596654518, blue: 0.01487033803, alpha: 0.65)
        btnGuardar.layer.cornerRadius = 8.0
        
        // Mostramos los datos del usuario en los fieldText
        fieldUsuario.text = usuario.nombreUsuario
        fieldNombre.text = usuario.nombre
        fieldApellidos.text = usuario.apellido
        fieldCorreo.text = usuario.correo
        
        fieldUsuario.isUserInteractionEnabled = false
    }
    
    // Utilizamos esta función sobreescrita para poner el titulo en la barra de navegacion
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      self.tabBarController?.navigationItem.title = "Editar perfil"
    }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
    }
    
    // Configuracion del segue donde devolvermos los datos editados del usuario por medio del unwind
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let destino = segue.destination as? ViewControllerPerfil {
            destino.usuario.nombreUsuario = fieldUsuario.text!
            destino.usuario.nombre = fieldNombre.text!
            destino.usuario.apellido = fieldApellidos.text!
            destino.usuario.correo = fieldCorreo.text!
            destino.fieldUsuario.text = fieldUsuario.text!
            destino.fieldNombre.text = fieldNombre.text!
            destino.fieldApellido.text = fieldApellidos.text!
            destino.fieldCorreo.text = fieldCorreo.text!
        }
    }

}
