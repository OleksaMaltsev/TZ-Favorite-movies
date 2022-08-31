//
//  ViewController.swift
//  TZ for Exitek
//
//  Created by Sasha Leon on 31.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var movieTitle: UITextField!
    @IBOutlet weak var yearOfTheFilm: UITextField!
    @IBOutlet weak var movieTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // the first textField for movie title
        movieTitle.placeholder = "Movie title"
        movieTitle.autocapitalizationType = .words
        movieTitle.autocorrectionType = .no
        movieTitle.returnKeyType = .done

        // the second textField for year of the Film
        yearOfTheFilm.placeholder = "The year of the movie"
        yearOfTheFilm.keyboardType = .numberPad

        
        // table view
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTitle.delegate = self
    }
    
    
    @IBAction func addMovie(_ sender: UIButton) {
        let movie = movieTitle.text?.trimmingCharacters(in: .whitespaces)
        let year = Int(yearOfTheFilm.text ?? "0")
        
        if let movieText = movie, let yearText = year {
            // alert duplicate
            if ArrayMoviesTitle.contains(movieText) {
                let alert = UIAlertController(title: "Error", message: "This movie already exists.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            Movies.addMovie(movie: movieText, year: yearText)
        } else {
            // alert incorrect movie text or year int
            let alert = UIAlertController(title: "Error", message: "Enter text and year in the correct form.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        movieTableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SetMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        cell.textLabel?.text = "\(ArrayMoviesTitle[indexPath.row]) \(ArrayMoviesYears[indexPath.row])"
        cell.selectionStyle = .none
        return cell
    }
    // hide the keyboard after typing
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
