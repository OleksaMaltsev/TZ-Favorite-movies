//
//  Model.swift
//  TZ for Exitek
//
//  Created by Sasha Leon on 31.08.2022.
//

import UIKit

var SetMovies = [String:Int]()
var ArrayMoviesTitle = [String]()
var ArrayMoviesYears = [Int]()

class Movies {
    
    static func addMovie(movie: String, year: Int) {
       
        SetMovies[movie] = year
        for (key, value) in SetMovies {
            if !ArrayMoviesTitle.contains(key) {
                ArrayMoviesTitle.append(key)
                ArrayMoviesYears.append(value)
            } else {
                let alert = UIAlertController(title: "Error", message: "This movie already exists.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                //present(alert, animated: true, completion: nil)
            }
        }
    }
}

