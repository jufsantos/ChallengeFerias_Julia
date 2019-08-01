//
//  DadosPacienteTableViewController.swift
//  NutriDesk
//
//  Created by Julia Santos on 25/07/19.
//  Copyright © 2019 Julia Santos. All rights reserved.
//

import UIKit
import CoreData

class DadosPacienteTableViewController: UITableViewController {
    
    let container = NSPersistentContainer(name: "NutriDesk")
    
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    var userArray: [Paciente] = []
    
    var userIndex:Int = 0
    
//    var DataArray: [Paciente] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchData()
        self.tableView.reloadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25 // TODO: colocar número de campos do paciente
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellDados = tableView.dequeueReusableCell(withIdentifier: "cellDados", for: indexPath)
        let dadoPaciente = userArray[userIndex]
        switch indexPath.row {
        case 0:
            cellDados.textLabel!.text = "Nome: \(dadoPaciente.nome!)"
        case 1:
            cellDados.textLabel!.text = "Data de nascimento: \(dadoPaciente.datanasc!)"
        case 2:
            cellDados.textLabel!.text = "Gênero: \(dadoPaciente.genero!)"
        case 3:
            cellDados.textLabel!.text = "Telefone: \(dadoPaciente.telefone!)"
        case 4:
            cellDados.textLabel!.text = "Email: \(dadoPaciente.email!)"
        case 5:
            cellDados.textLabel!.text = "Cpf: \(dadoPaciente.cpf!)"
        case 6:
            cellDados.textLabel!.text = "Cep: \(dadoPaciente.cep!)"
        case 7:
            cellDados.textLabel!.text = "Endereço: \(dadoPaciente.endereco!)"
        case 8:
            cellDados.textLabel!.text = "Bairro: \(dadoPaciente.bairro!)"
        case 9:
            cellDados.textLabel!.text = "Cidade: \(dadoPaciente.cidade!)"
        case 10:
            cellDados.textLabel!.text = "Estado: \(dadoPaciente.estado!)"
            
        case 11:
            cellDados.textLabel!.text = "Peso Atual: \(dadoPaciente.pesoAtual!)"
        case 12:
            cellDados.textLabel!.text = "Altura: \(dadoPaciente.altura!)"
        case 13:
            cellDados.textLabel!.text = "Resultado do Imc: \(dadoPaciente.resultadoImc!)"
            
        case 14:
            cellDados.textLabel!.text = "Peso Ideal: \(dadoPaciente.pesoIdeal!)"
        case 15:
            cellDados.textLabel!.text = "Porcentagem de massaGorda: \(dadoPaciente.massaGordaPorcent!)"
        case 16:
            cellDados.textLabel!.text = "Massa Gorda: \(dadoPaciente.massaGorda!)"
        case 17:
            cellDados.textLabel!.text = "Porcentagem de Massa Magra: \(dadoPaciente.massaMagraPorcent!)"
        case 18:
            cellDados.textLabel!.text = "Massa Magra: \(dadoPaciente.massaMagra!)"
        case 19:
            cellDados.textLabel!.text = "Porcentagem de água: \(dadoPaciente.aguaPorcent!)"
        case 20:
            cellDados.textLabel!.text = "Água: \(dadoPaciente.agua!)"
        case 21:
            cellDados.textLabel!.text = "Peso Ósseo: \(dadoPaciente.pesoOsseo!)"
        case 22:
            cellDados.textLabel!.text = "Peso Residual: \(dadoPaciente.pesoResidual!)"
        case 23:
            cellDados.textLabel!.text = "Peso Muscular: \(dadoPaciente.pesoMuscular!)"
        case 24:
            cellDados.textLabel!.text = "Porcentagem de gordura: \(dadoPaciente.gorduraPorcent!)"
        case 25:
            cellDados.textLabel!.text = "Idade Metabólica: \(dadoPaciente.idadeMeta!)"
        default:
            cellDados.textLabel!.text = "essa céluta ta errada"
        }
        
        
        return cellDados
    }
    
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//
//        if editingStyle == .delete {
//            userArray.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//            print("Deletando info")
//            (UIApplication.shared.delegate as! AppDelegate).saveContext()
//
//        } else{
//            print("nao apagou")
//        }
//    }
//
    
    func fetchData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            userArray = try context.fetch(Paciente.fetchRequest())
        }catch{
            print(error)
        }
        self.tableView.reloadData()
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    


    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

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
