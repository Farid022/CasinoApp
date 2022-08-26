//
//  Product_detail_view.swift
//  Casino
//
//  Created by Muhammad Farid Ullah on 28/06/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct Product_detail_view: View {
    var colums = [GridItem(.adaptive(minimum: 160), spacing: 10)]
    @Environment(\.presentationMode) var presentationMoood
    @ObservedObject var webViewModel2 = WebViewModel2(url: "")

    //let contry: Country_Model
    @State var isShowingMenu = false
    @State var isTrue_back_or_manue: Bool = false
    let image_name: String
    let titleName: String
    let description_url: String
    //let url_link: String
    @GestureState private var dragOffset = CGSize.zero
    
    var body: some View {
        //NavigationView {
            ZStack {
                
                if isShowingMenu {
                    sideMenuView(isShowing_menu: $isShowingMenu)
                }
                
                VStack(spacing: 0.0) {
                    
                    Product_Detail_View_NavBar(is_back_or_manue: $isTrue_back_or_manue, isShowingMenu: $isShowingMenu, headerTitle: titleName)
                    
                    ScrollView {
                        //The TabView, text, Rating stars, playButton
                        VStack {
                            WebImage(url: URL(string: image_name))
                                .resizable()
                                .frame(maxWidth: .infinity)
                                .frame(height: 170)
                                .scaledToFill()
                            
                            
                            HStack{
                                Text(titleName)
                                    .font(.system(size: 17))
                                    .fontWeight(.bold)

                                Spacer()

                                Rating_view(rating: .constant(3))
                                    .font(.system(size: 17))
                                
                                //Web_view_description()
                            }
                            .padding(.leading,6)
                            .padding(.trailing,6)
                            .padding(.top,6)
                            
                            
                            Link(destination: URL(string: "https://adleranewsnine.xyz/")!) {
                                Text("PLAY NOW")
                                    .font(.system(size: 13))
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 33)
                                    .foregroundColor(.white)
                                    .background(Color.green)
                            }
                            
                            WebViewContainer2(webViewModel2: webViewModel2, html_string_request: description_url)
                            .frame(height: 5730)
                            
                            Text("End")
                                .font(.title)
                                .fontWeight(.bold)
                                .background(Color.red)
                            
                    }
                            
                    }
                    
                }
            }
            .gesture(DragGesture().updating($dragOffset, body: { value, state, transaction in
                if(value.startLocation.x < 20 &&
                                value.translation.width > 100) {
                         self.presentationMoood.wrappedValue.dismiss()
                     }
            }))
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        //}
    }
}

struct Product_detail_view_Previews: PreviewProvider {
    static var previews: some View {
        Product_detail_view(image_name: "ddd", titleName: "ddghgj", description_url: "ddsnhffj")
    }
}

struct Product_Detail_View_NavBar: View {
    @Binding var is_back_or_manue: Bool
    @Binding var isShowingMenu: Bool
    //let contry: Country_Model
    @State var headerTitle: String
    @Environment(\.presentationMode) var presentationMoood
    
    
    var body: some View {
        Color.yellow
            .ignoresSafeArea()
            .frame(height: 40)
            .overlay(
                HStack {
                    
                    if is_back_or_manue {
                        Button(action: {
                            withAnimation(.spring()){
                                isShowingMenu.toggle()
                            }
                        }) {
                            Image(systemName: "line.horizontal.3")
                                .foregroundColor(.white)
                                .padding(.leading)
                        }
                        .frame(height: 44)
                        
                    }else{
                        
                        Button(action: {
                            presentationMoood.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "arrow.backward")
                                .foregroundColor(.white)
                                .padding(.leading)
                        }
                        .frame(height: 44)
                        
                    }
                    
                    Spacer()
                    
                    Text(headerTitle)
                        .foregroundColor(.green)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    
                    Spacer()
                    
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

                    
                }, alignment: .bottom)
    }
}
