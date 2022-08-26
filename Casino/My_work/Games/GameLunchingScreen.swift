//
//  SwiftUIView.swift
//  Casino
//
//  Created by Muhammad Farid Ullah on 18/07/2022.
//

import SwiftUI

struct GameLunchingScreen: View {
    @State var isLoading: Bool = false
    @State var game_name: String
    var body: some View {
        ZStack {
            if !isLoading {
                HStack(alignment: .center) {
                    Image("lunchScreen")
                        .resizable()
                        //.scaledToFit()
                        .ignoresSafeArea()
                    .navigationBarHidden(false)
                }
                
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
                    .scaleEffect(2)
                    .padding(.bottom, 50)
            }else{
                if game_name == "WarCard"{
                    WarCardGame()
                        .navigationBarHidden(false)
                }else
                if game_name == "TicTacToe"{
                    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
                }else
                
                //{
                    if game_name == "Memorizing"{
                        TicTacTeo_HomeScreen()
                            //.navigationBarHidden(true)
                    } else
                if game_name == "Poker Game" {
                        ContentView_poker()
                    }
                //}
                    
            }
            
            
        }.onAppear {
            starteFakeNetworkCall22()
        }
    }
    
    func starteFakeNetworkCall22(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isLoading = true
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        GameLunchingScreen(game_name: "ddd")
    }
}
