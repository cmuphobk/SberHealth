//
//  Codable.swift
//  SHDesignSystem
//
//  Created by docdoc on 24.10.2022.
//

import Foundation

struct UserAnswers: Codable {
    let data: [UserAnswer]
}

struct UserAnswersResponse: Codable {
    let attributes: [UserAnswer]
}

struct UserAnswer: Codable {
    let id: Int
    let name: String
    /// Значения которые выбрал user из списка values
    let values: [AnswerValue]
    /// Значения которые заполнил user в блоках для ввода (user_input: single, multiple)
    let customs: [AnswerCustom]

    struct AnswerValue: Codable {
        let id: Int
        let value: String
        let parentId: Int?
    }

    struct AnswerCustom: Codable {
        let value: String
    }
}
