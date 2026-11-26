import SwiftUI

@Observable
class AppState{
    var ShowingRWYhdg = true
    var ishapticsOn = true
}

///@AppState var isDarkMode = false

struct ContentView: View {
    @Bindable var appState = AppState()
    
    var body: some View {
        VStack{
            topView()
            ///ScrollView(.vertical){
                VStack{
                    if appState.ShowingRWYhdg == true{
                        rwyHeadings()
                            .padding(.top)
                    }
                }
            ///}
            ///.frame(width: 375, height: 200)
        }
    }
}

struct rwyHeadings: View {
    
    @State private var compass = compassManager()
    @Bindable var appState = AppState()

    var body: some View {
        VStack{
            HStack{
                Image(systemName: "safari")
                    .padding(.top)
                if appState.ishapticsOn == true{
                    Text("Current Heading: \(compass.mgHeadingFormatted)")
                        .multilineTextAlignment(.center)
                        .font(.title2)
                        .bold()
                        .padding(.top)
                        .sensoryFeedback(.selection, trigger: compass.mgHeadingFormatted)
                }else{
                    Text("Current Heading: \(compass.mgHeadingFormatted)")
                        .multilineTextAlignment(.center)
                        .font(.title2)
                        .bold()
                        .padding(.top)
                }
                Image(systemName: "safari")
                    .padding(.top)
            }
            .padding(.top)
            Image("RunwayVectorPNG")
                .resizable()
                .frame(width: 300, height: 250)
                .shadow(radius: 5)
            VStack{
                Text("Runway number:")
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .bold()
                Text(compass.rwyHeading)
                    .foregroundStyle(.yellow)
                    .shadow(radius: 1)
                    .dynamicTypeSize(.accessibility3)
                    .padding(.bottom)
            }
        }
        .padding()
        .frame(width: 350, height: 400)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(radius: 15)
        Spacer()
    }
}

struct topView: View {
    @AppStorage("isDarkMode") var isDarkmode = false
    
    var body: some View {
        HStack(spacing: 75){
            
            Button(action: {if isDarkmode == true{
                isDarkmode = false
                print(isDarkmode)
            }else if isDarkmode == false{
                isDarkmode = true
                print(isDarkmode)
            }
        }
                ){
                Image(systemName: "moon.fill")
                    .dynamicTypeSize(.accessibility1)
                    .padding(.top)
            }
            Text("AirDat")
                .multilineTextAlignment(.center)
                .dynamicTypeSize(.accessibility3)
                .padding(.top)
                .font(.headline)
            Button(action: {print("SettingsButton")}){
                Image(systemName: "gearshape.fill")
                    .dynamicTypeSize(.accessibility1)
                    .padding(.top)
            }
        }
        .preferredColorScheme(isDarkmode ? .dark : .light)
    }
}

#Preview {
    ContentView()
}
