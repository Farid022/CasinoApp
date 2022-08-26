//
//  Country_view_card.swift
//  Casino
//
//  Created by Muhammad Farid Ullah on 27/06/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct View_Card: View {
    //let country_details: Country_Model
    let image_name: String
    let title_name: String
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
                VStack {
                    WebImage(url: URL(string: image_name))
                        .resizable()
                        .frame(width: 175, height: 155)
                        .scaledToFit()
                    
                    Text(title_name)
                        //.foregroundColor(.accentColor)
                    Spacer()
                    
                }.frame(width: 175, height: 195)
                    .background(Color.white)
                    .cornerRadius(8)
                    //.shadow(radius: 5)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 10)
        }
    }
}


struct View_Card_row: View {
    //let country_details: Country_Model
    let image_name: String
    let title_name: String
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
                HStack(alignment: .top, spacing: 0){
                    WebImage(url: URL(string: image_name))
                    //Image(image_name)
                        .resizable()
                        .frame(width: 175, height: 120)
                        .scaledToFit()
                    
                    VStack(alignment: .leading) {
                        Text(title_name)
                            //.foregroundColor(.accentColor)
                            .font(.title3)
                            .padding(.top, 10)
                            .padding(.leading, 3)
                        
                        Spacer()
                        
                        HStack{
                            Spacer()
                            Button {
                                //
                            } label: {
                                Play_nowButton()
                            }
                            //.padding(.bottom, 0)
                            .padding(.trailing, 8)
                        }
                        Divider()
                            .background(Color.black)
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 120)
                .background(Color.white)
                .cornerRadius(8)
                //.shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 10)
                .padding(.all, 4)
//                .overlay(
//                    Divider()
//                        .background(Color.black)
//                        .padding(.top, 120)
//                )
        }
    }
}


struct View_Card_row_Previews: PreviewProvider {
    static var previews: some View {
        View_Card_row(image_name: "sideMenu_pic", title_name: "Jemmyyy")
    }
}
