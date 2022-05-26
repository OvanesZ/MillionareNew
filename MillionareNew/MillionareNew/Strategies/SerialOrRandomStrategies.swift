//
//  SerialOrRandomStrategies.swift
//  MillionareNew
//
//  Created by Ованес Захарян on 23.05.2022.
//

import UIKit


protocol SerialOrRandomStrategy {
    func configureActualQuestions(in gameSession: GameSession?)
}


final class RandomQuestionsStrategy: SerialOrRandomStrategy {
    func configureActualQuestions(in gameSession: GameSession?) {
        guard let score = gameSession?.score else { return }
    
        switch score {
        case 0:
            gameSession?.question = QuestionEnum.allCases.randomElement()?.questions
        case 10:
            gameSession?.question = QuestionEnum.allCases.randomElement()?.questions
        case 20:
            gameSession?.question = QuestionEnum.allCases.randomElement()?.questions
        case 30:
            gameSession?.question = QuestionEnum.allCases.randomElement()?.questions
        case 40:
            gameSession?.question = QuestionEnum.allCases.randomElement()?.questions
        default:
            break
        }
    }
}

final class SerialQuestionsStrategy: SerialOrRandomStrategy {
    
    func configureActualQuestions(in gameSession: GameSession?) {
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
    }
    
    
}
