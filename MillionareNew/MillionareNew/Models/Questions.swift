//
//  Questions.swift
//  MillionareNew
//
//  Created by Ованес Захарян on 14.05.2022.
//

import UIKit

struct Questions {
    var question: String
    var firstAnswer: String
    var secondAnswer: String
    var thirdAnswer: String
    var fourthAnswer: String
    var trueAnswer: String


    func isAnswerTrue(userAnswer: String) -> Bool {
        return userAnswer == trueAnswer
    }

}





enum QuestionEnum {
    case first
    case second
    case third
    case fourth
    case fifth
    
    
    var questions: Questions {
        switch self {
        case .first:
            return Questions(question: "Какой автомобиль разработан в России?", firstAnswer: "Мерседес", secondAnswer: "Ауди", thirdAnswer: "Лада", fourthAnswer: "Ниссан", trueAnswer: "Лада")
        case .second:
            return Questions(question: "Национальная валюта России?", firstAnswer: "Рубль", secondAnswer: "Доллар", thirdAnswer: "Евро", fourthAnswer: "Юань", trueAnswer: "Рубль")
        case .third:
            return Questions(question: "Единица измерения напряжения?", firstAnswer: "Ватт", secondAnswer: "Вольт", thirdAnswer: "Ампер", fourthAnswer: "Метр", trueAnswer: "Вольт")
        case .fourth:
            return Questions(question: "Какая из планет солнечной системы самая горячая", firstAnswer: "Марс", secondAnswer: "Венера", thirdAnswer: "Юпитер", fourthAnswer: "Земля", trueAnswer: "Венера")
        case .fifth:
            return Questions(question: "Какой из этих городов вымышленный?", firstAnswer: "Миргород", secondAnswer: "Славгород", thirdAnswer: "Старгород", fourthAnswer: "Белгород", trueAnswer: "Славгород")
        }
    }
}
