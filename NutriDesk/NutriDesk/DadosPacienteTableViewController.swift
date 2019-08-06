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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchData()
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25 // TODO: colocar número de campos dos dados do paciente
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellDados = tableView.dequeueReusableCell(withIdentifier: "cellDados", for: indexPath)
        let dadoPaciente = userArray[userIndex]
        cellDados.textLabel?.font = UIFont.systemFont(ofSize: UIFont.systemFontSize, weight: UIFont.Weight.light)
        
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
        // Return false if you do not want the specified item to be editable.
        return false
    }
}
