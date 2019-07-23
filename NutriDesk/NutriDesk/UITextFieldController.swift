//
//  UITextFieldController.swift
//  NutriDesk
//
//  Created by Julia Santos on 22/07/19.
//  Copyright © 2019 Julia Santos. All rights reserved.
//

import UIKit

public class UITextFieldController: UITextField, UITextFieldDelegate {

    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var datanasc: UITextField!
    @IBOutlet weak var genero: UITextField!
    @IBOutlet weak var telefone: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var cpf: UITextField!
    @IBOutlet weak var cep: UITextField!
    @IBOutlet weak var endereco: UITextField!
    @IBOutlet weak var bairro: UITextField!
    @IBOutlet weak var cidade: UITextField!
    @IBOutlet weak var estado: UITextField!
    

//     Only override draw() if you perform custom drawing.
//     An empty implementation adversely affects performance during animation.
    override public func draw(_ rect: CGRect) {
       configureTextFields()
    }
    
    private func configureTextFields(){
        nome.delegate = self
        datanasc.delegate = self
        genero.delegate = self
        telefone.delegate = self
        email.delegate = self
        cpf.delegate = self
        cep.delegate = self
        endereco.delegate = self
        bairro.delegate = self
        cidade.delegate = self
        estado.delegate = self
        
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
