//
//  GameViewController.swift
//  MillionareNew
//
//  Created by Ованес Захарян on 14.05.2022.
//

import UIKit

class GameViewController: UIViewController {
    
    
    var oneAnswerButton = UIButton()
    var twoAnswerButton = UIButton()
    var threeAnswerButton = UIButton()
    var fourAnswerButton = UIButton()
    var questionLabel = UILabel()
    
    
    func addButtons() {
        
        
    questionLabel = UILabel(frame: CGRect(x: 25, y: 100, width: 350, height: 50))
    questionLabel.text = "Вопрос"
    self.view.addSubview(questionLabel)
        
        
    oneAnswerButton = UIButton(frame: CGRect(x: 25, y: 250, width: 275, height: 50))
    oneAnswerButton.setTitle("ответ 1", for: .normal)
    oneAnswerButton.backgroundColor = .gray
    oneAnswerButton.tag = 1
    oneAnswerButton.addTarget(self, action: #selector(pressButton(_:)), for: .touchUpInside)
    self.view.addSubview(oneAnswerButton)
    
    twoAnswerButton = UIButton(frame: CGRect(x: 25, y: 305, width: 275, height: 50))
    twoAnswerButton.setTitle("ответ 2", for: .normal)
    twoAnswerButton.backgroundColor = .gray
    twoAnswerButton.tag = 2
    twoAnswerButton.addTarget(self, action: #selector(pressButton(_:)), for: .touchUpInside)
    self.view.addSubview(twoAnswerButton)
    
    threeAnswerButton = UIButton(frame: CGRect(x: 25, y: 360, width: 275, height: 50))
    threeAnswerButton.setTitle("ответ 3", for: .normal)
    threeAnswerButton.backgroundColor = .gray
    threeAnswerButton.tag = 3
    threeAnswerButton.addTarget(self, action: #selector(pressButton(_:)), for: .touchUpInside)
    self.view.addSubview(threeAnswerButton)
    
    fourAnswerButton = UIButton(frame: CGRect(x: 25, y: 415, width: 275, height: 50))
    fourAnswerButton.setTitle("ответ 4", for: .normal)
    fourAnswerButton.backgroundColor = .gray
    fourAnswerButton.tag = 4
    fourAnswerButton.addTarget(self, action: #selector(pressButton(_:)), for: .touchUpInside)
    self.view.addSubview(fourAnswerButton)
}
    
    
    
    @objc func pressButton(_ sender: UIButton) {
        
    }
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        addButtons()
    }
    


}
