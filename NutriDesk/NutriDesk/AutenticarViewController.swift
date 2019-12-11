//
//  File.swift
//  NutriDesk
//
//  Created by Julia Santos on 09/12/19.
//  Copyright © 2019 Julia Santos. All rights reserved.
//

import UIKit
import LocalAuthentication
import UserNotifications

class AutenticarViewController: UIViewController {
    
    @IBOutlet weak var btnAutenticar: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        autenticarButton(btnAutenticar!)
    }
    
    override func viewDidLoad() {
        btnAutenticar.isHidden = false
    }
    
    @IBAction func autenticarButton(_ sender: Any) {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = "Acesse o App com sua biometria"

            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) {
                [weak self] success, authenticationError in

                DispatchQueue.main.async {
                    if success {
                        self?.performSegue(withIdentifier: "authenticated", sender: nil)
                    } else {
                        let ac = UIAlertController(title: "Falha na autenticação", message: "Usuário não reconhecido; Tente novamente.", preferredStyle: .alert)
                        ac.addAction(UIAlertAction(title: "OK", style: .default))
                        self?.present(ac, animated: true)
                    }
                }
            }
        } else {
            let ac = UIAlertController(title: "Biometria indisponível", message: "Seu aparelho não está configurado para autenticação por biometria.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(ac, animated: true)
        }
    }
}
