import SwiftUI

struct ArticleObject{
    var name: String
    var category: String
    var categoryIcon: String
    var subcategory: String
    var primaryColor: Color
    var secondaryColor: Color
    var material: String
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
                        Image(systemName: Article.categoryIcon)
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
            VStack(spacing: 0){
                HStack{
                    Spacer()
                    Button("Dismiss") {
                        self.addClothes.toggle()
                    }
                    .padding(.all, 10)
                }
                Spacer()
                HStack{
                    Text("Name:")
                    TextField("Unique identifier", text: $newclothes.name)
                        .padding(.leading, 10)
                }.padding(.horizontal, 20)
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
                    HStack{
                        Text("Subcategory:")
                        Picker(selection: $newclothes.subcategory, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                            Text("tshirt")
                            Text("sweater")
                            Text("sweatshirt")
                            Text("flannel")
                            Text("sneakers")
                            Text("sweatpants")
                            Text("hoodie")
                        }.pickerStyle(.wheel)
                    }.padding(.horizontal, 20)
                    HStack{
                        Text("Material:")
                        Picker(selection: $newclothes.material, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/){
                            Text("Cotton")
                            Text("Leather")
                            Text("Spandex")
                            Text("Polyester")
                        }.pickerStyle(.wheel)
                        
                    }.padding(.horizontal, 20)
                     
                    HStack{
                        Text("Heavyiness")
                        Slider(value: $newclothes.heavyiness, in: 0...100, step: 5)
                        Text("\(newclothes.heavyiness)")
                    }.padding(.all, 10)
                    ColorPicker("Primary Color:", selection: $newclothes.primaryColor)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                    ColorPicker("Secondary Color:", selection: $newclothes.secondaryColor)
                        .padding(.horizontal, 20)
                    Button("Add") {
                        wardrobe.append(newclothes)
                        self.addClothes.toggle()
                    }
                    .padding(.all, 20)
                    
            } .ignoresSafeArea(/*@START_MENU_TOKEN@*/.keyboard/*@END_MENU_TOKEN@*/, edges: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
        }
    }
    }
    
    struct ArticleView_Previews: PreviewProvider{
        static var article = ArticleObject.init(name: "RowdyHacks Memoriabilia", category: "top", categoryIcon: "tshirt", subcategory: "tshirt", primaryColor: Color(.sRGB, red: 0.10, green: 0.10, blue: 0.10, opacity: 100), secondaryColor: Color(.sRGB, red: 0.50, green: 0.50, blue: 0, opacity: 100), material: "cotton", heavyiness: 10, image: "test")
        static var previews: some View{
            ArticeView(Article: article)
        }
    }
    
    struct wardrobe_Previews: PreviewProvider {
        static var wardrobesample =
        [ArticleObject.init(name: "Sherpa-Lined Hooded Fleece Sweatshirt", category: "Top", categoryIcon: "tshirt", subcategory: "sweater", primaryColor: Color(.sRGB, red: 0.10, green: 0.10, blue: 0.10, opacity: 100), secondaryColor: Color(.sRGB, red: 0.50, green: 0.50, blue: 0, opacity: 100), material: "cotton", heavyiness: 50, image: "amazon-sweater"),
         ArticleObject.init(name: "Mademark x MTV Smileys Shirt", category: "Top", categoryIcon: "tshirt", subcategory: "tshirt", primaryColor: Color(.sRGB, red: 0.10, green: 0.10, blue: 0.10, opacity: 100), secondaryColor: Color(.sRGB, red: 0.50, green: 0.50, blue: 0, opacity: 100), material: "cotton", heavyiness: 10, image: "mtv"),
         ArticleObject.init(name: "Long-Sleeve Flannel Shirt", category: "Top", categoryIcon: "tshirt",  subcategory: "flannel", primaryColor: Color(.sRGB, red: 0.10, green: 0.10, blue: 0.10, opacity: 100), secondaryColor: Color(.sRGB, red: 0.50, green: 0.50, blue: 0, opacity: 100), material: "cotton", heavyiness: 20, image: "flannel"),
         ArticleObject.init(name: "Fleece Crewneck Sweatshirt", category: "Top", categoryIcon: "tshirt",  subcategory: "sweatshirt", primaryColor: Color(.sRGB, red: 0.10, green: 0.10, blue: 0.10, opacity: 100), secondaryColor: Color(.sRGB, red: 0.50, green: 0.50, blue: 0, opacity: 100), material: "cotton", heavyiness: 30, image: "sweatshirt"),
         ArticleObject.init(name: "Quarter-Zip Sweater", category: "Top", categoryIcon: "tshirt",  subcategory: "sweater", primaryColor: Color(.sRGB, red: 0.10, green: 0.10, blue: 0.10, opacity: 100), secondaryColor: Color(.sRGB, red: 0.50, green: 0.50, blue: 0, opacity: 100), material: "cotton", heavyiness: 40, image: "quarter-zip-sweater"),
         ArticleObject.init(name: "WDIRARA Cartoon Letter Graphic Drawstring Hoodie", category: "Top", categoryIcon: "tshirt.fill",  subcategory: "hoodie", primaryColor: Color(.sRGB, red: 0.10, green: 0.10, blue: 0.10, opacity: 100), secondaryColor: Color(.sRGB, red: 0.50, green: 0.50, blue: 0, opacity: 100), material: "polyester", heavyiness: 50, image: "red-jacket"),
         ArticleObject.init(name: "nike shoes ", category: "shoes", categoryIcon: "shoeprints.fill", subcategory: "sports", primaryColor: Color(.sRGB, red: 0.10, green: 0.10, blue: 0.10, opacity: 100), secondaryColor: Color(.sRGB, red: 0.50, green: 0.50, blue: 0, opacity: 100), material: "cotton", heavyiness: 10, image: "test")]
        static var previews: some View {
            Wardrobe(wardrobe: wardrobesample, newclothes: wardrobesample[1])
        }
    }
