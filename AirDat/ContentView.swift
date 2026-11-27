import SwiftUI

@Observable
class AppState{
    var ShowingRWYhdg = true
    ///var ishapticsOn = true
}

///@AppState var isDarkMode = false

struct ContentView: View {
    @AppStorage("isTipsOn") var isTipsOn = true
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
                    if isTipsOn == true{
                        tips()
                            .padding(.top)
                    }else{
                        VStack{
                            VStack{
                                //justfiller
                            }
                        }
                        .frame(width: 320, height: 240)
                        //.background(Color(.secondarySystemGroupedBackground))
                        //.shadow(radius: 15)
                        Spacer()
                    }
                }
            ///}
            ///.frame(width: 375, height: 200)
        }
    }
}

struct tips: View {
    var body: some View {
        VStack{

            VStack{
                Text("Useful tip:")
                    .multilineTextAlignment(.center)
                    .dynamicTypeSize(.accessibility1)
                Text("Lorem ipsum whatever whatever Lorem ipsum whatever whatever Lorem ipsum whatever whatever Lorem ipsum whatever whatever Lorem ipsum whatever whatever")
                    .multilineTextAlignment(.center)
                    .dynamicTypeSize(.xLarge)
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .frame(width: 320, height: 200)
            .shadow(radius: 25)
        }
        Spacer()
    }
}

struct rwyHeadings: View {
    
    @AppStorage("isDarkMode") var isDarkmode = false
    
    @AppStorage("isHapticsOn") var isHapticsOn = true
    @AppStorage("isTrueNorthOn") var isTrueNorthOn = false
    
    @State private var compass = compassManager()
    @Bindable var appState = AppState()

    var body: some View {
        VStack{
            VStack{
                ///Image(systemName: "safari")
                ///    .padding(.top)
                if isHapticsOn == true{
                    Text("Magnetic Heading: \(compass.mgHeadingFormatted)")
                        .multilineTextAlignment(.center)
                        .font(.title2)
                        .bold()
                        .padding(.top)
                        .sensoryFeedback(.selection, trigger: compass.mgHeadingFormatted)
                }else{
                    Text("Magnetic Heading: \(compass.mgHeadingFormatted)")
                        .multilineTextAlignment(.center)
                        .font(.title2)
                        .bold()
                        .padding(.top)
                }
                if isTrueNorthOn == true{
                    Text("True Heading: \(compass.trueHeading)")
                        .multilineTextAlignment(.center)
                        .font(.title2)
                        .bold()
                }
                ///Image(systemName: "safari")
                ///    .padding(.top)
            }
            .padding(.top)
            if isDarkmode == false{
                Image("RunwayVectorPNG")
                    .resizable()
                    .frame(width: 300, height: 250)
                    .shadow(radius: 5)
            }else if isDarkmode == true{
                Image("RunwayVectorPNG")
                    .resizable()
                    .frame(width: 300, height: 250)
                    .shadow(radius: 5)
                    .colorInvert()
            }
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
        .frame(width: 350, height: 450)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(radius: 15)
    }
}

struct topView: View {
    @AppStorage("isDarkMode") var isDarkmode = false
    
    @State private var showingSettings = false

    var body: some View {
        HStack(spacing: 75){
            
            
            Text("AirDat")
                .multilineTextAlignment(.center)
                .dynamicTypeSize(.accessibility4)
                .padding(.top)
                .font(.headline)
            ///Button(action: {showingSettings = true}){
               /// Image(systemName: "gearshape.fill")
               ///     .dynamicTypeSize(.accessibility1)
               ///     .padding(.top)
            ///}
            ///.sheet(isPresented: $showingSettings){
            ///    //settings
            ///    appSettings()
            ///}
        }
        .padding(.top)
        .preferredColorScheme(isDarkmode ? .dark : .light)
    }
}

#Preview {
    ContentView()
}
