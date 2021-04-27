//
//  MyUIImageView.swift
//  Pokedex
//
//  Created by Guilherme Berson on 26/04/21.
//

import UIKit

class MyUIImageView: UIImageView {

    extension UIImageView {
        func loadImge(withUrl url: URL) {
               DispatchQueue.global().async { [weak self] in
                   if let imageData = try? Data(contentsOf: url) {
                       if let image = UIImage(data: imageData) {
                           DispatchQueue.main.async {
                               self?.image = image
                           }
                       }
                   }
               }
           }
    }
}
