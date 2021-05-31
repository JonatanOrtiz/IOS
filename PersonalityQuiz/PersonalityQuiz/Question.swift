//
//  Question.swift
//  PersonalityQuiz
//
//  Created by Jonatan Eduardo de Araujo on 03/03/21.
//

import Foundation

struct Answer {
    var text: String
    var type: AnimalType
}

enum AnimalType: Character {
    case dog = "🐶", cat = "🐱", rabbit = "🐰", turtle = "🐢"

    var definition: String {
        switch self {
        case .dog:
            return "Você é incrivelmente extrovertido. Você se cerca das pessoas que ama e gosta de atividades com seus amigos."
        case .cat:
            return "Maligno, mas calmo, você gosta de fazer as coisas do seu jeito."
        case .rabbit:
            return "Você ama tudo que é macio. Você é saudável e cheio de energia."
        case .turtle:
            return "Você é sábio além da sua idade e se concentra nos detalhes. Você ganha a corrida indo devagar e sempre."
        }
    }
}

enum ResponseType {
    case single, multiple, ranged
}

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}
