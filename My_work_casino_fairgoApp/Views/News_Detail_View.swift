//
//  Product_detail_view.swift
//  Casino
//
//  Created by Muhammad Farid Ullah on 28/06/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct News_Detail_View: View {
    var colums = [GridItem(.adaptive(minimum: 160), spacing: 10)]
    @Environment(\.presentationMode) var presentationMoood
    @ObservedObject var webViewModel = WebViewModel(url: "")

    //let contry: Country_Model
    @State var isShowingMenu = false
    @State var isTrue_back_or_manue: Bool = false
    let image_name: String
    let titleName: String
    let date_name: String
    let description_url: String
    let url_link: String
    @GestureState private var dragOffset = CGSize.zero
    
    var body: some View {
        //NavigationView {
            ZStack {
                
                if isShowingMenu {
                    sideMenuView(isShowing_menu: $isShowingMenu)
                }
                
                VStack(spacing: 0.0) {

                    Detail_View_NavBar(is_back_or_manue: isTrue_back_or_manue, isShowingMenu: isShowingMenu, headerTitle: titleName)

                    ScrollView {
                        //The TabView, text, Rating stars, playButton
                        WebImage(url: URL(string: image_name))
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .frame(height: 170)
                            .scaledToFill()

                        VStack(alignment: .leading){
                            VStack(alignment: .leading, spacing: 0){
                                Text(titleName)
                                    .font(.system(size: 14))
                                    .fontWeight(.bold)
                                    .padding(.top, 15)

                                HStack {
                                    Text("[\(date_name)]")
                                    .font(.system(size: 13))
                                    .fontWeight(.semibold)

                                    Spacer()

                                    Text("Active")
                                    .font(.system(size: 25))
                                    .fontWeight(.semibold)
                                    .padding(.trailing)
                                }

                            }
                            .padding(.leading, 8)

                            Link(destination: URL(string: url_link)!) {
                                Text("PLAY NOW")
                                    .font(.system(size: 13))
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 33)
                                    .foregroundColor(.white)
                                    .background(Color.orange)
                            }

                            Text("Decscription :").padding(.all, 8)

                            WebViewContainer(webViewModel: webViewModel, html_string_request: description_url, fontSize: 32)
                            .frame(height: 5730)


                            Text("End")
                                .font(.title)
                                .fontWeight(.bold)
                                .background(Color.red)

                    }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.purple)
                        .padding(.bottom, 12)
                        .cornerRadius(12)
                        .offset(y: -22)
                        
                        //.offset(x: -0, y: -19)
                        //.shadow(radius: 12)
                    }


                }
                .offset(x: isShowingMenu ? 250 : 0, y: 0)
                    
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .gesture(DragGesture().updating($dragOffset, body: { value, state, transaction in
                if(value.startLocation.x < 20 &&
                                value.translation.width > 100) {
                         self.presentationMoood.wrappedValue.dismiss()
                     }
            }))
        //}
    }
}

struct News_Detail_View_Previews: PreviewProvider {
    static var previews: some View {
        News_Detail_View(image_name: "lunchScreen", titleName: "Title", date_name: "12345666", description_url: "ddddd", url_link: "")
    }
}

struct Detail_View_NavBar: View {
    @State var is_back_or_manue: Bool
    @State var isShowingMenu: Bool
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
                        Play_GamesView()
                            .navigationBarHidden(true)
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
