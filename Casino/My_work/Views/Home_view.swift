//
//  Home_view.swift
//  Casino
//
//  Created by Muhammad Farid Ullah on 28/06/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View{
    @StateObject var news_vm = News_Post_VM()
    @StateObject var category_vm = Categories_Post_VM()
    @StateObject var product_vm = Product_Post_VM()
    
    var colums = [GridItem(.adaptive(minimum: 160), spacing: 10)]
    var date = Date()
    @State private var searchText = ""
    @State private var needsRefresh: Bool = false
    

    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    
    //@StateObject var vm = Country_View_Model()

    @State var isShowingMenu: Bool = false
    @State var back_or_manue: Bool = false
    @State var showMenu: Bool = true

    var body: some View{
        NavigationView{
            ZStack{
                
//                if isShowingMenu {
//                    sideMenuView(isShowing_menu: $isShowingMenu)
//                }
                
                VStack(spacing: 0.0) {

                    Home_NavBar(isShowingMenu: $isShowingMenu)


                    ScrollView {

                        //News
                        Group{
                            HStack{
                                VStack {
                                    Text("News")
                                        .font(.system(size: 23))
                                        .fontWeight(.bold)
                                    Spacer()
                                }
                                .padding(.leading)

                                Spacer()
                            }
                            .padding(.top,10)

                            LazyVGrid(columns: colums, spacing: 8){
                                let base_urlee = "https://casinoapp.casinonativeweb.xyz/images/News/"
                                ForEach(news_vm.news_post_array?.data2 ?? [], id: \.self) { news_data in
                                    NavigationLink {
                                        News_Detail_View(image_name: base_urlee + (news_data.newsImage ?? ""), titleName: news_data.newsTitle!, date_name: news_data.newsDate!, description_url: news_data.newsDescription!, url_link: news_data.newsLink ?? "")
                                    } label: {

                                        View_Card(image_name: base_urlee + (news_data.newsImage ?? ""),
                                                          title_name: news_data.newsTitle!)
                                    }

                                }
                            }
                            .padding(.leading, 8)
                            .padding(.trailing, 8)
                            .padding(.top,5)
                        }

                        //Categories
                        Group{
                            HStack{
                                VStack {
                                    Text("Categories")
                                        .font(.system(size: 23))
                                        .fontWeight(.bold)
                                    Spacer()
                                }
                                .padding(.leading)

                                Spacer()
                            }
                            .padding(.top,10)
                            LazyVGrid(columns: colums, spacing: 8){
                                ForEach(category_vm.category_post_array?.welcomeJSON ?? [], id: \.self) { category_data in
                                    NavigationLink {
                                        Bonus_Categories_View(catID: category_data.catID ?? "", titleName: category_data.catName ?? "")
                                    } label: {
                                        let base_urlee = "https://casinoapp.casinonativeweb.xyz/images/Category/"
                                        View_Card(image_name: base_urlee + (category_data.catImg ?? ""),
                                                          title_name: category_data.catName!)
                                    }
                                }
                            }
                            .padding(.leading, 8)
                            .padding(.trailing, 8)
                            .padding(.top,5)
                        }

                        //Products
                        Group{
                            HStack{
                                VStack {
                                    Text("Products")
                                        .font(.system(size: 23))
                                        .fontWeight(.bold)
                                    Spacer()
                                }
                                .padding(.leading)

                                Spacer()

                            }
                            .padding(.top,10)

                            LazyVGrid(columns: colums, spacing: 8){
                                let base_urlee = "https://casinoapp.casinonativeweb.xyz/images/Product/"
                                ForEach(product_vm.product_post_array?.json2 ?? [], id: \.self) { product_data in
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

                    }.onTapGesture {
                        isShowingMenu = false
                    }
                }
                
                
                GeometryReader { _ in
                  
                  //HStack {
                    sideMenuView(isShowing_menu: $isShowingMenu).navigationBarHidden(true)
                      .offset(x: isShowingMenu ? 0 : -300)
                      .animation(.easeInOut(duration: 0.4), value: isShowingMenu)
                      //.navigationBarHidden(true)
                  //}
                }
                .background(Color.black.opacity(isShowingMenu ? 0.5 : 0).onTapGesture(perform: {
                    isShowingMenu.toggle()
                })
                )
                
                
                
            }
            .navigationBarHidden(true)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct Home_NavBar: View {
    @Binding var isShowingMenu: Bool
    var body: some View {
        Color.yellow
            .ignoresSafeArea()
            .frame(height: 40)
        
            .overlay(
                HStack {
                    
                    Button(action: {
                        withAnimation(.easeInOut){
                            isShowingMenu = true
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .foregroundColor(.white)
                            .padding(.leading)
                    }
                    .frame(height: 44)
                    
                    
                    //Spacer()
                    
                    Text("FairGo")
                        .foregroundColor(.green)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.trailing,30)
                    
                    Spacer()
                    
                    NavigationLink {
                        SearchBar_detail_view().navigationBarHidden(true)
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                            .foregroundColor(.white)
                    }

                    
                    NavigationLink {
                        Play_GamesView().navigationBarHidden(true)
                    } label: {
                        Image(systemName: "play.fill")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    .frame(width: 27, height: 27)
                    .background(Color.green)
                    .cornerRadius(5)
                    .padding(.all, 10)
                    
                    
                    //Spacer()
                }, alignment: .bottom)
    }
}









//    var filterResults: [Country_Model] {
//        if searchText.isEmpty{
//            return vm.countries
//        }else{
//            return vm.countries.filter { country in
//                country.contry_title.localizedCaseInsensitiveContains(searchText.localizedLowercase)
//            }
//        }
//    }
