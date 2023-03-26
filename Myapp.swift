import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                Settings()
                    .tabItem{ 
                        Label("settings", systemImage: "gear") 
                    }
                ContentView()
                    .tabItem { 
                        Label("test", systemImage: "book") 
                    }
                Wardrobe()
                    .tabItem { 
                        Label("Wardrobe", systemImage: "cabinet" ) 
                    }
            }
        }
    }
}
