import SwiftUI

@main
struct MyApp: App {
    
    var body: some Scene {
        let wardrobesample =
        [ArticleObject.init(name: "RowdyHacks 2023 Shirt!!", category: "Top", categoryIcon: "🧥", primaryColor: Color(red: 0.188, green: 0.212, blue: 0.345, opacity: 1.000), secondaryColor: Color(red: 0.925, green: 0.918, blue: 0.914, opacity: 1.000), heavyiness: 50, image: "rowdy_hacks"),
            ArticleObject.init(name: "Sherpa-Lined Hooded Fleece Sweatshirt", category: "Top", categoryIcon: "🧥", primaryColor: Color(.sRGB, red: 0.10, green: 0.10, blue: 0.10, opacity: 100), secondaryColor: Color(.sRGB, red: 0.50, green: 0.50, blue: 0, opacity: 100), heavyiness: 50, image: "amazon-sweater"),
         ArticleObject.init(name: "Mademark x MTV Smileys Shirt", category: "Top", categoryIcon: "👕", primaryColor: Color(red: 0.725, green: 0.839, blue: 0.898, opacity: 1.000), secondaryColor: Color(red: 0.882, green: 0.847, blue: 0.784, opacity: 1.000), heavyiness: 10, image: "mtv"),
         ArticleObject.init(name: "Long-Sleeve Flannel Shirt", category: "Top", categoryIcon: "👕", primaryColor: Color(red: 0.914, green: 0.737, blue: 0.067, opacity: 1.000), secondaryColor: Color(red: 0.576, green: 0.431, blue: 0.141, opacity: 1.000), heavyiness: 20, image: "flannel"),
         ArticleObject.init(name: "Fleece Crewneck Sweatshirt", category: "Top", categoryIcon: "👕", primaryColor: Color(red: 0.765, green: 0.353, blue: 0.129, opacity: 1.000), secondaryColor: Color(red: 0.765, green: 0.353, blue: 0.129, opacity: 1.000), heavyiness: 30, image: "sweatshirt"),
         ArticleObject.init(name: "Quarter-Zip Sweater", category: "Top", categoryIcon: "🧥", primaryColor: Color(red: 0.941, green: 0.929, blue: 0.894, opacity: 1.000), secondaryColor: Color(red: 0.941, green: 0.929, blue: 0.894, opacity: 1.000), heavyiness: 40, image: "quarter-zip-sweater"),
         ArticleObject.init(name: "WDIRARA Cartoon Letter Graphic Drawstring Hoodie", category: "Top", categoryIcon: "🧥", primaryColor: Color(red: 0.737, green: 0.208, blue: 0.196, opacity: 1.000), secondaryColor: Color(red: 0.925, green: 0.918, blue: 0.914, opacity: 1.000), heavyiness: 50, image: "red-jacket"),
         ArticleObject.init(name: "Blue Jeans", category: "Bottom", categoryIcon: "👖", primaryColor: Color(red: 0.349, green: 0.431, blue: 0.502, opacity: 1.000), secondaryColor: Color(red: 0.349, green: 0.431, blue: 0.502, opacity: 1.000), heavyiness: 50, image: "jeans"),
         ArticleObject.init(name: "Black/White Nike Shorts", category: "Bottom", categoryIcon: "🩳", primaryColor: Color.black, secondaryColor: Color(red: 0.925, green: 0.918, blue: 0.914, opacity: 1.000), heavyiness: 50, image: "mono-nike-shorts"),
         ArticleObject.init(name: "Purple Nike Shorts", category: "Bottom", categoryIcon: "🩳", primaryColor: Color.purple, secondaryColor: Color(red: 0.925, green: 0.918, blue: 0.914, opacity: 1.000), heavyiness: 50, image: "purple-nike-shorts"),
         ArticleObject.init(name: "Gray Sweatpants", category: "Bottom", categoryIcon: "👖", primaryColor: Color.gray, secondaryColor: Color.gray, heavyiness: 50, image: "sweats"),
         ArticleObject.init(name: "Nike Shoes", category: "shoes", categoryIcon: "👟", primaryColor: Color.black, secondaryColor: Color(red: 0.925, green: 0.918, blue: 0.914, opacity: 1.000), heavyiness: 10, image: "nike-shoes"),
         ArticleObject.init(name: "Yeezy Foams", category: "shoes", categoryIcon: "👟", primaryColor: Color(red: 0.867, green: 0.839, blue: 0.792, opacity: 1.000), secondaryColor: Color(red: 0.867, green: 0.839, blue: 0.792, opacity: 1.000), heavyiness: 10, image: "yeezy")]
        
        WindowGroup {
            TabView{
                Settings()
                    .tabItem{
                        Label("Settings", systemImage: "gear")
                    }
                ContentView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                Wardrobe(wardrobe: wardrobesample, newclothes: wardrobesample[1])
                    .tabItem {
                        Label("Wardrobe", systemImage: "cabinet")
                    }
            }
        }
    }
}
