import SwiftUI

struct ContentView: View {
    //@State var hatName: String
    @State var hatName = "tshirt.fill"
    //@State var topName: String
    //@State var jacketName: String
    //@State var bottomName: String
    //@State var shoesName: String
    //@State var temperatureValue: String 
    
    func get_algo_results() {
        
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
                    Text("WebThread")
                        .font(.largeTitle)
                        .padding()
                }
            }
            
            // Need to remove systemName and only have self.hatName
            Image(systemName: self.hatName)
                .resizable()
                .aspectRatio(1.0, contentMode: .fit)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.primary, lineWidth: 5))
            HStack {
                // Shirt
                Image(systemName: self.hatName)
                    .resizable()
                    .aspectRatio(1.0, contentMode: .fit)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.primary, lineWidth: 5))
                // Hat
                Image(systemName: self.hatName)
                    .resizable()
                    .aspectRatio(1.0, contentMode: .fit)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.primary, lineWidth: 5))
            }
            // Pants
            Image(systemName: self.hatName)
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
