//
//  ViewController.swift
//  Xylophone
//
//  Created by Daniel on 27.06.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    let buttonC = DNButton(title: "C", color: .systemRed, font: .boldSystemFont(ofSize: 40))
    
    let buttonD: UIButton = {
        let buttonD = UIButton()
        buttonD.setTitle("D", for: .normal)
        buttonD.backgroundColor = .systemOrange
        buttonD.titleLabel?.font = .boldSystemFont(ofSize: 40)
        buttonD.layer.cornerRadius = 16
        return buttonD
    }()
    
    let buttonE : UIButton = {
        let buttonE = UIButton()
        buttonE.setTitle("E", for: .normal)
        buttonE.backgroundColor = .systemYellow
        buttonE.titleLabel?.font = .boldSystemFont(ofSize: 40)
        buttonE.layer.cornerRadius = 16
        return buttonE
    }()
    
    let buttonF = DNButton(title: "F", color: .systemGreen, font: .boldSystemFont(ofSize: 40))
    let buttonG = DNButton(title: "G", color: .systemIndigo, font: .boldSystemFont(ofSize: 40))
    let buttonA = DNButton(title: "A", color: .systemBlue, font: .boldSystemFont(ofSize: 40))
    let buttonB = DNButton(title: "B", color: .systemPurple, font: .boldSystemFont(ofSize: 40))
    
    @objc
    func keyPressed(_ sender: UIButton){
        playSound(sender.titleLabel!.text!)
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            sender.alpha = 1
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let stack = UIStackView(arrangedSubviews: [
            buttonC,
            buttonD,
            buttonE,
            buttonF,
            buttonG,
            buttonA,
            buttonB
        ])
        stack.axis = .vertical
        stack.spacing = 5
        stack.distribution = .fillEqually
        stack.alignment = .center
        
        buttonC.addTarget(self, action: #selector(keyPressed), for: .touchDown)
        buttonD.addTarget(self, action: #selector(keyPressed), for: .touchDown)
        buttonE.addTarget(self, action: #selector(keyPressed), for: .touchDown)
        buttonF.addTarget(self, action: #selector(keyPressed), for: .touchDown)
        buttonG.addTarget(self, action: #selector(keyPressed), for: .touchDown)
        buttonA.addTarget(self, action: #selector(keyPressed), for: .touchDown)
        buttonB.addTarget(self, action: #selector(keyPressed), for: .touchDown)
        
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonC.widthAnchor.constraint(equalToConstant: view.frame.width - 10),
            buttonD.widthAnchor.constraint(equalToConstant: view.frame.width - 30),
            buttonE.widthAnchor.constraint(equalToConstant: view.frame.width - 50),
            buttonF.widthAnchor.constraint(equalToConstant: view.frame.width - 70),
            buttonG.widthAnchor.constraint(equalToConstant: view.frame.width - 90),
            buttonA.widthAnchor.constraint(equalToConstant: view.frame.width - 110),
            buttonB.widthAnchor.constraint(equalToConstant: view.frame.width - 130),
            
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
    }
    
    func playSound(_ name: String) {
        let url = Bundle.main.url(forResource: name, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
