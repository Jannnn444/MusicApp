//
//  ViewController.swift
//  MyMusicApp
//
//  Created by yucian huang on 2023/11/4.

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var songImageView: UIImageView!
    @IBOutlet weak var singerNameLabel: UILabel!
    @IBOutlet weak var lyricsLabel: UILabel!
    @IBOutlet weak var songSegmentedControl: UISegmentedControl!
    @IBOutlet weak var songPageControl: UIPageControl!
    @IBOutlet weak var playControl: UIButton!
    
    var player : AVAudioPlayer!
    var index = 0
    let songs = [
        Song(name: "21", singer: "Gracie Abrams", lyrics: "I missed your twenty-first birthday \n I've been up at home \n Almost tried to call you, \n don't know if I should \n Hate to picture you half-drunk happy \n Hate to think you went out without me \n I'm sorry if you blame me if I were you I would \n Thought you'd see it coming, but you never could \n I still haven't heard from your family \n But you said your mom always loved me \n Sometimes I go blurry-eyed \n Small talk and you tell me that you're on fire \n Lights on and it's black and white, I couldn't stay forever \n I see the look in your eye and I'm biting my tonguen \n  You'd be the love of my life when I was young", pic: "21"),
        Song(name: "turnaround", singer: "The West life", lyrics: "Some people are lucky baby \n I guess I am too \n Love found me \n And I found you \n And every time I think it can't get better \n You do something new \n And I'm renewed", pic: "turnaround"),
        Song(name: "theateam", singer: "Birdy", lyrics: "White lips, pale face \n Breathin' in the snowflakes \n Burnt lungs, sour taste \n Light's gone, days end \n Struggling to pay rent \n Long nights, strange men", pic: "theateam")
       ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        singerNameLabel.text = "Gracie Abram"
        lyricsLabel.text = "I missed your twenty-first birthday \n I've been up at home \n Almost tried to call you, \n don't know if I should \n Hate to picture you half-drunk happy \n Hate to think you went out without me \n I'm sorry if you blame me if I were you I would \n Thought you'd see it coming, but you never could \n I still haven't heard from your family"
    }

    func updateUI() {
        let song = songs[index]
        songImageView.image = UIImage(named: song.pic)
        lyricsLabel.text = song.lyrics
        singerNameLabel.text = song.singer
        songSegmentedControl.selectedSegmentIndex = index
        songPageControl.currentPage = index
        playSound(index: index)
        
        
    }
    
    @IBAction func selectAlbum(_ sender: UISegmentedControl) {
        
        index = songSegmentedControl.selectedSegmentIndex
        updateUI()
    }
    
    
    @IBAction func changePageControl(_ sender: UIPageControl) {
        index = songPageControl.currentPage
        updateUI()
    }
    
    @IBAction func next(_ sender: UIButton) {
        index = index + 1 //index += 1
        if index == songs.count {
            index = 0
        }
        updateUI()
    }
    @IBAction func pre(_ sender: UIButton) {
        index -= 1
        if index < 0 {
            index = songs.count - 1
        }
        updateUI()
    }
    @IBAction func play(_ sender: UIButton) {
        
            playSound(index: index)
            updateUI()
         
    }
    func playSound(index: Int) {
        let selectedSong = songs[index]
        let url = Bundle.main.url(forResource: selectedSong.name, withExtension: "mp3")!
        player = try! AVAudioPlayer(contentsOf: url)
        player!.play()
            
        }
}

