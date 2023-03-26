import SwiftUI

struct ContentView: View {
    var hatNameObject: ArticleObject
    var topNameObject: ArticleObject
    var jacketNameObject: ArticleObject
    var bottomNameObject: ArticleObject
    var shoesNameObject: ArticleObject
    var hatName: String
    var topName: String
    var jacketName: String
    var bottomName: String
    var shoesName: String
    // var temperatureValue: String
    
    init() {
        // where articles is a list of articles
        let articles = [ArticleObject(), ArticleObject()]
        hatNameObject = articles.filter { $0.category == "Hat" }
        topNameObject = articles.filter { $0.category == "Top" }
        jacketNameObject = articles.filter { $0.category == "Jacket" }
        bottomNameObject = articles.filter { $0.category == "Bottom" }
        shoesNameObject = articles.filter { $0.category == "Shoes" }
        
        // images are found under article.image
        hatName = hatNameObject.image
        topName = topNameObject.image
        jacketName = jacketNameObject.image
        jacketName = jacketNameObject.image
        shoesName = shoesNameObject.image
    }
    
    var body: some View {
        VStack(spacing: 10) {
            ZStack {
                // Top bar in ZStack
                HStack {
                    // Top horizontal bar
                    //Text("88°F")
                    //    .padding()
                    //    .background(
                    //        Circle()
                    //            .stroke(Color.primary, lineWidth: 3))
                    //    .padding(.horizontal)
                    // Spacer()
                }
                HStack {
                    Text("App-arel")
                        .font(.largeTitle)
                        .padding()
                }
            }
            
            Image(self.hatName)
                .resizable()
                .aspectRatio(1.0, contentMode: .fit)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.primary, lineWidth: 5))
            HStack {
                // Shirt
                Image(self.topName)
                    .resizable()
                    .aspectRatio(1.0, contentMode: .fit)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.primary, lineWidth: 5))
                // Hat
                Image(self.hatName)
                    .resizable()
                    .aspectRatio(1.0, contentMode: .fit)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.primary, lineWidth: 5))
            }
            // Pants
            Image(systemName: self.bottomName)
                .resizable()
                .aspectRatio(1.0, contentMode: .fit)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.primary, lineWidth: 5))
            ZStack {
                // Shoes and repeat button
                HStack {
                    // Shoes
                    Image(systemName: self.hatName)
                        .resizable()
                        .aspectRatio(1.0, contentMode: .fit)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.primary, lineWidth: 5))
                }
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        Button(action: {  }) {
                            Image(systemName: "arrow.clockwise.circle")
                                .font(.system(size: 60))
                                .foregroundColor(.primary)
                                .padding(.horizontal)
                        }
                    }
                }
            }
        }
    }
}
                    // Shoes
                    Image(systemName: self.hatName)
                        .resizable()
                        .aspectRatio(1.0, contentMode: .fit)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.primary, lineWidth: 5))
                }
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        Button(action: { get_algo_results() }) {
                            Image(systemName: "arrow.clockwise.circle")
                                .font(.system(size: 60))
                                .foregroundColor(.primary)
                                .padding(.horizontal)
                        }
                    }
                }
            }
        }
    }
}
