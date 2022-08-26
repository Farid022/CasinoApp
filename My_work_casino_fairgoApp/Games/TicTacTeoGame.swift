//
//  TicTacTeoGame.swift
//  Casino
//
//  Created by Muhammad Farid Ullah on 18/07/2022.
//

import SwiftUI

struct TicTacTeo_HomeScreen: View {
    @State var animate: Bool = false
    
    var body: some View {
        NavigationView{
            ZStack {
                Image("HomeImg")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text(" Let The Fun Begin!! ")
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(.all)
                        .border(Color.white, width: 5)
                        .font(.system(size: 70))
                        .shadow(color: Color("shadowcolor"),
                                radius: 4,
                                x: 6.5,
                                y: 6.5)
                    
                        Divider()
                    
                    NavigationLink(destination: GameView().navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true), label: {
                        Image(systemName: "play.circle")
                            .padding(.top)
                            .font(.system(size: 160))
                            .foregroundColor(Color.white)
                            .shadow(color: Color("shadow"),
                                    radius: animate ? 30:10 ,
                                    x: 6.5,
                                    y: 6.5)
                            .scaleEffect(animate ? 1.1 : 0.5)
                            .offset(y: animate ? -7 : 0)
                    }) .padding(.horizontal, animate ? 30:70)
                }.onAppear(perform: addAnimation)
            }
            //.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)

        }
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(Animation
                            .easeInOut(duration: 2.0)
                            .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        TicTacTeo_HomeScreen()
    }
}


struct GameView: View {
    
    @StateObject private var gameVM = GameViewModel()
 

    
    
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("GameBg")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                GeometryReader { geometry in
                    VStack {
                        LazyVGrid(columns: gameVM.columns, spacing: 5) {
                            ForEach(0..<9){ i in
                                ZStack {
                                    Circle()
                                        .foregroundColor(Color("TileColor"))
                                        .frame(width: geometry.size.width/3 - 15,
                                               height: geometry.size.width/3 - 15)
                                        .shadow(color: Color("shadow") , radius: 4, x: 6.5, y: 6.5)
                                    
                                    Image(systemName: gameVM.moves[i]?.indicator ?? "")
                                        .font(.system(size: 60))
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(Color("textColor"))
                                        .shadow(color: Color("lightShadow"),
                                                radius: 4,
                                                x: 6.5,
                                                y: 6.5)
                                }
                                .onTapGesture {
                                    gameVM.processPlayer(for: i)
                                }
                            }
                        }
                        Spacer()
                    }.disabled(gameVM.isBoardDisabled)
                    .padding()
                    .alert(item: $gameVM.alertItem, content: {
                        alertItem in Alert(title: alertItem.title, message: alertItem.message, dismissButton: .default(alertItem.buttonTitle, action: {
                            gameVM.resetGame() }))
                        })
                }
            }
        }
    }
    
    
    
    

    
}





enum Player {
    case human
    case computer
}

struct Move {
    let player: Player
    var boardIndex: Int
    
    var indicator: String {
        return player == .human ? "ladybug" : "bolt"
    }
    
}


struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    var buttonTitle: Text
}

struct AlertView {

            static let humanWin = AlertItem(title: Text("You Win"),
                                            message: Text("You Are So Smart. You Helped The Bug To Escape."),
                                            buttonTitle: Text("Hell Yeah"))
            
           static let computerwin = AlertItem(title: Text("You Lost"),
                                        message: Text("Lightning Hit The Bug"),
                                        buttonTitle: Text("Beat The Light"))
            
           static  let draw = AlertItem(title: Text("Draw"),
                                 message: Text("What A Battle Of Wits."),
                                 buttonTitle: Text("Try Again"))
            
        
}


final class GameViewModel: ObservableObject {
    
    let columns: [GridItem] = [GridItem(.flexible()),
                                GridItem(.flexible()),
                                GridItem(.flexible()),]
    
    @Published  var moves: [Move?] = Array(repeating: nil, count: 9)
    @Published  var isBoardDisabled = false
    @Published  var alertItem: AlertItem?
    
    func processPlayer(for position: Int) {
        if isSquareOcupied(in: moves, forindex: position){ return }
        moves[position] = Move(player: .human, boardIndex: position)
      
        if checkWinConditions(for: .human, in: moves) {
            alertItem = AlertView.humanWin
            return
        }
        
        if checkForDraw(in: moves) {
            alertItem = AlertView.draw
            return
        }
        
        isBoardDisabled = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
            let computerPosition = determineCompMovePosition(in: moves)
            moves[computerPosition] = Move(player: .computer, boardIndex: computerPosition)
            isBoardDisabled = false
            if checkWinConditions(for: .computer, in: moves) {
                alertItem = AlertView.computerwin
                return
            }
            
            if checkForDraw(in: moves) {
                alertItem = AlertView.draw
                return
            }
        }
        
    }
    
    func isSquareOcupied(in moves: [Move?], forindex index: Int) -> Bool {
        return moves.contains(where: { $0?.boardIndex == index })
    }
    
    
    func determineCompMovePosition(in moves: [Move?]) -> Int {
        var movePosition = Int.random(in: 0..<9)
        
        while isSquareOcupied(in: moves, forindex: movePosition) {
            movePosition = Int.random(in: 0..<9)
        }
        return movePosition
    }
    
    
    func checkWinConditions(for player: Player, in moves: [Move?]) -> Bool {
        let winPatters: Set<Set<Int>> = [[0, 1, 2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
        
        let playerMoves = moves.compactMap{ $0 }.filter {$0.player == player }
        let playerPosition = Set(playerMoves.map { $0.boardIndex })
        
        for pattern in winPatters where pattern.isSubset(of: playerPosition) {
            return true
        }
            return false
        }
    
    
    func checkForDraw(in moves:[Move?]) -> Bool {
        return moves.compactMap { $0 }.count == 9
    }
    
    
    func resetGame() {
        moves = Array(repeating: nil, count: 9)
    }
}
