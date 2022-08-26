//
//  Play_view.swift
//  Casino
//
//  Created by Muhammad Farid Ullah on 04/07/2022.
//

import SwiftUI


struct Play_GamesView: View {
    //@StateObject var vm = downloadDataWith_combineVM()
    @Environment(\.presentationMode) var presentationMoood

    var game_names = ["WarCard", "TicTacToe", "Memorizing"]

    @GestureState private var dragOffset = CGSize.zero
    
    @State var isLoading: Bool = false

    var body: some View {

        NavigationView {
            ZStack{
                Color.white.ignoresSafeArea()
                VStack(spacing: 15) {
                    //Home_NavBar(isShowingMenu: false)
                    Play_navBar(headerTitle: "FairGo")
                        .overlay(
                            HStack{
                                Button {
                                    presentationMoood.wrappedValue.dismiss()
                                } label: {
                                    Image(systemName: "arrow.left")
                                        .foregroundColor(Color.white)
                                        .padding(.leading)
                                }
                                
                                Spacer()
                            }
                        )
                    
                    ForEach(game_names, id: \.self) { card in
                        NavigationLink {
                            GameLunchingScreen(game_name: card)
                        } label: {
                            Text(card)
                                .frame(maxWidth: .infinity)
                                .frame(height: 55)
                                .background(.black.opacity(0.24))
                                .cornerRadius(10)
                        }
                    }
                    .padding(.leading, 6)
                    .padding(.trailing, 6)
                    
                    Spacer()
                }
                
            }.navigationBarHidden(true)
        }.gesture(DragGesture().updating($dragOffset, body: { value, state, transaction in
            if(value.startLocation.x < 20 &&
                            value.translation.width > 100) {
                     self.presentationMoood.wrappedValue.dismiss()
                 }
        }))
    }
}

struct Play_view_Previews: PreviewProvider {
    static var previews: some View {
        Play_GamesView()
    }
}

struct Play_navBar: View{
    let headerTitle: String
    @Environment(\.presentationMode) var presentationMoood
    var body: some View {
        Color.yellow
            .ignoresSafeArea()
            .frame(height: 40)
            .overlay(
                HStack {
                    
                    Spacer()
                    
                    Text(headerTitle)
                        .foregroundColor(.green)
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                }, alignment: .center)
    }
}
