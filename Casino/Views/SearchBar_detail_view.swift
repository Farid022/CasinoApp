//
//  SearchBar_detail_view.swift
//  Casino
//
//  Created by Muhammad Farid Ullah on 04/07/2022.
//

import SwiftUI

struct SearchBar_detail_view: View {
    var colums = [GridItem(.adaptive(minimum: 160), spacing: 10)]

    var date = Date()
    @State private var searchText = ""
    @State private var needsRefresh: Bool = false
    
    @StateObject var product_vm = Product_Post_VM()
    var product_filteredList: [ProductAPI_Model_data] {
        if searchText.isEmpty {
            return (product_vm.product_post_array?.json2 ?? [])
        }else{
            return (product_vm.product_post_array?.json2?.filter({ product in
                product.pName?.localizedStandardContains(searchText.localizedLowercase) ?? true
            }))!
        }
    }
    
    
    @Environment(\.presentationMode) var presentationMod
    
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    
   

    var body: some View {
        NavigationView {
            //ZStack {
                VStack(spacing: 0.0) {
                    
//                    SearchBarr(searchText: $searchText)
                    Color.black
                        .ignoresSafeArea()
                        .frame(height: 40)
                        .overlay(
                            HStack {
                                
                                Button {
                                    presentationMod.wrappedValue.dismiss()
                                } label: {
                                    Image(systemName: "arrow.backward")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .padding(.leading)
                                }
                                .frame(height: 44)
                                //The search bar
                                Search_Bar(searchText: $searchText, hintText: "Searching")
                                
                            }, alignment: .bottom
                        )
                    
                    ScrollView {
                        LazyVGrid(columns: colums, spacing: 8){
                            let base_urlee = "https://casinoapp.casinonativeweb.xyz/images/Product/"
                            ForEach(product_filteredList, id: \.self) { product in
                                NavigationLink {
                                    //Contry_detail_view(contry: contry, isTrue_back_or_manue: false)
                                } label: {
                                    View_Card(image_name: base_urlee + (product.pimage ?? ""), title_name: product.pName ?? "")
                                }
                                
                            }
                        }
                        .padding(.leading, 8)
                        .padding(.trailing, 8)
                    .padding(.top,5)
                    }
                    
                }.navigationBarHidden(true)
            //}
        }
    }
}

struct SearchBar_detail_view_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar_detail_view()
    }
}


