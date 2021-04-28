//
//  DetailsViewController.swift
//  Pokedex
//
//  Created by Guilherme Berson on 23/04/21.
//

import UIKit
import Alamofire

class DetailsViewController: UIViewController {

    var urlPassed: String = ""
    var pokemonSelected: Details?
    
    
    @IBOutlet var imgPokemon: UIImageView!
    @IBOutlet var nome: UILabel!
    @IBOutlet var peso: UILabel!
    @IBOutlet var altura: UILabel!
    @IBOutlet var power: UILabel!
    @IBOutlet var primaryAb: UILabel!
    @IBOutlet var secondaryAb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                        
        fetchPokemonsDetail(urlPassed)
    }
    
    
    //MARK: - FUNCS
    func fetchPokemonsDetail(_ urlDetail: String) {
        AF.request(urlPassed)
            .validate()
            .responseDecodable(of: Details.self) { (response) in
                guard let details = response.value else { return }
                self.pokemonSelected = details
                self.title = self.pokemonSelected?.name
                
                guard let photo = self.pokemonSelected?.sprites else { return }
                guard let peso = self.pokemonSelected?.weight else { return }
                guard let altura = self.pokemonSelected?.height else { return }
                guard let poderBase = self.pokemonSelected?.baseExperience else { return }
                guard let habilityOne =  self.pokemonSelected?.abilities[0].ability else { return }
                guard let habilityTwo =  self.pokemonSelected?.abilities[1].ability else { return }

                
                self.imgPokemon.load(urlString: photo.frontDefault)
                self.nome.text = self.pokemonSelected?.name
                self.peso.text = String(peso) + " Kg"
                self.altura.text = String(altura) + " M"
                self.power.text = String(poderBase)
                self.primaryAb.text = habilityOne.name
                self.secondaryAb.text = habilityTwo.name
            }
        }

}
