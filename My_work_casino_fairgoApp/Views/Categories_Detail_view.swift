////
////  Categories_Detail_view.swift
////  Casino
////
////  Created by Muhammad Farid Ullah on 15/07/2022.
////
//
//import SwiftUI
//import SDWebImageSwiftUI
//
//struct Categories_Detail_view: View {
//    var colums = [GridItem(.adaptive(minimum: 160), spacing: 10)]
//    @Environment(\.presentationMode) var presentationMoood
//    @ObservedObject var webViewModel2 = WebViewModel2(url: "")
//
//    //let contry: Country_Model
//    @State var isShowingMenu = false
//    @State var isTrue_back_or_manue: Bool = false
//    let image_name: String
//    let titleName: String
//    let description_url: String
//    
//    var body: some View {
//        
//        ZStack {
//            
//            if isShowingMenu {
//                sideMenuView(isShowing_menu: $isShowingMenu)
//            }
//            
//            VStack(spacing: 0.0) {
//                
//                Product_Detail_View_NavBar(is_back_or_manue: $isTrue_back_or_manue, isShowingMenu: $isShowingMenu, headerTitle: titleName)
//                
//                ScrollView {
//                    //The TabView, text, Rating stars, playButton
//                    VStack {
//                        WebImage(url: URL(string: image_name))
//                            .resizable()
//                            .frame(maxWidth: .infinity)
//                            .frame(height: 170)
//                            .scaledToFill()
//                        
//                        
//                        HStack{
//                            Text(titleName)
//                                .font(.system(size: 17))
//                                .fontWeight(.bold)
//
//                            Spacer()
//
//                            Rating_view(rating: .constant(3))
//                                .font(.system(size: 17))
//                            
//                            //Web_view_description()
//                        }
//                        .padding(.leading,6)
//                        .padding(.trailing,6)
//                        .padding(.top,6)
//                        
//                        
//                        Button {
//                            //
//                        } label: {
//                            Text("Play")
//                                .frame(maxWidth: .infinity)
//                                .frame(height: 33)
//                                .background(Color.orange)
//                        }
//                        
//                        WebViewContainer2(webViewModel2: webViewModel2, html_string_request: description_url)
//                        .frame(height: 5730)
//                        
//                        Text("End")
//                            .font(.title)
//                            .fontWeight(.bold)
//                            .background(Color.red)
//                        
//                }
//                        
//                }
//                
//            }
//        }.navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)
//    }
//}
//
//struct Categories_Detail_view_Previews: PreviewProvider {
//    static var previews: some View {
//        Categories_Detail_view(image_name: "ddd", titleName: "ddghgj", description_url: "ddsnhffj")
//    }
//}
