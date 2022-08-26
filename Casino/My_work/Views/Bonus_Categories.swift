import SwiftUI
import SDWebImageSwiftUI

struct Bonus_Categories_View: View {
    var colums = [GridItem(.adaptive(minimum: 160), spacing: 10)]
    @Environment(\.presentationMode) var presentationMoood
    @ObservedObject var webViewModel2 = WebViewModel2(url: "")
    @State var isShowingMenu = false
    @State var isTrue_back_or_manue: Bool = false
    var titleName: String
    @State private var searchText: String = ""
    //@StateObject var catergory_bonus_vm = Category_Bonus_Post_VM()
    @StateObject var catergory_blackJack_vm: Category_bonusAPI_Post_VM
    @GestureState private var dragOffset = CGSize.zero
    var catID: String
    @State var sorting_list: Bool = false
    
    init(catID: String,titleName: String) {
        self.catID = catID
        self.titleName = titleName
        _catergory_blackJack_vm = StateObject(wrappedValue: Category_bonusAPI_Post_VM(catID: catID))
       }
    
    //@StateObject var product_vm = Product_Post_VM()
    
    var category_filteredList: [Category_bonusAPI_model_data] {
        if searchText.isEmpty {
            return (catergory_blackJack_vm.category_blackJack_array?.json3 ?? [])
        }else{
            return (catergory_blackJack_vm.category_blackJack_array?.json3?.filter({ product in
                product.pName?.localizedStandardContains(searchText.localizedLowercase) ?? true
            }))!
        }
    }

    var body: some View {
        
        ZStack {
            
            if isShowingMenu {
                sideMenuView(isShowing_menu: $isShowingMenu)
            }
            
            VStack(spacing: 0.0) {
                
                Product_Detail_View_NavBar(is_back_or_manue: $isTrue_back_or_manue, isShowingMenu: $isShowingMenu, headerTitle: titleName)
                
                Search_Bar(searchText: $searchText, hintText: "Search")
                
                Divider()
                    .background(Color.black)
                
                
                HStack{
                    Text("PRODUCTS")
                    Spacer()
                    Button {
                        withAnimation(.easeInOut){
                            sorting_list.toggle()
                        }
                    } label: {
                        Image(systemName: sorting_list ? "list.bullet.rectangle.fill" : "list.bullet.rectangle.portrait.fill")
                    }

                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .frame(height: 47)
                .background(Color.black.opacity(0.01))
                
                
                if !sorting_list {
                    ScrollView {
                        LazyVGrid(columns: colums, spacing: 8){
                            let base_urlee = "https://casinoapp.casinonativeweb.xyz/images/Product/"
                            ForEach(category_filteredList, id: \.self) { product_data in
                                NavigationLink {
                                    Product_detail_view(
                                        image_name: base_urlee + (product_data.pimage ?? "lunchScreen"),
                                        titleName: product_data.pName ?? "",
                                        description_url: product_data.pDesc ?? "")
                                } label: {
                                    View_Card(
                                        image_name: base_urlee + (product_data.pimage ?? "lunchScreen"),
                                        title_name: product_data.pName!)
                                }
                            }
                        }
                        .padding(.leading, 8)
                        .padding(.trailing, 8)
                        .padding(.top,5)
                    }
                
                Divider()
                    .background(Color.black)
                }
                else if sorting_list {
                    ScrollView {
                        VStack(spacing: 0.0){
                            let base_urlee = "https://casinoapp.casinonativeweb.xyz/images/Product/"
                            ForEach(category_filteredList, id: \.self) { product_data in
                                NavigationLink {
                                    Product_detail_view(
                                        image_name: base_urlee + (product_data.pimage ?? "lunchScreen"),
                                        titleName: product_data.pName ?? "",
                                        description_url: product_data.pDesc ?? "")
                                } label: {
                                    View_Card_row(
                                        image_name: base_urlee + (product_data.pimage ?? "lunchScreen"),
                                        title_name: product_data.pName!)
                                }
                                //Divider()
                            }
                        }
                        .padding(.leading, 8)
                        .padding(.trailing, 8)
                        .padding(.top,5)
                        
                    }
                    
                }
                    
                
//                ScrollView{
//
//                }
            }
        }
        //.ignoresSafeArea()
        .gesture(DragGesture().updating($dragOffset, body: { value, state, transaction in
            if(value.startLocation.x < 20 &&
                            value.translation.width > 100) {
                     self.presentationMoood.wrappedValue.dismiss()
                 }
        }))
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

//struct Bonus_Categories_view_Previews: PreviewProvider {
//    static var previews: some View {
//        Bonus_Categories_View(image_name: "ddd", titleName: "ddghgj", description_url: "ddsnhffj", idd: "11")
//    }
//}
//
