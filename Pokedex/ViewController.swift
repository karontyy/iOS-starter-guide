//
//  ViewController.swift
//  Pokedex
//
//  Created by Guilherme Berson on 23/04/21.
//

import UIKit
import Alamofire


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var URL_BASE = "https://pokeapi.co/api/v2/"
    
    var items: [Result] = []
            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //nib da TableViewCell
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TableViewCell")
        
        //Para as funções da tableview
        tableView.delegate = self
        tableView.dataSource = self
        
        //Chamada das funções
        fetchPokemons()
    }
    
    //MARK: - FUNCS
    func fetchPokemons(){
        AF.request(URL_BASE + "/pokemon")
            .validate()
            .responseDecodable(of: Pokemon.self) { (response) in
                guard let pokemons = response.value else { return }
                self.items = pokemons.results
                self.tableView.reloadData()
        }
    }
    
    //MARK: - Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsViewController = storyboard?.instantiateViewController(identifier: "details") as! DetailsViewController
        detailsViewController.urlPassed = items[indexPath.row].url
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
    //MARK: - DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let item = items[indexPath.row]
        cell.name?.text = item.name.uppercased()
        cell.photo?.load(urlString: "https://cdn-0.imagensemoldes.com.br/wp-content/uploads/2020/04/Logo-Pokebola-Pok%C3%A9mon-PNG.png")
        return cell
    }
}

