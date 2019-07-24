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
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        let cellId = "cellId"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
    }
    
    @IBAction func Salvar(_ sender: Any) {
        
//        if nome?.text != "" && genero?.text != "" && email?.text != "" && endereco?.text != "" && bairro?.text != "" && cidade?.text != "" && estado?.text != ""{
//
//
        if nome?.text != "" && datanasc?.text != "" && genero?.text != "" && telefone?.text != "" && email?.text != "" && cpf?.text != "" && cep?.text != "" && endereco?.text != "" && bairro?.text != "" && cidade?.text != "" && estado?.text != ""{
            
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
            
            do {
                try context.save()
            }catch{
                print(error)
            }
            
        }else{
            print("preencha tudo")
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
