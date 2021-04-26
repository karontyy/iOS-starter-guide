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
    var selectedItem: Result?
    var urlClick: Any?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        fetchPokemons()
    }
    
    //MARK: - FUNCS
    func fetchPokemons(){
        AF.request(URL_BASE + "/pokemon")
            .validate()
            .responseDecodable(of: Pokemon.self) { (response) in
          guard let pokemons = response.value else { return }
                self.items = pokemons.results
                for i in self.items {
                    self.fetchPokemonsDetail(i.url)
                }
                
                self.tableView.reloadData()
        }
    }
    
    func fetchPokemonsDetail(_ urlDetail: String) {
        AF.request(urlDetail)
            .validate()
            .responseDecodable(of: DetailPokemon.self) {(response) in
                print(try! response.result.get().sprites.front_default)
            }
        }

    
    //MARK: - Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

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
        cell.name?.text = item.name
        cell.photo?.backgroundColor = .green
        return cell
    }
}
