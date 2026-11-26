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
    @AppStorage("isTipsOn") var isTipsOn = true
    @AppStorage("isTrueNorthOn") var isTrueNorthOn = false

    var body: some View {
        VStack(spacing: 75){
            VStack{
                Toggle("Haptics", isOn: $isHapticsOn)
                    .padding()
                    .dynamicTypeSize(.xxxLarge)
                    .bold()
            }
            .padding(.horizontal)
            .background(Color(.secondarySystemGroupedBackground))
            .clipShape(RoundedRectangle(cornerRadius: 150))
            .shadow(radius: 100)
            VStack{
                Toggle("Useful Tips", isOn: $isTipsOn)
                    .padding()
                    .dynamicTypeSize(.xxxLarge)
                    .bold()
            }
            .padding(.horizontal)
            .background(Color(.secondarySystemGroupedBackground))
            .clipShape(RoundedRectangle(cornerRadius: 150))
            .shadow(radius: 100)
            VStack{
                Toggle("True North", isOn: $isTrueNorthOn)
                    .padding()
                    .dynamicTypeSize(.xxxLarge)
                    .bold()
            }
            .padding(.horizontal)
            .background(Color(.secondarySystemGroupedBackground))
            .clipShape(RoundedRectangle(cornerRadius: 150))
            .shadow(radius: 100)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(radius: 25)
        .padding()
        Spacer()
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
