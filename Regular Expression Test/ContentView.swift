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
                    Text(self.regularExpressionData.regularExpression)
                    TestString(index: 0)
                    TestString(index: 1)
                    TestString(index: 2)
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
            Image(systemName: "square.fill")
                .padding(8.0)
                .foregroundColor(Color.red)
                .scaleEffect(2)
            TextField("Regular Expression",
                      text: self.$regularExpressionData.regularExpression,
                      onEditingChanged: {begin in print(begin)},
                      onCommit: {self.regularExpressionData.chekcTestString()})
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
            if self.regularExpressionData.checks[self.index] == true {
                Image(systemName: "square.fill")
                    .padding(8.0)
                    .foregroundColor(Color.green)
                    .scaleEffect(2)
            }
            else {
                Image(systemName: "square.fill")
                    .padding(8.0)
                    .foregroundColor(Color.red)
                    .scaleEffect(2)
            }
            TextField("Test String", text: $text)
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
