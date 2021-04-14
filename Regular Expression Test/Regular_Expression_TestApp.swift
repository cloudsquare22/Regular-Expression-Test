//
//  Regular_Expression_TestApp.swift
//  Regular Expression Test
//
//  Created by Shin Inaba on 2021/04/12.
//

import SwiftUI

@main
struct Regular_Expression_TestApp: App {
    let regularExpressionData: RegularExpressionData = RegularExpressionData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(self.regularExpressionData)
                .environmentObject(self.regularExpressionData.regularExpression)            
        }
    }
}
