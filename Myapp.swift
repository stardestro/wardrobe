import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                ContentView()
                    .tabItem { 
                        Label("test", systemImage: "book") 
                    }
                Settings()
                    .tabItem{ 
                        Label("settings", systemImage: "gear") 
                    }
                    Wardrobe()
                    .tabItem { 
                        Label("Wardrobe", systemImage: "cabinet" ) 
                    }
            }
        }
    }
}
