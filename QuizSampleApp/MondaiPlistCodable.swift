//
//  MondaiPlistCodable.swift
//  QuizSampleApp
//
//  Created by 高橋直也 on 2020/02/23.
//  Copyright © 2020 高橋直也. All rights reserved.
//

import Foundation

struct mondai: Codable {
    let Oya: Array<number>
}

struct number: Codable {
    let Questionsentence: String
    let Choices: Array<String>
    let Correctanswer: Int
}
