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
    var nextQuestionButton = UIButton()
    var endPlay = UIButton()
    var logoImageView: UIImageView!
    var logo: UIImage = UIImage(named: "logo")!
    
    
    private var gameSession: GameSession? = GameSession()
    
   
    func addComponents() {
        
        
        questionLabel = UILabel(frame: CGRect(x: 25, y: 100, width: 350, height: 50))
        questionLabel.text = "Вопрос"
        questionLabel.textColor = .white
        questionLabel.font = UIFont.systemFont(ofSize: 20)      // размер шрифта
        questionLabel.numberOfLines = 0         // Перенос длинного текста на другую строку
        self.view.addSubview(questionLabel)
        
        
        oneAnswerButton = UIButton(frame: CGRect(x: 25, y: 250, width: 275, height: 50))
        oneAnswerButton.tag = 1
        oneAnswerButton.layer.opacity = 0.8
        oneAnswerButton.layer.cornerRadius = 50
        oneAnswerButton.layer.borderWidth = 3
        oneAnswerButton.layer.borderColor = UIColor.white.cgColor
        oneAnswerButton.addTarget(self, action: #selector(pressButton(_:)), for: .touchUpInside)
       
        self.view.addSubview(oneAnswerButton)
    
        twoAnswerButton = UIButton(frame: CGRect(x: 25, y: 305, width: 275, height: 50))
        twoAnswerButton.tag = 2
        twoAnswerButton.layer.opacity = 0.8
        twoAnswerButton.layer.cornerRadius = 50
        twoAnswerButton.layer.borderWidth = 3
        twoAnswerButton.layer.borderColor = UIColor.white.cgColor
        twoAnswerButton.addTarget(self, action: #selector(pressButton(_:)), for: .touchUpInside)
        self.view.addSubview(twoAnswerButton)
    
        threeAnswerButton = UIButton(frame: CGRect(x: 25, y: 360, width: 275, height: 50))
        threeAnswerButton.tag = 3
        threeAnswerButton.layer.opacity = 0.8
        threeAnswerButton.layer.cornerRadius = 50
        threeAnswerButton.layer.borderWidth = 3
        threeAnswerButton.layer.borderColor = UIColor.white.cgColor
        threeAnswerButton.addTarget(self, action: #selector(pressButton(_:)), for: .touchUpInside)
        self.view.addSubview(threeAnswerButton)
        
        fourAnswerButton = UIButton(frame: CGRect(x: 25, y: 415, width: 275, height: 50))
        fourAnswerButton.tag = 4
        fourAnswerButton.layer.opacity = 0.8
        fourAnswerButton.layer.cornerRadius = 50
        fourAnswerButton.layer.borderWidth = 3
        fourAnswerButton.layer.borderColor = UIColor.white.cgColor
        fourAnswerButton.addTarget(self, action: #selector(pressButton(_:)), for: .touchUpInside)
        self.view.addSubview(fourAnswerButton)
        
        nextQuestionButton = UIButton(frame: CGRect(x: 25, y: 470, width: 50, height: 50))
        nextQuestionButton.backgroundColor = .systemOrange
        nextQuestionButton.setTitle("Следующий вопрос", for: .normal)
        nextQuestionButton.titleLabel?.font = UIFont(name: "Arial", size: 15)
        nextQuestionButton.layer.cornerRadius = 20
        nextQuestionButton.layer.borderWidth = 3
        nextQuestionButton.layer.borderColor = UIColor.white.cgColor
        nextQuestionButton.addTarget(self, action: #selector(pressButtonNextQuestion(_:)), for: .touchUpInside)
        self.view.addSubview(nextQuestionButton)
        
        endPlay = UIButton(frame: CGRect(x: 25, y: 525, width: 50, height: 50))
        
        
        endPlay.addTarget(self, action: #selector(pressEndPlay(_:)), for: .touchUpInside)
        self.view.addSubview(endPlay)
        
        logoImageView = UIImageView(frame: CGRect(x: 25, y: 525, width: 50, height: 50))
        self.view.addSubview(logoImageView)
        logoImageView.image = logo
        self.view.insertSubview(logoImageView, belowSubview: oneAnswerButton)   // отправил logo ниже кнопок
        logoImageView.layer.opacity = 0.3
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
        
        nextQuestionButton.translatesAutoresizingMaskIntoConstraints = false
        let rightAnchorNextQuestionButton = nextQuestionButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15)
        let topAnchorNextQuestionButton = nextQuestionButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 670)
        let heightAnchorNextQuestionButton = nextQuestionButton.heightAnchor.constraint(equalToConstant: 50)
        let leftAnchorNextQuestionButton = nextQuestionButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 215)
        
        endPlay.translatesAutoresizingMaskIntoConstraints = false
        let rightAnchorEndPlay = endPlay.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -215)
        let topAnchorEndPlay = endPlay.topAnchor.constraint(equalTo: view.topAnchor, constant: 670)
        let heightAnchorEndPlay = endPlay.heightAnchor.constraint(equalToConstant: 50)
        let leftAnchorEndPlay = endPlay.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15)
        
        
        
        logoImageView?.translatesAutoresizingMaskIntoConstraints = false
        logoImageView?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView?.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
       NSLayoutConstraint.activate([rightAnchor, leftAnchor, topAnchor, heightAnchor, leftAnchorTwoAnswerButton, rightAnchorTwoAnswerButton, topAnchorTwoAnswerButton, heightAnchorTwoAnswerButton, leftAnchorThreeAnswerButton, rightAnchorThreeAnswerButton, topAnchorThreeAnswerButton, heightAnchorThreeAnswerButton, leftAnchorFourAnswerButton, rightAnchorFourAnswerButton, topAnchorFourAnswerButton, heightAnchorFourAnswerButton, rightAnchorNextQuestionButton, topAnchorNextQuestionButton, heightAnchorNextQuestionButton, leftAnchorNextQuestionButton, rightAnchorEndPlay, topAnchorEndPlay, heightAnchorEndPlay, leftAnchorEndPlay])      // активирую все констрейнты
    }
    
    @objc func pressEndPlay(_ sender: UIButton) {
        dismiss(animated: true, completion: { [self] in
            game.addRecord(record: Record(score: self.gameSession?.score ?? 0, date: self.gameSession?.date))
            delegate?.returnLastGameResult(gameSession: self.gameSession)
            gameSession = nil
                  })
    }
    
    
    
    
    @objc func pressButtonNextQuestion(_ sener: UIButton) {
        configureActualQuestion()
    }
  

   
    
    
    @objc func pressButton(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            isAnswerRigth(sender: oneAnswerButton)
        case 2:
            isAnswerRigth(sender: twoAnswerButton)
        case 3:
            isAnswerRigth(sender: threeAnswerButton)
        case 4:
            isAnswerRigth(sender: fourAnswerButton)
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
    
    
    
    
    private func isAnswerRigth(sender button: UIButton) {
        if let answer = button.titleLabel?.text, let question = gameSession?.question {
            if question.isAnswerTrue(userAnswer: answer) {
                gameSession?.score += 10
                
                greenButton(button)
                
            } else {
                
                self.redButton(button)
             
                
                
                
                UIView.animate(withDuration: 0.5, delay: 1, animations: { [self] in
                    endPlay.backgroundColor = .systemCyan
                    endPlay.layer.cornerRadius = 20
                    endPlay.layer.borderWidth = 3
                    endPlay.layer.borderColor = UIColor.white.cgColor
                }, completion: { _ in
                UIView.animate(withDuration: 0.5, animations: { [self] in
                    nextQuestionButton.isHidden = true
                    endPlay.setTitle("Завершить игру", for: .normal)
                    oneAnswerButton.isEnabled = false
                    twoAnswerButton.isEnabled = false
                    threeAnswerButton.isEnabled = false
                    fourAnswerButton.isEnabled = false
                    })
                })
    
            }
        }
    }
    
    
    
    
    func greenButton(_ sender: UIButton) {
        switch sender.tag {
        case 1:  UIView.animate(withDuration: 0.1, delay: 0.5, animations: {
            self.oneAnswerButton.backgroundColor = .systemGreen })
        case 2:  UIView.animate(withDuration: 0.1, delay: 0.5, animations: {
            self.twoAnswerButton.backgroundColor = .systemGreen })
        case 3:  UIView.animate(withDuration: 0.1, delay: 0.5, animations: {
            self.threeAnswerButton.backgroundColor = .systemGreen })
        case 4:  UIView.animate(withDuration: 0.1, delay: 0.5, animations: {
            self.fourAnswerButton.backgroundColor = .systemGreen })
        default:
            break
        }
    }
    
    
    func redButton(_ sender: UIButton) {
        switch sender.tag {
        case 1:  UIView.animate(withDuration: 0.5, delay: 0.5, animations: {
            self.oneAnswerButton.backgroundColor = .systemRed })
        case 2:  UIView.animate(withDuration: 0.5, delay: 0.5, animations: {
            self.twoAnswerButton.backgroundColor = .systemRed })
        case 3:  UIView.animate(withDuration: 0.5, delay: 0.5, animations: {
            self.threeAnswerButton.backgroundColor = .systemRed })
        case 4:  UIView.animate(withDuration: 0.5, delay: 0.5, animations: {
            self.fourAnswerButton.backgroundColor = .systemRed })
        default:
            break
        }
    }
    
    
 
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        addComponents()
        configureActualQuestion()
        game.gameSession = gameSession
    }
    


}



protocol LastGameResultProtocol {
    func returnLastGameResult(gameSession: GameSession?)
}
