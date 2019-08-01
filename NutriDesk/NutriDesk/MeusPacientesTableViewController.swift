//
//  MeusPacientesTableViewController.swift
//  NutriDesk
//
//  Created by Julia Santos on 10/07/19.
//  Copyright © 2019 Julia Santos. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications

class MeusPacientesTableViewController: UITableViewController {

    let container = NSPersistentContainer(name: "NutriDesk")
    
    var appDelegate = UIApplication.shared.delegate as? AppDelegate

    var userArray: [Paciente] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        self.fetchData()
        self.tableView.reloadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellNome = tableView.dequeueReusableCell(withIdentifier: "cellNome", for: indexPath)
        let nomePaciente = userArray[indexPath.row]
        cellNome.textLabel!.text = nomePaciente.nome!

        return cellNome
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.delete(userArray[indexPath.row])
            userArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            print("Deletando")
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
        } else{
            print("nao apagou")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != nil{
            if segue.identifier == "verDados"{
                (segue.destination as! DadosPacienteTableViewController).userIndex = tableView.indexPathForSelectedRow!.row
            }
        }
    }
    
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
