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
    @AppStorage("isHapticsOn") var isHapticsOn = true
    @AppStorage("isTipsOn") var isTipsOn = true
    @AppStorage("isTrueNorthOn") var isTrueNorthOn = false
    @AppStorage("isDarkMode") var isDarkmode = false

    var body: some View {
        VStack(spacing: 50){
            VStack{
                HStack{
                    Image(systemName: "moon.fill")
                        .padding()
                    Toggle("Dark Mode", isOn: $isDarkmode)
                        .padding()
                        .dynamicTypeSize(.xxxLarge)
                        .bold()
                }
            }
            .padding(.horizontal)
            .background(Color(.tertiarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 150))
            .shadow(radius: 100)
        }
        .padding()
        .background(Color(.secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(radius: 25)
        .padding()
        
        VStack(spacing: 50){
            VStack{
                HStack{
                    Image(systemName: "iphone.radiowaves.left.and.right")
                        .padding()
                    Toggle("Haptics", isOn: $isHapticsOn)
                        .padding()
                        .dynamicTypeSize(.xxxLarge)
                        .bold()
                }
            }
            .padding(.horizontal)
            .background(Color(.tertiarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 150))
            .shadow(radius: 100)
            VStack{
                HStack{
                    Image(systemName: "info.circle")
                        .padding()
                    Toggle("Useful Tips", isOn: $isTipsOn)
                        .padding()
                        .dynamicTypeSize(.xxxLarge)
                        .bold()
                }
            }
            .padding(.horizontal)
            .background(Color(.tertiarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 150))
            .shadow(radius: 100)
            VStack{
                HStack{
                    Image(systemName: "location.north.circle")
                        .padding()
                    Toggle("True North", isOn: $isTrueNorthOn)
                        .padding()
                        .dynamicTypeSize(.xxxLarge)
                        .bold()
                }
            }
            .padding(.horizontal)
            .background(Color(.tertiarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 150))
            .shadow(radius: 100)
        }
        .padding()
        .background(Color(.secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(radius: 25)
        .padding()
        Spacer()
        Spacer()
            .preferredColorScheme(isDarkmode ? .dark : .light)

    }
}

struct topContainer: View {
    var body: some View{
        Text("Settings")
            .padding(.top)
            .dynamicTypeSize(.accessibility4)
            .bold()
        Spacer()
    }
}

#Preview {
    appSettings()
}
