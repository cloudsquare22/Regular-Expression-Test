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
        self.checks[0].check = true
        self.checks[2].check = true
        self.checks[4].check = true
        self.checks[6].check = true
        self.checks[8].check = true
    }
}

struct CheckRegularExpression {
    var check: Bool = false
    var testString: String = ""
}
