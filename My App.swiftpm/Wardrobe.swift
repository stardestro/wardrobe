import SwiftUI

struct ArticleObject{
    var name: String
    var category: String
    var categoryIcon: String
    var primaryColor: Color
    var secondaryColor: Color
    var heavyiness: Double
    var image: String
}

struct ArticeView: View  {
    let Article: ArticleObject
    var body: some View{
        HStack{
            Image(Article.image)
                .resizable()
                .frame(minWidth: 20, idealWidth: 20, maxWidth: 100, minHeight: 20, idealHeight: 20, maxHeight: 100 , alignment: .leading)
                .scaledToFit()
                .padding(15)
            VStack(spacing: 0){
                Text(Article.name)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .font(.title2)
                    .padding(.top, 5)
                    .padding(.leading, 5)
                HStack(spacing: 0){
                    Image(systemName: "circle.fill")
                        .foregroundColor(Article.primaryColor)
                        .padding(.horizontal, 5)
                    Image(systemName: "circle.fill")
                        .foregroundColor(Article.secondaryColor)
                    Spacer()
                    HStack{
                        Text(Article.category)
                        Text(Article.categoryIcon)
                            .padding(.trailing,10)
                    }
                    .padding(.bottom, 5)
                }
            }
        }
        //.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
    }
    
}

struct Wardrobe: View {
    @State var wardrobe: [ArticleObject]
    @State var addClothes = false
    @State var newclothes: ArticleObject
    var body: some View {
        NavigationView{
            List{
                ForEach(wardrobe, id: \.name){ wardrobe in
                    ArticeView(Article: wardrobe)
                }
                .onDelete(perform: { indexSet in
                    wardrobe.remove(atOffsets: indexSet)
                })
            }.navigationBarTitle("Wardrobe", displayMode: .automatic)
                .toolbar{
                    ToolbarItemGroup(placement: .primaryAction) {
                        Button("Add") {
                            self.addClothes.toggle()
                        }
                    }
                }
            
        }
        .sheet(isPresented: $addClothes) {
            NavigationView{
                Form{
                    Section{
                        HStack{
                            Text("Name:")
                            TextField("Unique identifier", text: $newclothes.name)
                        }
                    }
                    Section{
                        HStack{
                            Text("Category:")
                            Picker(selection: $newclothes.category, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                                Text("Hat")
                                Text("Top")
                                Text("Jacket")
                                Text("Bottom")
                                Text("Shoes")
                            }.pickerStyle(.wheel)
                        }.padding(.horizontal, 20)
                    }
                    Section {
                        HStack{
                            Text("Heaviness")
                            Slider(value: $newclothes.heavyiness, in: 0...100, step: 5)
                            Text("\(newclothes.heavyiness)")
                        }.padding(.all, 10)
                    }
                    Section {
                        VStack(spacing: 0){
                            ColorPicker("Primary Color:", selection: $newclothes.primaryColor)
                        }
                        ColorPicker("Secondary Color:", selection: $newclothes.secondaryColor)
                    }.navigationBarTitle(Text("Add Clothes"), displayMode: .inline)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button("Dismiss") {
                                    self.addClothes.toggle()
                                }
                            }
                            ToolbarItem(placement:.navigationBarTrailing) {
                                Button("Add") {
                                    self.addClothes.toggle()
                                }
                            }
                        }
                } .ignoresSafeArea(/*@START_MENU_TOKEN@*/.keyboard/*@END_MENU_TOKEN@*/, edges: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
            }
        }
    }
    
    struct ArticleView_Previews: PreviewProvider{
        static var article = ArticleObject.init(name: "RowdyHacks Memoriabilia", category: "top", categoryIcon: "tshirt", primaryColor: Color(.sRGB, red: 0.10, green: 0.10, blue: 0.10, opacity: 100), secondaryColor: Color(.sRGB, red: 0.50, green: 0.50, blue: 0, opacity: 100), heavyiness: 10, image: "test")
        static var previews: some View{
            ArticeView(Article: article)
        }
    }
    
    struct wardrobe_Previews: PreviewProvider {
        static var wardrobesample =
        [ArticleObject.init(name: "RowdyHacks 2023 Shirt!!", category: "Top", categoryIcon: "🧥", primaryColor: Color(.sRGB, red: 0.10, green: 0.10, blue: 0.10, opacity: 100), secondaryColor: Color(.sRGB, red: 0.50, green: 0.50, blue: 0, opacity: 100), heavyiness: 50, image: "rowdy_hacks"),
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
        static var previews: some View {
            Wardrobe(wardrobe: wardrobesample, newclothes: wardrobesample[1])
        }
    }
}
