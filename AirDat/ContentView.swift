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
        VStack{
            HStack{
                Image(systemName: "safari")
                    .padding(.top)
                Text("Current Heading: \(compass.mgHeadingFormatted)")
                    .multilineTextAlignment(.center)
                    .font(.title2)
                    .bold()
                    .padding(.top)
                Image(systemName: "safari")
                    .padding(.top)
            }
            .padding(.top)
            Image("RunwayVectorPNG")
                .resizable()
                .frame(width: 300, height: 250)
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
