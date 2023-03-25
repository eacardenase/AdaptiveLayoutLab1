//
//  ViewController.swift
//  AdaptiveLayoutLab1
//
//  Created by Edwin Cardenas on 3/25/23.
//

import UIKit

class ViewController: UIViewController {
    
    var topAnchorConstraint = NSLayoutConstraint()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
}

extension ViewController {
    func setupViews() {
        let label = UILabel()
        let button = UIButton()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Watch me!"
        label.font = UIFont.systemFont(ofSize: 32)
        label.backgroundColor = .yellow
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Up/Down", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .primaryActionTriggered)
        
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .capsule
        
        button.configuration = config
        
        view.addSubview(label)
        view.addSubview(button)
        
        // constraint we are going to alter
        topAnchorConstraint = label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80)
        topAnchorConstraint.isActive = true
        
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        if topAnchorConstraint.constant == 80 {
            topAnchorConstraint.constant = 80 * 2
        } else {
            topAnchorConstraint.constant = 80
        }
    }
}
