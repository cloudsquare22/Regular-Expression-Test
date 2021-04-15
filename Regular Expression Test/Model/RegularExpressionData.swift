//
//  RegularExpressionData.swift
//  Regular Expression Test
//
//  Created by Shin Inaba on 2021/04/12.
//

import SwiftUI

class RegularExpressionData: ObservableObject {
    @Published var regularExpression: CheckRegularExpression
    @Published var checks: [CheckRegularExpression]
    
    init() {
        self.regularExpression = CheckRegularExpression()
        self.checks = []
        for _ in 1...10 {
            self.checks.append(CheckRegularExpression())
        }
    }
    
    func check() {
        do {
            let _ = try NSRegularExpression(pattern: self.regularExpression.testString)
            self.regularExpression.check = true
        }
        catch {
            self.regularExpression.check = false
        }
        for check in self.checks {
            check.check(regularExpression: self.regularExpression.testString)
        }
    }
}

class CheckRegularExpression: ObservableObject {
    @Published var check: Bool = false
    @Published var testString: String = ""
    
    func check(regularExpression: String) {
        do {
            let regularExpression = try NSRegularExpression(pattern: regularExpression)
            let matches = regularExpression.matches(in: self.testString, range: NSRange(location: 0, length: self.testString.count))
            if matches.count > 0 {
                self.check = true
            }
            else {
                self.check = false
            }
        }
        catch {
            self.check = false
        }
    }
}
