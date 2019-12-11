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
    
    var filter: [Paciente] = []
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.fetchData()
        self.tableView.reloadData()
        
        navigationItem.hidesSearchBarWhenScrolling  = false
        navigationItem.searchController = searchController
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.tintColor = #colorLiteral(red: 0.7842261195, green: 0.2227489948, blue: 0.1612006426, alpha: 1)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Pesquisar paciente"
        
        definesPresentationContext = true
        
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if pesquisa(){
            return filter.count
        }
        return userArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellNome = tableView.dequeueReusableCell(withIdentifier: "cellNome", for: indexPath)
        let nomePaciente = userArray[indexPath.row]
        cellNome.textLabel!.text = nomePaciente.nome!
        
        if pesquisa(){
            let nomePacienteSearch = filter[indexPath.row]
            cellNome.textLabel!.text = nomePacienteSearch.nome
        }
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
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func pesquisa() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    func filterContent(searchText: String) {
        filter = userArray.filter { $0.nome!.lowercased().contains(searchText.lowercased()) }
        
        tableView.reloadData()
    }
}
extension MeusPacientesTableViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        filterContent(searchText: searchController.searchBar.text!)
    }
}
