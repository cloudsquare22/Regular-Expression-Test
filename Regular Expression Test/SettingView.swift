//
//  SettingView.swift
//  Regular Expression Test
//
//  Created by Shin Inaba on 2021/04/16.
//

import SwiftUI

struct SettingView: View {
    let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String

    var body: some View {
        VStack {
            Image("reticon")
            Text("Regular Expression Test")
                .font(.largeTitle)
                .padding(8.0)
            Text("Version \(version)")
                .padding(8.0)
//            Spacer()
            Label("©️ 2014-2022 cloudsquare.jp", image: "cloudsquare")
                .font(.footnote)
                .padding()
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
