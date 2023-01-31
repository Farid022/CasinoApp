//
//  Side_Menue.swift
//  Casino
//
//  Created by Muhammad Farid Ullah on 30/06/2022.
//

import SwiftUI

struct sideMenuView: View{
    @Binding var isShowing_menu: Bool
    @State var go_to_homeView: Bool = false
    //@StateObject var vm = Country_View_Model()
    @StateObject var category_vm = Categories_Post_VM()
    var body: some View{
        ZStack{
            VStack(alignment: .leading, spacing: 0.0){
            HStack{
                Image("sideMenu_pic")
                .resizable()
                .frame(width: 283.5, height: 200)
                Spacer()
            }
            List{
                NavigationLink {
                    HomeView().navigationBarHidden(true).navigationBarBackButtonHidden(true)
                } label: {
                    HStack{
                        Image(systemName: "house")
                            .font(.title2)
                            .background(Color.yellow.opacity(0.5))
                            .foregroundColor(Color.white)
                            .scaledToFit()
                            .cornerRadius(5)
                        Text("Dashboard")
                    }
                }

                ForEach(category_vm.category_post_array?.welcomeJSON ?? [], id: \.self) { category in
                    NavigationLink {
                        Bonus_Categories_View(catID: category.catID ?? "", titleName: category.catName ?? "")
                    } label: {
                        ReuseAble_list_item(title: category.catName ?? "", image: "")
                    }
                }

                NavigationLink {
                    Bonus_View_sidMenu().navigationBarHidden(true)
                } label: {
                    HStack{
                        Image(systemName: "giftcard")
                            .font(.title2)
                            .background(Color.orange)
                            .foregroundColor(Color.white)
                            .scaledToFit()
                            .cornerRadius(5)
                        Text("Bonus")
                    }
                }



                NavigationLink {
                    Aboutus_View().navigationBarHidden(true)
                } label: {
                    HStack{
                        Image(systemName: "info.circle.fill")
                            .font(.title2)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .scaledToFit()
                            .cornerRadius(5)
                        Text("About us")
                    }
                }


                NavigationLink {
                    Terms_condition_View().navigationBarHidden(true)
                } label: {
                    HStack{
                        Image(systemName: "list.bullet.rectangle.portrait.fill")
                            .font(.title2)
                            .background(Color.green)
                            .foregroundColor(Color.white)
                            .scaledToFit()
                            .cornerRadius(5)
                        Text("Terms & Conditons")
                    }
                }
                
                HStack{
                    Text("")
                }
                
                HStack{
                    Text("")
                }
                HStack{
                    Text("")
                }
                
                HStack{
                    Text("")
                }

            }
            .listStyle(.plain)
            .padding(.trailing)
            .frame(height: 800)
            .frame(width: 300)
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        .ignoresSafeArea()
    }
}

struct ReuseAble_list_item: View {
    let title: String
    let image: String
    var body: some View {
            HStack{
                //Spacer()
                Text(title)
                    .padding(.leading, 38)
                Spacer()
                Image(systemName: image)
            }
    }
}

