import SwiftUI

@main
struct MyApp: App {
    @State var wardrobesample = [ArticleObject(name: "rowdyhack", category: "Top", categoryIcon: "tshirt", primaryColor: Color(.blue), secondaryColor: Color(.red), maxTemp: 70, minTemp: 50, image: "test"),ArticleObject(name: "tamu", category: "Top", categoryIcon: "tshirt", primaryColor: Color(.blue), secondaryColor: Color(.red), maxTemp: 70, minTemp: 50, image: "test"),ArticleObject(name: "legs", category: "Top", categoryIcon: "tshirt", primaryColor: Color(.blue), secondaryColor: Color(.red), maxTemp: 70, minTemp: 50, image: "test"),ArticleObject(name: "wonder", category: "Top", categoryIcon: "tshirt", primaryColor: Color(.blue), secondaryColor: Color(.red), maxTemp: 70, minTemp: 50, image: "test")]
    @State var maxtemp: Double = 10
    @State var mintemp: Double = 10
    @State var addclothes = false
    @State var tempclothes: ArticleObject = ArticleObject(name: "rowdyhack", category: "Top", categoryIcon: "tshirt", primaryColor: Color(.blue), secondaryColor: Color(.red), maxTemp: 70, minTemp: 50, image: "test")
    var body: some Scene {
        WindowGroup {
            TabView{
                Settings(maxtemp: $maxtemp, mintemp: $mintemp)
                    .tabItem{ 
                        Label("settings", systemImage: "gear") 
                    }
                ContentView(maxtemp: maxtemp)
                    .tabItem { 
                        Label("test", systemImage: "book") 
                    }
                Wardrobe(wardrobe: wardrobesample, newclothes: tempclothes)
                    .tabItem { 
                        Label("Wardrobe", systemImage: "cabinet" ) 
                    }
            }
        }
    } 
}

