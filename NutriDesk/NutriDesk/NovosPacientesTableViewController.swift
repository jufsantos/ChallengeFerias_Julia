//
//  NovosPacientesTableViewController.swift
//  NutriDesk
//
//  Created by Julia Santos on 15/07/19.
//  Copyright © 2019 Julia Santos. All rights reserved.
//

import UIKit

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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        let cellId = "cellId"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)

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

    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 4
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 11
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
//
//        cell.textLabel?.text = "Something"
//
//        return cell
//    }

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
