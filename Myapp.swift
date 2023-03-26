import SwiftUI

@main
struct MyApp: App {
     @State var wardrobesample = [ArticleObject.init(name: "RowdyHacks Memoriabilia", category: "Top", categoryIcon: "tshirt", subcategory: "tshirt", primaryColor: Color(.sRGB, red: 0.10, green: 0.10, blue: 0.10, opacity: 100), secondaryColor: Color(.sRGB, red: 0.50, green: 0.50, blue: 0, opacity: 100), material: "cotton", heavyiness: 10, image: "test"), ArticleObject.init(name: "tamushirt", category: "Top", categoryIcon: "tshirt", subcategory: "tshirt", primaryColor: Color(.sRGB, red: 0.10, green: 0.10, blue: 0.10, opacity: 100), secondaryColor: Color(.sRGB, red: 0.50, green: 0.50, blue: 0, opacity: 100), material: "cotton", heavyiness: 10, image: "test"), ArticleObject.init(name: "hackuta ", category: "top", categoryIcon: "tshirt",  subcategory: "tshirt", primaryColor: Color(.sRGB, red: 0.10, green: 0.10, blue: 0.10, opacity: 100), secondaryColor: Color(.sRGB, red: 0.50, green: 0.50, blue: 0, opacity: 100), material: "cotton", heavyiness: 10, image: "test"), ArticleObject.init(name: "nike shoes ", category: "shoes", categoryIcon: "shoeprints.fill", subcategory: "sports", primaryColor: Color(.sRGB, red: 0.10, green: 0.10, blue: 0.10, opacity: 100), secondaryColor: Color(.sRGB, red: 0.50, green: 0.50, blue: 0, opacity: 100), material: "cotton", heavyiness: 10, image: "test")]
    @State var addclothes = false
    @State var tempclothes: ArticleObject = ArticleObject.init(name: "test", category: "Bottoms", categoryIcon: "tshirt", subcategory: "tshirt" , primaryColor: .blue, secondaryColor: .red, material: "leather", heavyiness: 20, image: "wow")
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
                Wardrobe(wardrobe: wardrobesample, newclothes: tempclothes)
                    .tabItem { 
                        Label("Wardrobe", systemImage: "cabinet" ) 
                    }
            }
        }
    } 
}
