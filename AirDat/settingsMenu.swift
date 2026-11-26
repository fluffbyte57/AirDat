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
        mainBody()
    }
}

struct mainBody: View {
    @AppStorage("isHapticsOn") var isHapticsOn = false

    var body: some View {
        VStack(spacing: 20){
            Toggle("Haptics", isOn: $isHapticsOn)
        }
        Spacer()
    }
}

struct topContainer: View {
    var body: some View{
        Text("Settings")
            .padding(.top)
            .dynamicTypeSize(.accessibility2)
            .bold()
        Spacer()
    }
}

#Preview {
    appSettings()
}
