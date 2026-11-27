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
            Tab("Runways", systemImage: "airplane"){
                ContentView()
            }
            Tab("Settings", systemImage: "gearshape"){
                appSettings()
            }
        }
    }
}
