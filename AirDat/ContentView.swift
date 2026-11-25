import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack{
            topView()

        }
    }
}

struct topView: View {
    var body: some View {
        HStack(spacing: 75){
            
            Button(action: {print("HelloWorld")}){
                Image(systemName: "moon.fill")
                    .dynamicTypeSize(.accessibility1)
                    .padding(.top)
            }
            
            Text("AirDat")
                .multilineTextAlignment(.center)
                .dynamicTypeSize(.accessibility3)
                .padding(.top)
            
            Button(action: {print("SettingsButton")}){
                Image(systemName: "gearshape.fill")
                    .dynamicTypeSize(.accessibility1)
                    .padding(.top)
            }
        }
        Spacer()
    }
}

#Preview {
    ContentView()
}
