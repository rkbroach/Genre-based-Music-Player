//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Rohan Kevin Broach on 6/10/19.
//  Copyright © 2019 rkbroach. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {
    
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    
    @IBAction func genreButtonTapped(_ sender: UIButton) {
        
        MPMediaLibrary.requestAuthorization {
            (status) in
                if status == .authorized {
                     self.playGenre(genre: sender.currentTitle!)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    
    func playGenre(genre : String) {
        
        musicPlayer.stop() // Stop currently playing
        
        // query to find the genre
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        // apply query
        query.addFilterPredicate(predicate)
        
        // queue and play
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
    
}

