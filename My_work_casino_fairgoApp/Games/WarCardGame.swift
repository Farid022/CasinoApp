//
//  WarCardGame.swift
//  Casino
//
//  Created by Muhammad Farid Ullah on 18/07/2022.
//

import SwiftUI
struct WarCardGame: View {
    
    @State private var playerCard = "card5"
    @State private var cpuCard = "card9"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    @State private var war_string = ""
    
    var body: some View {
        ZStack{
            Color.green
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Image("logo")
                
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                
                Spacer()
                
                Button {
                    // Generate a random number between 2 and 14
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)
                             
                    // Update the cards
                    playerCard = "card" + String(playerRand)
                    cpuCard = "card" + String(cpuRand)
                             
                    // Update the score
                    if playerRand > cpuRand {
                       playerScore += 1
                    }
                    else if cpuRand > playerRand {
                       cpuScore += 1
                    }
                    else if playerRand == cpuRand{
                        war_string = "War started"
                    }
                    
                } label: {
                    Image("dealbutton")
                }

                Spacer()
                
                HStack {
                     Spacer()
                     VStack {
                        Text("Farid Khan")
                           .font(.headline)
                           .foregroundColor(Color.white)
                           .padding(.bottom, 10.0)
                         Text("\(playerScore)")
                           .font(.largeTitle)
                           .foregroundColor(Color.white)
                     }
                     Spacer()
                     VStack {
                        Text("Tajamal iqbal")
                           .font(.headline)
                           .foregroundColor(Color.white)
                           .padding(.bottom, 10.0)
                        Text("\(cpuScore)")
                           .font(.largeTitle)
                           .foregroundColor(Color.white)
                        }
                     Spacer()
                    
                    
                }
                
                Text(war_string)
                    .bold()
                    .font(.title)
                    .foregroundColor(.red)
                    .padding(.top,33)

                Spacer()
            }
        }
    }
}

struct WarCardGame_Previews: PreviewProvider {
    static var previews: some View {
        WarCardGame()
    }
}
