import SwiftUI

@main struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            mainTabs()
        }
    }
}

struct mainTabs: View {
    var body: some View {
        TabView{
            Tab("Runways", systemImage: "road.lanes"){
                ContentView()
            }
            Tab("Settings", systemImage: "gearshape"){
                appSettings()
            }
        }
    }
}
