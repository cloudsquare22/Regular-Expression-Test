//
//  RegularExpressionData.swift
//  Regular Expression Test
//
//  Created by Shin Inaba on 2021/04/12.
//

import SwiftUI

class RegularExpressionData: ObservableObject {
    @Published var regularExpression: String = ""
    @Published var checks: [Bool] = [Bool].init(repeating: false, count: 10)
    
    func chekcTestString() {
        self.checks[0] = true
        self.checks[2] = true
    }
}
