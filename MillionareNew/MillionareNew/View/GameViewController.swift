//
//  GameViewController.swift
//  MillionareNew
//
//  Created by Ованес Захарян on 14.05.2022.
//

import UIKit

class GameViewController: UIViewController {
    
    let game = Game.shared
    var delegate: LastGameResultProtocol?
    
    var oneAnswerButton = UIButton()
    var twoAnswerButton = UIButton()
    var threeAnswerButton = UIButton()
    var fourAnswerButton = UIButton()
    var questionLabel = UILabel()
    
    private var gameSession: GameSession? = GameSession()
    
    func addButtons() {
        
        
    questionLabel = UILabel(frame: CGRect(x: 25, y: 100, width: 350, height: 50))
    questionLabel.text = "Вопрос"
        questionLabel.textColor = .orange
    self.view.addSubview(questionLabel)
        
        
    oneAnswerButton = UIButton(frame: CGRect(x: 25, y: 250, width: 275, height: 50))
    oneAnswerButton.tag = 1
    oneAnswerButton.addTarget(self, action: #selector(pressButton(_:)), for: .touchUpInside)
    self.view.addSubview(oneAnswerButton)
    
    twoAnswerButton = UIButton(frame: CGRect(x: 25, y: 305, width: 275, height: 50))
    twoAnswerButton.tag = 2
    twoAnswerButton.addTarget(self, action: #selector(pressButton(_:)), for: .touchUpInside)
    self.view.addSubview(twoAnswerButton)
    
    threeAnswerButton = UIButton(frame: CGRect(x: 25, y: 360, width: 275, height: 50))
    threeAnswerButton.tag = 3
    threeAnswerButton.addTarget(self, action: #selector(pressButton(_:)), for: .touchUpInside)
    self.view.addSubview(threeAnswerButton)
    
    fourAnswerButton = UIButton(frame: CGRect(x: 25, y: 415, width: 275, height: 50))
    fourAnswerButton.tag = 4
    fourAnswerButton.addTarget(self, action: #selector(pressButton(_:)), for: .touchUpInside)
    self.view.addSubview(fourAnswerButton)
}
    
    
    override func viewWillLayoutSubviews() {
        oneAnswerButton.translatesAutoresizingMaskIntoConstraints = false   // отключаю констрейнт перед установкой своих
       let leftAnchor = oneAnswerButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15)
       let rightAnchor = oneAnswerButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15)
       let topAnchor = oneAnswerButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 350)
       let heightAnchor = oneAnswerButton.heightAnchor.constraint(equalToConstant: 50)
     //  oneAnswerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true    // выставляю кнопку в центр по оси Х
        
        twoAnswerButton.translatesAutoresizingMaskIntoConstraints = false   // отключаю констрейнт перед установкой своих
        let leftAnchorTwoAnswerButton = twoAnswerButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15)
        let rightAnchorTwoAnswerButton = twoAnswerButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15)
        let topAnchorTwoAnswerButton = twoAnswerButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 405)
        let heightAnchorTwoAnswerButton = twoAnswerButton.heightAnchor.constraint(equalToConstant: 50)
        
        threeAnswerButton.translatesAutoresizingMaskIntoConstraints = false   // отключаю констрейнт перед установкой своих
        let leftAnchorThreeAnswerButton = threeAnswerButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15)
        let rightAnchorThreeAnswerButton = threeAnswerButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15)
        let topAnchorThreeAnswerButton = threeAnswerButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 460)
        let heightAnchorThreeAnswerButton = threeAnswerButton.heightAnchor.constraint(equalToConstant: 50)
        
        fourAnswerButton.translatesAutoresizingMaskIntoConstraints = false   // отключаю констрейнт перед установкой своих
        let leftAnchorFourAnswerButton = fourAnswerButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15)
        let rightAnchorFourAnswerButton = fourAnswerButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15)
        let topAnchorFourAnswerButton = fourAnswerButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 515)
        let heightAnchorFourAnswerButton = fourAnswerButton.heightAnchor.constraint(equalToConstant: 50)
        
       NSLayoutConstraint.activate([rightAnchor, leftAnchor, topAnchor, heightAnchor, leftAnchorTwoAnswerButton, rightAnchorTwoAnswerButton, topAnchorTwoAnswerButton, heightAnchorTwoAnswerButton, leftAnchorThreeAnswerButton, rightAnchorThreeAnswerButton, topAnchorThreeAnswerButton, heightAnchorThreeAnswerButton, leftAnchorFourAnswerButton, rightAnchorFourAnswerButton, topAnchorFourAnswerButton, heightAnchorFourAnswerButton])      // активирую все констрейнты
    }
    
    
  

   
    
    
    @objc func pressButton(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            isAnswerRigth(button: oneAnswerButton)
        case 2:
            isAnswerRigth(button: twoAnswerButton)
        case 3:
            isAnswerRigth(button: threeAnswerButton)
        case 4:
            isAnswerRigth(button: fourAnswerButton)
        default:
            return
        }
    }
    
    
    
    
    private func configureActualQuestion() {
        guard let score = gameSession?.score else { return }
        
        switch score {
        case 0:
            gameSession?.question = QuestionEnum.first.questions
        case 10:
            gameSession?.question = QuestionEnum.second.questions
        case 20:
            gameSession?.question = QuestionEnum.third.questions
        case 30:
            gameSession?.question = QuestionEnum.fourth.questions
        case 40:
            gameSession?.question = QuestionEnum.fifth.questions
        default:
            break
        }
        showNewQuestion()
    }
    
    
    
    
    private func showNewQuestion() {
        guard let gameSession = gameSession, let question = gameSession.question else { return }
            
        questionLabel.text = question.question
        oneAnswerButton.setTitle(question.firstAnswer, for: .normal)
        oneAnswerButton.backgroundColor = .lightGray
        twoAnswerButton.setTitle(question.secondAnswer, for: .normal)
        twoAnswerButton.backgroundColor = .lightGray
        threeAnswerButton.setTitle(question.thirdAnswer, for: .normal)
        threeAnswerButton.backgroundColor = .lightGray
        fourAnswerButton.setTitle(question.fourthAnswer, for: .normal)
        fourAnswerButton.backgroundColor = .lightGray
    }
    
    
    
    private func isAnswerRigth(button: UIButton) {
        if let answer = button.titleLabel?.text, let question = gameSession?.question {
            if question.isAnswerTrue(userAnswer: answer) {
                gameSession?.score += 10

//                DispatchQueue.main.async {
//                button.backgroundColor = .green
//                }
                
//                DispatchQueue.global(qos: .userInteractive).async {
//                    self.configureActualQuestion()
//                }
                configureActualQuestion()
                
            } else {
                dismiss(animated: true, completion: {
    
                    self.game.addRecord(record: Record(score: self.gameSession?.score ?? 0, date: self.gameSession?.date))
                    self.delegate?.returnLastGameResult(gameSession: self.gameSession)
                    self.gameSession = nil
                })
                    
            }
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        addButtons()
        configureActualQuestion()
        game.gameSession = gameSession
    }
    


}



protocol LastGameResultProtocol {
    func returnLastGameResult(gameSession: GameSession?)
}
