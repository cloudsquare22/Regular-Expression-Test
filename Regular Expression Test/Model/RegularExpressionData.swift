//
//  RegularExpressionData.swift
//  Regular Expression Test
//
//  Created by Shin Inaba on 2021/04/12.
//

import SwiftUI

class RegularExpressionData: ObservableObject {
    @Published var regularExpression: CheckRegularExpression = CheckRegularExpression()
    @Published var checks: [CheckRegularExpression] = [CheckRegularExpression].init(repeating: CheckRegularExpression(), count: 10)
    
    func checkRegularExpression() {
        do {
            let _ = try NSRegularExpression(pattern: self.regularExpression.testString)
            self.regularExpression.check = true
        }
        catch {
            self.regularExpression.check = false
        }
    }
    
    func chekcTestString() {
        for check in self.checks {
            do {
                let regularExpression = try NSRegularExpression(pattern: self.regularExpression.testString)
                let matches = regularExpression.matches(in: check.testString, range: NSRange(location: 0, length: check.testString.count))
                if matches.count > 0 {
                    check.check = true
                }
            }
            catch {
                check.check = false
            }
        }
    }
}

class CheckRegularExpression {
    var check: Bool = false
    var testString: String = ""
}
