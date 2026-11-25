import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack{
            topView()
            rwyHeadings()
        }
    }
}

struct rwyHeadings: View {
    @State private var compass = compassManager()

    var body: some View {
        VStack(spacing: 15){
            Text("Magnetic Heading: \(compass.mgHeadingFormatted)")
                .multilineTextAlignment(.center)
                .font(.title2)
            Image(systemName: "photo")
                .resizable()
                .frame(width: 300, height: 200)
            Text("Runway: \(compass.rwyHeading)")
                .multilineTextAlignment(.center)
                .font(.title)
                .bold()
        }
        .padding()
        .frame(width: 350, height: 400)
        .background(Color(.secondarySystemBackground))
        Spacer()
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
                .font(.headline)
            Button(action: {print("SettingsButton")}){
                Image(systemName: "gearshape.fill")
                    .dynamicTypeSize(.accessibility1)
                    .padding(.top)
            }
        }
    }
}

#Preview {
    ContentView()
}
