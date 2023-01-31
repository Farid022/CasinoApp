//
//  Login_Bonus_View.swift
//  Casino
//
//  Created by Muhammad Farid Ullah on 20/07/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct Login_Bonus_View: View {
    @Environment(\.presentationMode) var presentationMoood
    @GestureState private var dragOffset = CGSize.zero
    let image_name: String?
    
    @StateObject var bonus_info_vm = BonusInfo_API_Post_VM()
    
    var body: some View {
        
        ZStack{
            Color.white
                .ignoresSafeArea()
            VStack(spacing: 15) {
                Color("NavBar_Color")
                    .ignoresSafeArea()
                    .frame(height: 40)
                    .overlay(
                        HStack {
                            Button {
                                presentationMoood.wrappedValue.dismiss()
                            } label: {
                                Image(systemName: "line.horizontal.3")
                                    .foregroundColor(Color.white)
                                    .padding(.leading)
                            }
                            
                            Spacer()
                            
                            Text("Bonus")
                                .foregroundColor(.white)
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                                .padding(.trailing, 40)
                            
                            Spacer()
                            
                        }, alignment: .center)
                
                ScrollView{
                    ForEach(bonus_info_vm.bonus_info_array?.json5 ?? [], id: \.self) { item in
                        Login_Bonus_View_Card(image_name: "sideMenu_pic")
                            .overlay(
                                HStack{
                                    Link(destination: URL(string: item.bonusURL ?? "")!) {
                                        Text("CLAIM NOW")
                                            .font(.system(size: 13))
                                            .fontWeight(.bold)
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 33)
                                            .foregroundColor(.white)
                                            .background(Color.purple)
                                    }.padding(.leading, 13)
                                        .padding(.trailing, 13)
                                    .padding(.bottom, 10)
                                }, alignment: .bottom
                                
                            )
                    }
                }

            }
            
        }.navigationBarHidden(true)
    .gesture(DragGesture().updating($dragOffset, body: { value, state, transaction in
        if(value.startLocation.x < 20 &&
                        value.translation.width > 100) {
                 self.presentationMoood.wrappedValue.dismiss()
             }
    }))
        
    }
}

struct Login_Bonus_View_Previews: PreviewProvider {
    static var previews: some View {
        Login_Bonus_View(image_name: "sideMenu_pic")
    }
}


struct Login_Bonus_View_Card: View{
    let image_name: String
    var body: some View{
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0.0){
                    WebImage(url: URL(string: image_name))
                    //Image(image_name)
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .frame(height: 230)
                        .scaledToFit()
                    
            //
                HStack {
                    VStack(alignment: .leading, spacing: 0.0){
                        Text("Name")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Text("Descriptionnnn")
                            .font(.subheadline)
                            //.padding(.leading,2)
                    }.padding(.leading)
                    Spacer()
                }
                        //.padding(.leading)
                    
                    
                    
                //}//.padding(.trailing)
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height: 327)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 10)
                .padding(.leading,5)
                .padding(.trailing, 5)
                
        }
    }
}


