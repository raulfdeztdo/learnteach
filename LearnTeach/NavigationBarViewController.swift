//
//  NavigationBarViewController.swift
//  LearnTeach
//
//  Created by Raul Fernandez on 1/5/21.
//

import UIKit

class NavigationBarViewController: UINavigationController {

    @IBOutlet weak var NavigationBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NavigationBar.barStyle = UIBarStyle.black
        NavigationBar.barTintColor = #colorLiteral(red: 0.8901960784, green: 0.09019607843, blue: 0.1568627451, alpha: 1)
        NavigationBar.tintColor = UIColor.white
        
        
        
    }
    

}
