//
//  ContentView.swift
//  Regular Expression Test
//
//  Created by Shin Inaba on 2021/04/12.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var regularExpressionData: RegularExpressionData
    
    var testStrings:[String] = []
    var body: some View {
        NavigationView {
            Form {
                RegularExpression()
                Section() {
                    Text("Result")
//                    Text(self.regularExpressionData.regularExpression)
                    ForEach(0..<self.regularExpressionData.checks.count) { index in
                        TestString(index: index)
                    }
                }
            }
            .navigationBarTitle("Test", displayMode: .inline)
            .navigationBarItems(leading: AddButton(), trailing: EditButton())
            .onAppear { UITableView.appearance().separatorStyle = .none }
            .onDisappear { UITableView.appearance().separatorStyle = .singleLine }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .environment(\.locale, .init(identifier: "ja"))
    }
}

struct RegularExpression: View {
    @EnvironmentObject var regularExpressionData: RegularExpressionData

    var body: some View {
        HStack() {
            if self.regularExpressionData.regularExpression.check == true {
                CheckView(color: Color.green)
            }
            else {
                CheckView(color: Color.red)
            }
            TextField("Regular Expression",
                      text: self.$regularExpressionData.regularExpression.testString,
                      onEditingChanged: {begin in print(begin)},
                      onCommit: {
                        self.regularExpressionData.checkRegularExpression()
                        self.regularExpressionData.chekcTestString()
                      })
                .textFieldStyle(RoundedBorderTextFieldStyle())
//            Button(action: {}, label: {
//                Image(systemName: "clear")
//            })
        }
    }
}

struct TestString: View {
    @EnvironmentObject var regularExpressionData: RegularExpressionData
    @State var text: String = ""
    var index: Int

    var body: some View {
        HStack() {
            if self.regularExpressionData.checks[self.index].check == true {
                CheckView(color: Color.green)
            }
            else {
                CheckView(color: Color.red)
            }
            TextField("Test String",
                      text: self.$regularExpressionData.checks[index].testString,
                      onEditingChanged: {begin in print(begin)},
                      onCommit: {
                        self.regularExpressionData.checkRegularExpression()
                        self.regularExpressionData.chekcTestString()
                      })
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

struct AddButton: View {
    var body: some View {
        Button(action: {}, label: {
            Image(systemName: "plus")
        })
    }
}

struct CheckView: View {
    var color: Color
    
    var body: some View {
        Image(systemName: "square.fill")
            .padding(8.0)
            .foregroundColor(self.color)
            .scaleEffect(2)
    }
}
