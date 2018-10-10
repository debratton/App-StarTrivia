//
//  FilmsVC.swift
//  StarTrivia
//
//  Created by David E Bratton on 10/9/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import UIKit

// Conform to protocol in SelectPersonVC
class FilmsVC: UIViewController, PersonProtocol {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var episodeLbl: UILabel!
    @IBOutlet weak var directorLbl: UILabel!
    @IBOutlet weak var producerLbl: UILabel!
    @IBOutlet weak var releasedLbl: UILabel!
    @IBOutlet weak var messageBoxLbl: UITextView!
    @IBOutlet weak var previousBtn: FadeEnabledBtn!
    @IBOutlet weak var nextBtn: FadeEnabledBtn!
    
    var person: Person!
    let api = FilmApi()
    var films = [String]()
    var currentFilm = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        films = person.filmUrls
        previousBtn.isEnabled = false
        nextBtn.isEnabled = films.count > 1
        guard let firstFilm = films.first else { return }
        getFilm(url: firstFilm)
    }
    
    func getFilm(url: String) {
        api.getFilm(url: url) { (film) in
            if let film = film {
                self.setupView(film: film)
            }
        }
    }
    
    func setupView(film: Film) {
        titleLbl.text = film.title
        episodeLbl.text = String(film.episode)
        directorLbl.text = film.director
        producerLbl.text = film.producer
        releasedLbl.text = film.releaseDate
        let strippedA = film.crawl.replacingOccurrences(of: "\n", with: " ")
        let strippedB = strippedA.replacingOccurrences(of: "\r", with: "")
        messageBoxLbl.text = strippedB
    }
    
    @IBAction func previousPressed(_ sender: Any) {
        currentFilm -= 1
        setButtonState()
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        currentFilm += 1
        setButtonState()
    }
    
    func setButtonState() {
        nextBtn.isEnabled = currentFilm == films.count - 1 ? false : true
        previousBtn.isEnabled = currentFilm == 0 ? false : true
        getFilm(url: films[currentFilm])
    }
    
}
