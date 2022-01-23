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
    @State var settingViewOn: Bool = false
    
    var testStrings:[String] = []
    var body: some View {
        NavigationView {
            Form {
                RegularExpression()
                Section() {
                    Text("Result")
//                    Text(self.regularExpressionData.regularExpression)
                    ForEach(0..<self.regularExpressionData.testStringCount, id: \.self) { index in
                        TestString(index: index)
                            .environmentObject(self.regularExpressionData.checks[index])
                    }
                }
            }
            .navigationBarTitle("Regular Expression Test", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.settingViewOn = true
            }, label: {
                Image(systemName: "info.circle").font(.title)
            }))
//            .navigationBarItems(leading: AddButton(), trailing: EditButton())
            .onAppear { UITableView.appearance().separatorStyle = .none }
            .onDisappear { UITableView.appearance().separatorStyle = .singleLine }
            .sheet(isPresented: self.$settingViewOn, onDismiss:{print("Close SettingView")}, content: {
                SettingView()
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static let regularExpressionData: RegularExpressionData = RegularExpressionData()
    static var previews: some View {
        ContentView()
            .environmentObject(ContentView_Previews.regularExpressionData)
            .environmentObject(ContentView_Previews.regularExpressionData.regularExpression)
//            .environment(\.locale, .init(identifier: "ja"))
    }
}

struct RegularExpression: View {
    @EnvironmentObject var regularExpressionData: RegularExpressionData
    @EnvironmentObject var checkRegularExpression: CheckRegularExpression

    var body: some View {
        HStack() {
            if self.checkRegularExpression.testString.isEmpty == true {
                CheckView(color: Color.gray)
            }
            else if self.checkRegularExpression.check == true {
                CheckView(color: Color.green)
            }
            else {
                CheckView(color: Color.red)
            }
            TextField("Regular Expression",
                      text: self.$checkRegularExpression.testString,
                      onEditingChanged: {begin in
//                        self.regularExpressionData.check()
                      },
                      onCommit: {
                        self.regularExpressionData.check()
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
    @EnvironmentObject var checkRegularExpression: CheckRegularExpression
    var index: Int

    var body: some View {
        HStack() {
            if self.checkRegularExpression.testString.isEmpty == true {
                CheckView(color: Color.gray)
            }
            else if self.checkRegularExpression.check == true {
                CheckView(color: Color.green)
            }
            else {
                CheckView(color: Color.red)
            }
            TextField("Test String",
                      text: self.$checkRegularExpression.testString,
                      onEditingChanged: {begin in
                        print(begin)
//                        self.regularExpressionData.check()
                      },
                      onCommit: {
                        self.regularExpressionData.check()
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
