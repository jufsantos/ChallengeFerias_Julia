//
//  NovosPacientesTableViewController.swift
//  NutriDesk
//
//  Created by Julia Santos on 15/07/19.
//  Copyright © 2019 Julia Santos. All rights reserved.
//

import UIKit
import CoreData

class NovosPacientesTableViewController: UITableViewController, UITextFieldDelegate {
    
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
    
    @IBOutlet weak var pesoAtual: UITextField!
    @IBOutlet weak var altura: UITextField!
    @IBOutlet weak var resultadoImc: UITextField!
    
    @IBOutlet weak var pesoIdeal: UITextField!
    @IBOutlet weak var massaGordaPorcent: UITextField!
    @IBOutlet weak var massaGorda: UITextField!
    @IBOutlet weak var massaMagraPorcent: UITextField!
    @IBOutlet weak var massaMagra: UITextField!
    @IBOutlet weak var aguaPorcent: UITextField!
    @IBOutlet weak var agua: UITextField!
    @IBOutlet weak var pesoOsseo: UITextField!
    @IBOutlet weak var pesoResidual: UITextField!
    @IBOutlet weak var pesoMuscular: UITextField!
    @IBOutlet weak var gorduraPorcent: UITextField!
    @IBOutlet weak var idadeMeta: UITextField!
    
    let container = NSPersistentContainer(name: "NutriDesk")
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let alerta = UIAlertController(title: "Atenção", message: "Preencha todos os campos, caso contrário, os dados não serão salvos ao clicar no botão Salvar.", preferredStyle: .alert)
    
    let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        let cellId = "cellId"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    @IBOutlet weak var button: UIButton!
    
    @IBAction func Salvar(_ sender: UIButton) {
        
        sender.pulsate()
        
        if button.isSelected == true {
            button.backgroundColor = #colorLiteral(red: 0.7842261195, green: 0.2227489948, blue: 0.1612006426, alpha: 1)
            button.setTitleColor(#colorLiteral(red: 0.9804118276, green: 0.977494061, blue: 0.9026097059, alpha: 1), for: .normal)
        } else {
            button.backgroundColor = #colorLiteral(red: 0.9804118276, green: 0.977494061, blue: 0.9026097059, alpha: 1)
            button.setTitleColor(#colorLiteral(red: 0.7821950912, green: 0.2211945653, blue: 0.1616751552, alpha: 1), for: .normal)
        }
        
        if nome?.text != "" && datanasc?.text != "" && genero?.text != "" && telefone?.text != "" && email?.text != "" && cpf?.text != "" && cep?.text != "" && endereco?.text != "" && bairro?.text != "" && cidade?.text != "" && estado?.text != "" && pesoAtual?.text != "" && altura?.text != "" && resultadoImc?.text != "" && pesoIdeal?.text != "" && massaGordaPorcent?.text != "" && massaGorda?.text != "" && massaMagraPorcent?.text != "" && massaMagra?.text != "" && aguaPorcent?.text != "" && agua?.text != "" && pesoOsseo?.text != "" && pesoResidual?.text != "" && pesoMuscular?.text != "" && gorduraPorcent?.text != "" && idadeMeta?.text != "" {
            
            let novoPaciente = NSEntityDescription.insertNewObject(forEntityName: "Paciente", into: context)
            novoPaciente.setValue(self.nome!.text, forKey: "nome")
            novoPaciente.setValue(self.datanasc!.text, forKey: "datanasc")
            novoPaciente.setValue(self.genero!.text, forKey: "genero")
            novoPaciente.setValue(self.telefone!.text, forKey: "telefone")
            novoPaciente.setValue(self.email!.text, forKey: "email")
            novoPaciente.setValue(self.cpf!.text, forKey: "cpf")
            novoPaciente.setValue(self.cep!.text, forKey: "cep")
            novoPaciente.setValue(self.endereco!.text, forKey: "endereco")
            novoPaciente.setValue(self.bairro!.text, forKey: "bairro")
            novoPaciente.setValue(self.cidade!.text, forKey: "cidade")
            novoPaciente.setValue(self.estado!.text, forKey: "estado")
            
            novoPaciente.setValue(self.pesoAtual!.text, forKey: "pesoAtual")
            novoPaciente.setValue(self.altura!.text, forKey: "altura")
            novoPaciente.setValue(self.resultadoImc!.text, forKey: "resultadoImc")
            
            novoPaciente.setValue(self.pesoIdeal!.text, forKey: "pesoIdeal")
            novoPaciente.setValue(self.massaGordaPorcent!.text, forKey: "massaGordaPorcent")
            novoPaciente.setValue(self.massaGorda!.text, forKey: "massaGorda")
            novoPaciente.setValue(self.massaMagraPorcent!.text, forKey: "massaMagraPorcent")
            novoPaciente.setValue(self.massaMagra!.text, forKey: "massaMagra")
            novoPaciente.setValue(self.aguaPorcent!.text, forKey: "aguaPorcent")
            novoPaciente.setValue(self.agua!.text, forKey: "agua")
            novoPaciente.setValue(self.pesoOsseo!.text, forKey: "pesoOsseo")
            novoPaciente.setValue(self.pesoResidual!.text, forKey: "pesoResidual")
            novoPaciente.setValue(self.pesoMuscular!.text, forKey: "pesoMuscular")
            novoPaciente.setValue(self.gorduraPorcent!.text, forKey: "gorduraPorcent")
            novoPaciente.setValue(self.idadeMeta!.text, forKey: "idadeMeta")
            
            do {
                try context.save()
            }catch{
                print(error)
            }
        }else{
            alerta.addAction(ok)
            
            DispatchQueue.main.async {
                self.present(self.alerta, animated: true, completion: nil)
            }
        }
    }
    
    var celulaEstaGrande:Bool = false
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 && indexPath.row == 0 {
            if celulaEstaGrande {
                return 250
            }
            else {
                return 44
            }
        }
        return 44
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && indexPath.row == 0{
            celulaEstaGrande = !celulaEstaGrande
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
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
        
        pesoAtual.delegate = self
        altura.delegate = self
        resultadoImc.delegate = self
        
        pesoIdeal.delegate = self
        massaGordaPorcent.delegate = self
        massaGorda.delegate = self
        massaMagraPorcent.delegate = self
        massaMagra.delegate = self
        aguaPorcent.delegate = self
        agua.delegate = self
        pesoOsseo.delegate = self
        pesoResidual.delegate = self
        pesoMuscular.delegate = self
        gorduraPorcent.delegate = self
        idadeMeta.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
