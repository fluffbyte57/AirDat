//
//  settingsMenu.swift
//  AirDat
//
//  Created by Yacov Daki on 11/25/26.
//

import SwiftUI

struct appSettings: View {
    var body: some View{
        topContainer()
        Spacer()
    }
}

struct topContainer: View {
    var body: some View{
        Text("Settings")
            .padding(.top)
            .dynamicTypeSize(.accessibility2)
            .bold()
    }
}

#Preview {
    appSettings()
}
