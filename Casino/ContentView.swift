//
//  ContentView.swift
//  Casino
//  Created by Muhammad Farid Ullah on 27/06/2022.
//
//
import SwiftUI

struct Progress_View: View {

    @State private var currentValue = 0.0
    //publish after 1 sec, run on main thread
    let timer = Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect() //connect at soon as screen loads

        var body: some View {
            VStack{
                ProgressView("Downloading…", value: currentValue, total: 10)
                    .padding()
                //Listening to the changes
                    .onReceive(timer) { _ in
                        if currentValue < 100 {
                            currentValue += 10
                        }
                    }
                    .accentColor(.purple)
                    .foregroundColor(.red)

                Button("Reset") {
                    currentValue = 0.0
                }
            }
        }

}

struct Progress_View_Previews: PreviewProvider {
    static var previews: some View {
        Progress_View()
    }
}



//import SwiftUI
//
//let timer = Timer
//    .publish(every: 1, on: .main, in: .common)
//    .autoconnect()
//
//struct Clock: View {
//    var counter: Int
//    var countTo: Int
//
//    var body: some View {
//        VStack {
//            Text(counterToMinutes())
//                .font(.custom("Avenir Next", size: 60))
//                .fontWeight(.black)
//        }
//    }
//
//    func counterToMinutes() -> String {
//        let currentTime = 0
//        let seconds = currentTime % 60
//        let minutes = Int(currentTime / 60)
//
//        return "\(minutes):\(seconds < 10 ? "0" : "")\(seconds)"
//    }
//
//}
//
//struct ProgressTrack: View {
//    var body: some View {
//        Circle()
//            .fill(Color.clear)
//            .frame(width: 250, height: 250)
//            .overlay(
//                Circle().stroke(Color.black, lineWidth: 15)
//        )
//    }
//}
//
//struct ProgressBar: View {
//    var counter: Int
//    var countTo: Int
//
//    var body: some View {
//        Circle()
//            .fill(Color.clear)
//            .frame(width: 250, height: 250)
//            .overlay(
//                Circle().trim(from:0, to: progress())
//                    .stroke(
//                        style: StrokeStyle(
//                            lineWidth: 15,
//                            lineCap: .round,
//                            lineJoin:.round
//                        )
//                )
//                    .foregroundColor(
//                        (completed() ? Color.green : Color.orange)
//                ).animation(
//                    .easeInOut(duration: 0.2)
//                )
//        )
//    }
//
//    func completed() -> Bool {
//        return progress() == 1
//    }
//
//    func progress() -> CGFloat {
//        return (CGFloat(counter) / CGFloat(countTo))
//    }
//}
//
//struct CountdownView: View {
//    @State var counter: Int = 0
//    var countTo: Int = 100
//
//    var body: some View {
//        VStack{
//            ZStack{
//                ProgressTrack()
//                ProgressBar(counter: counter, countTo: countTo)
//                Clock(counter: counter, countTo: countTo)
//            }
//        }.onReceive(timer) { time in
//            if (self.counter < 100) {
//                self.counter += 10
//            }
//        }
//    }
//}
//
//struct Progresss_indicator_Previews: PreviewProvider {
//    static var previews: some View {
//        Progresss_indicator()
//    }
//}
//
//
struct Progresss_indicator: View {
    @State var circleProgress: CGFloat = 0.0
    var body: some View{
        ZStack{

            ZStack {
                Circle()
                    //.trim(from: 0.0, to: circleProgress)
                    .stroke(Color.black, lineWidth: 15)
                    .frame(width: 200, height: 200)
                    .rotationEffect(Angle(degrees: -90))

                Circle()
                    .trim(from: 0.0, to: circleProgress)
                    .stroke(Color.green, lineWidth: 15)
                    .frame(width: 200, height: 200)
                .rotationEffect(Angle(degrees: -90))

            }

            Text("\(Int(self.circleProgress*100))%")
                    .font(.custom("HelveticaNeue", size: 20.0))
        }

        Button("start") {
            //self.startLoading()
            circleProgress += 10
        }
    }

    func startLoading() {
            _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                withAnimation() {
                    self.circleProgress += 0.01
                    if self.circleProgress >= 1.0 {
                        timer.invalidate()
                    }
                }
            }
        }
}





//struct timer_onReceiver_counting: View {
//    //create a publisher and then subscribe to it to access it
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//
//    @State var count: Int = 0
//    @State var finishText: String? = nil
//
//    @State var currentDate: Date = Date()
//
//    var body: some View {
//        ZStack{
//            RadialGradient(
//                gradient: Gradient(colors: [Color.red, Color.purple]),
//                center: .center,
//                startRadius: 5,
//                endRadius: 500)
//                .ignoresSafeArea()
//
//            //Text(currentDate.description)
//            Text(finishText ?? "\(count)")
//                .font(.system(size: 100, weight: .semibold, design: .rounded))
//                .bold()
//                .lineLimit(1)
//                .minimumScaleFactor(0.1)

//            HStack(spacing: 15){
//                Circle()
//                    .offset(y: count == 1 ? -20 : 0)
//                Circle()
//                    .offset(y: count == 2 ? -20 : 0)
//                Circle()
//                    .offset(y: count == 3 ? -20 : 0)
//            }
//            .frame(width: 150)
//            .foregroundColor(.white)

//            TabView(selection: $count) {
//                Rectangle()
//                    .foregroundColor(Color.gray)
//                    .tag(1)
//
//                Rectangle()
//                    .foregroundColor(Color.green)
//                    .tag(2)
//
//                Rectangle()
//                    .foregroundColor(Color.blue)
//                    .tag(3)
//
//                Rectangle()
//                    .foregroundColor(Color.white)
//                    .tag(4)
//            }
//            .frame(height: 200)
//            .tabViewStyle(PageTabViewStyle())
//        }
//        .onReceive(timer) { value in
//            currentDate = value
//        }
//        .onReceive(timer, perform: { _ in
//            if count <= 1 {
//                finishText = "Finished"
//            }else{
//                count -= 1
//            }
//        })
//        .onReceive(timer) { _ in
//            withAnimation(.easeInOut(duration: 0.5)){
//                count = count == 3 ? 0 : count + 1
//            }
//        }

//        .onReceive(timer) { _ in
//            withAnimation(.default){
//                count = count == 5 ? 1 : count + 1
//            }
//        }
//
//    }
//}
//
//struct timer_onReceiver_counting_Previews: PreviewProvider {
//    static var previews: some View {
//        timer_onReceiver_counting()
//    }
//}

//
//import SwiftUI
//import UIKit
//import WebKit
//
//struct WebViewExample: View {
//
//    @State var html_String = "<html>\r\n\r\n<head>\r\n  <meta charset=\"utf-8\">\r\n  <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n</head>\r\n<body>\r\n  <h1>Play BlackJack</h1>\r\n  <p>Equally well known as Twenty-One. The rules are simple, the play is thrilling, and there is opportunity for high strategy. In fact, for the expert player who mathematically plays a perfect game and is able to count cards, the odds are sometimes in that player`s favor to win.</p>\r\n  <p>But even for the casual participant who plays a reasonably good game, the casino odds are less, making Blackjack one of the most attractive casino games for the player. While the popularity of Blackjack dates from World War I, its roots go back to the 1760s in France, where it is called Vingt-et-Un (French for 21). Today, Blackjack is the one card game that can be found in every American casino. As a popular home game, it is played with slightly different rules. In the casino version, the house is the dealer (a \"permanent bank\"). In casino play, the dealer remains standing, and the players are seated. The dealer is in charge of running all aspects of the game, from shuffling and dealing the cards to handling all bets. In the home game, all of the players have the opportunity to be the dealer (a \"changing bank\").</p>\r\n\r\n  <p> </p>\r\n  <h2><strong>The Pack<br/></strong></h2>\r\n  <p>The standard 52-card pack is used, but in most casinos several decks of cards are shuffled together. The six-deck game (312 cards) is the most popular. In addition, the dealer uses a blank plastic card, which is never dealt, but is placed toward the bottom of the pack to indicate when it will be time for the cards to be reshuffled. When four or more decks are used, they are dealt from a shoe (a box that allows the dealer to remove cards one at a time, face down, without actually holding one or more packs).</p>\r\n  \r\n  <p> </p>\r\n  <h2><strong>Object of the Game<br/></strong></h2>\r\n  <p>Each participant attempts to beat the dealer by getting a count as close to 21 as possible, without going over 21.</p>\r\n\r\n  <p> </p>\r\n  <h2><strong>Card Values/Scoring<br/></strong></h2>\r\n  <p>It is up to each individual player if an ace is worth 1 or 11. Face cards are 10 and any other card is its pip value.</p>\r\n\r\n  <p> </p>\r\n  <h2><strong>The Shuffle and Cut<br/></strong></h2>\r\n  <p>The dealer thoroughly shuffles portions of the pack until all the cards have been mixed and combined. The dealer designates one of the players to cut, and the plastic insert card is placed so that the last 60 to 75 cards or so will not be used. (Not dealing to the bottom of all the cards makes it more difficult for professional card counters to operate effectively.)</p>\r\n\r\n  <p> </p>\r\n  <h2><strong>The Deal<br/></strong></h2>\r\n  <p>When all the players have placed their bets, the dealer gives one card face up to each player in rotation clockwise, and then one card face up to themselves. Another round of cards is then dealt face up to each player, but the dealer takes the second card face down. Thus, each player except the dealer receives two cards face up, and the dealer receives one card face up and one card face down. (In some games, played with only one deck, the players` cards are dealt face down and they get to hold them. Today, however, virtually all Blackjack games feature the players` cards dealt face up on the condition that no player may touch any cards.)</p>\r\n\r\n  <p> </p>\r\n  <h2><strong>Naturals<br/></strong></h2>\r\n  <p>If a player`s first two cards are an ace and a \"ten-card\" (a picture card or 10), giving a count of 21 in two cards, this is a natural or \"blackjack.\" If any player has a natural and the dealer does not, the dealer immediately pays that player one and a half times the amount of their bet. If the dealer has a natural, they immediately collect the bets of all players who do not have naturals, (but no additional amount). If the dealer and another player both have naturals, the bet of that player is a stand-off (a tie), and the player takes back his chips.</p>\r\n\r\n  <p>If the dealer`s face-up card is a ten-card or an ace, they look at their face-down card to see if the two cards make a natural. If the face-up card is not a ten-card or an ace, they do not look at the face-down card until it is the dealer`s turn to play.</p>\r\n\r\n\r\n  <p> </p>\r\n  <h2><strong>The Play<br/></strong></h2>\r\n  <p>The player to the left goes first and must decide whether to \"stand\" (not ask for another card) or \"hit\" (ask for another card in an attempt to get closer to a count of 21, or even hit 21 exactly). Thus, a player may stand on the two cards originally dealt to them, or they may ask the dealer for additional cards, one at a time, until deciding to stand on the total (if it is 21 or under), or goes \"bust\" (if it is over 21). In the latter case, the player loses and the dealer collects the bet wagered. The dealer then turns to the next player to their left and serves them in the same manner.</p>\r\n  \r\n  <p>The combination of an ace with a card other than a ten-card is known as a \"soft hand,\" because the player can count the ace as a 1 or 11, and either draw cards or not. For example with a \"soft 17\" (an ace and a 6), the total is 7 or 17. While a count of 17 is a good hand, the player may wish to draw for a higher total. If the draw creates a bust hand by counting the ace as an 11, the player simply counts the ace as a 1 and continues playing by standing or \"hitting\" (asking the dealer for additional cards, one at a time).</p>\r\n\r\n  <p> </p>\r\n  <h2><strong>The Dealer`s Play<br/></strong></h2>\r\n  <p>When the dealer has served every player, the dealers face-down card is turned up. If the total is 17 or more, it must stand. If the total is 16 or under, they must take a card. The dealer must continue to take cards until the total is 17 or more, at which point the dealer must stand. If the dealer has an ace, and counting it as 11 would bring the total to 17 or more (but not over 21), the dealer must count the ace as 11 and stand. The dealer`s decisions, then, are automatic on all plays, whereas the player always has the option of taking one or more cards.</p>\r\n  \r\n  <p> </p>\r\n  <h2><strong>Signaling Intentions<br/></strong></h2>\r\n  <p>When a player`s turn comes, they can say \"Hit\" or can signal for a card by scratching the table with a finger or two in a motion toward themselves, or they can wave their hand in the same motion that would say to someone \"Come here!\" When the player decides to stand, they can say \"Stand\" or \"No more,\" or can signal this intention by moving their hand sideways, palm down and just above the table.</p>\r\n\r\n  <p> </p>\r\n  <h2><strong>Splitting Pairs<br/></strong></h2>\r\n  <p>If a player`s first two cards are of the same denomination, such as two jacks or two sixes, they may choose to treat them as two separate hands when their turn comes around. The amount of the original bet then goes on one of the cards, and an equal amount must be placed as a bet on the other card. The player first plays the hand to their left by standing or hitting one or more times; only then is the hand to the right played. The two hands are thus treated separately, and the dealer settles with each on its own merits. With a pair of aces, the player is given one card for each ace and may not draw again. Also, if a ten-card is dealt to one of these aces, the payoff is equal to the bet (not one and one-half to one, as with a blackjack at any other time).</p>\r\n\r\n  <p> </p>\r\n  <h2><strong>Doubling Down<br/></strong></h2>\r\n  <p>Another option open to the player is doubling their bet when the original two cards dealt total 9, 10, or 11. When the player`s turn comes, they place a bet equal to the original bet, and the dealer gives the player just one card, which is placed face down and is not turned up until the bets are settled at the end of the hand. With two fives, the player may split a pair, double down, or just play the hand in the regular way. Note that the dealer does not have the option of splitting or doubling down.</p>\r\n\r\n  <p> </p>\r\n  <h2><strong>Insurance<br/></strong></h2>\r\n  <p>When the dealer`s face-up card is an ace, any of the players may make a side bet of up to half the original bet that the dealer`s face-down card is a ten-card, and thus a blackjack for the house. Once all such side bets are placed, the dealer looks at the hole card. If it is a ten-card, it is turned up, and those players who have made the insurance bet win and are paid double the amount of their half-bet - a 2 to 1 payoff. When a blackjack occurs for the dealer, of course, the hand is over, and the players` main bets are collected - unless a player also has blackjack, in which case it is a stand-off. Insurance is invariably not a good proposition for the player, unless they are quite sure that there are an unusually high number of ten-cards still left undealt.</p>\r\n\r\n  <p> </p>\r\n  <h2><strong>Settlement<br/></strong></h2>\r\n  <p>A bet once paid and collected is never returned. Thus, one key advantage to the dealer is that the player goes first. If the player goes bust, they have already lost their wager, even if the dealer goes bust as well. If the dealer goes over 21, the dealer pays each player who has stood the amount of that player`s bet. If the dealer stands at 21 or less, the dealer pays the bet of any player having a higher total (not exceeding 21) and collects the bet of any player having a lower total. If there is a stand-off (a player having the same total as the dealer), no chips are paid out or collected.</p>\r\n\r\n  <p> </p>\r\n  <h2><strong>Reshuffling<br/></strong></h2>\r\n  <p>When each player`s bet is settled, the dealer gathers in that player`s cards and places them face up at the side against a clear plastic L-shaped shield. The dealer continues to deal from the shoe until coming to the plastic insert card, which indicates that it is time to reshuffle. Once that round of play is over, the dealer shuffles all the cards, prepares them for the cut, places the cards in the shoe, and the game continues.</p>\r\n\r\n\r\n  <p> </p>\r\n  <h2><strong>Basic Strategy<br/></strong></h2>\r\n  <p>Winning tactics in Blackjack require that the player play each hand in the optimum way, and such strategy always takes into account what the dealer`s upcard is. When the dealer`s upcard is a good one, a 7, 8, 9, 10-card, or ace for example, the player should not stop drawing until a total of 17 or more is reached. When the dealer`s upcard is a poor one, 4, 5, or 6, the player should stop drawing as soon as he gets a total of 12 or higher. The strategy here is never to take a card if there is any chance of going bust. The desire with this poor holding is to let the dealer hit and hopefully go over 21. Finally, when the dealer`s up card is a fair one, 2 or 3, the player should stop with a total of 13 or higher.</p>\r\n  <p>With a soft hand, the general strategy is to keep hitting until a total of at least 18 is reached. Thus, with an ace and a six (7 or 17), the player would not stop at 17, but would hit.</p>\r\n  <p>The basic strategy for doubling down is as follows: With a total of 11, the player should always double down. With a total of 10, he should double down unless the dealer shows a ten-card or an ace. With a total of 9, the player should double down only if the dealer`s card is fair or poor (2 through 6).</p>\r\n  <p>For splitting, the player should always split a pair of aces or 8s; identical ten-cards should not be split, and neither should a pair of 5s, since two 5s are a total of 10, which can be used more effectively in doubling down. A pair of 4s should not be split either, as a total of 8 is a good number to draw to. Generally, 2s, 3s, or 7s can be split unless the dealer has an 8, 9, ten-card, or ace. Finally, 6s should not be split unless the dealer`s card is poor (2 through 6).</p>\r\n</body>\r\n</html>"
//
//    @ObservedObject var webViewModel = WebViewModel(url: "")
//    var body: some View {
//        NavigationView {
//                   VStack {
//                       ScrollView {
//                           Text("This is is a text").font(.title)
//                           WebViewContainer(webViewModel: webViewModel, html_string_request: $html_String).frame(height: 2500)
//
//
//                           Button {
//
//                           } label: {
//                               Text("Custom Button").foregroundColor(.white).padding(.vertical,16).frame(width: 200).background(Color.red.cornerRadius(12))
//                           }
//
//                           Image(systemName: "heart").font(.largeTitle).foregroundColor(.blue)
//
//                       }.listStyle(.plain)
//                       if webViewModel.isLoading {
//                           ProgressView()
//                               .frame(height: 30)
//
//                       }
//                   }
//                   .navigationBarHidden(true)
//
//               }
//    }
//}
//
//struct WebViewExample_Previews: PreviewProvider {
//    static var previews: some View {
//        WebViewExample()
//    }
//}
//
//
//
//
//


import SwiftUI
//
//struct DrawerContent: View {
//    var body: some View {
//        NavigationView{
//            ZStack{
//                Color.red
//                    .ignoresSafeArea()
//                VStack{
//
//                    NavigationLink {
//                        Text("New View")
//                    } label: {
//                        Text("Go to new view")
//                    }
//
//                }
//            }.navigationBarHidden(true)
//        }
//    }
//}
//
//struct NavigationDrawer: View {
//    private let width = UIScreen.main.bounds.width - 100
//    @Binding var isOpen: Bool
//
//    var body: some View {
//        HStack {
//            DrawerContent()
//                .frame(width: self.width)
//                .offset(x: self.isOpen ? 0 : -self.width)
//                .animation(.easeOut, value: true)
//            Spacer()
//        }.onTapGesture {
//            self.isOpen.toggle()
//        }
//    }
//}
//
//struct ContentView: View {
//    @State var isDrawerOpen: Bool = false
//
//    var body: some View {
//        ZStack {
//            NavigationView {
//                EmptyView()
//                    .navigationBarTitle(Text("Navigation Drawer"))
//                    .navigationBarItems(leading: Button(action: {
//                        self.isDrawerOpen.toggle()
//                    }) {
//                        Image(systemName: "sidebar.left")
//                    })
//            }
//
//            NavigationDrawer(isOpen: self.$isDrawerOpen)
//        }
//    }
//}
//
//struct NavigationDrawer_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//
//struct SideBarStack<SidebarContent: View, Content: View>: View {
//
//    let sidebarContent: SidebarContent
//    let mainContent: Content
//    let sidebarWidth: CGFloat
//    @Binding var showSidebar: Bool
//
//    init(sidebarWidth: CGFloat, showSidebar: Binding<Bool>, @ViewBuilder sidebar: ()->SidebarContent, @ViewBuilder content: ()->Content) {
//        self.sidebarWidth = sidebarWidth
//        self._showSidebar = showSidebar
//        sidebarContent = sidebar()
//        mainContent = content()
//    }
//
//    var body: some View {
//        ZStack(alignment: .leading) {
//            sidebarContent
//                .frame(width: sidebarWidth, alignment: .center)
//                .offset(x: showSidebar ? 0 : -1 * sidebarWidth, y: 0)
//                .animation(Animation.easeInOut.speed(2))
//            mainContent
//                .overlay(
//                    Group {
//                        if showSidebar {
//                            Color.white
//                                .opacity(showSidebar ? 0.01 : 0)
//                                .onTapGesture {
//                                    self.showSidebar = false
//                                }
//                        } else {
//                            Color.clear
//                            .opacity(showSidebar ? 0 : 0)
//                            .onTapGesture {
//                                self.showSidebar = false
//                            }
//                        }
//                    }
//                )
//                .offset(x: showSidebar ? sidebarWidth : 0, y: 0)
//                .animation(Animation.easeInOut.speed(2))
//
//        }
//    }
//}
//
//struct ContentView: View {
//
//    // Controls display of sidebar
//    @State var showSidebar: Bool = false
//
//    var body: some View {
//        SideBarStack(sidebarWidth: 125, showSidebar: $showSidebar) {
//           // Sidebar content here
//            VStack(alignment: .leading, spacing: 0) {
//                    Image("arnold")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(maxWidth: .infinity)
//
////                NavigationLink("", isActive: $show_newScreen) {
////                    Rating_view(rating: .constant(4)).frame(width: 400, height: 500)
////                }
//
//                Button {
////                    show_newScreen = true
////                    showMenu = false
//                } label: {
//                    HStack{
//                        Image(systemName: "house")
//                            .font(.title2)
//                            .background(Color.red)
//                            .scaledToFit()
//                            .cornerRadius(5)
//                        Text("Dashboard")
//                            .foregroundColor(Color.black)
//                            .fontWeight(.bold)
//                    }
//                }.accentColor(Color.white)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .frame(height: 44)
//                    .background(Color.white)
//                    .padding(.leading, 15)
//
//
//                List{
//                    NavigationLink {
//                        Rating_view(rating: .constant(4))
//                    } label: {
//                        ReuseAble_list_item(title: "Australia", image: "chevron.right")
//                    }
//
//
//                    Button {
//                        //
//                    } label: {
//                        ReuseAble_list_item(title: "Canada", image: "chevron.right")
//                    }
//
//                    Button {
//                        //
//                    } label: {
//                        ReuseAble_list_item(title: "Brazil", image: "chevron.right")
//                    }
//
//
//                    Button {
//                        //
//                    } label: {
//                        ReuseAble_list_item(title: "Pakistan", image: "chevron.right")
//                    }
//
//
//                    Button {
//                        //
//                    } label: {
//                        ReuseAble_list_item(title: "Austria", image: "chevron.right")
//                    }
//
//
//                    Button {
//                        //
//                    } label: {
//                        ReuseAble_list_item(title: "South Africa", image: "chevron.right")
//                    }
//
//
//                    Button {
//                        //
//                    } label: {
//                        ReuseAble_list_item(title: "Germany", image: "chevron.right")
//                    }
//
//
//                    Button {
//                        //
//                    } label: {
//                        HStack{
//                            Image(systemName: "house")
//                                .font(.title2)
//                                .background(Color.yellow)
//                                .scaledToFit()
//                                .cornerRadius(5)
//                            Text("Dashboard")
//                        }
//                    }
//
//
//
//                    Button {
//                        //
//                    } label: {
//                        HStack{
//                            Image(systemName: "house")
//                                .font(.title2)
//                                .background(Color.blue)
//                                .scaledToFit()
//                                .cornerRadius(5)
//                            Text("Dashboard")
//                        }
//                    }
//
//
//                    Button {
//                        //
//                    } label: {
//                        HStack{
//                            Image(systemName: "house")
//                                .font(.title2)
//                                .background(Color.green)
//                                .scaledToFit()
//                                .cornerRadius(5)
//                            Text("Dashboard")
//                        }
//                    }
//
//
//
//                }
//                .listStyle(.plain)
//
//            }
//
//
//        } content: {
//           // Main content here
//
//            Text("Jemmy")
//        }.edgesIgnoringSafeArea(.all)
//    }
//}

//main view
//struct ContentView1: View{
//    @State var isShowingMenu = false
//
//    var body: some View{
//        NavigationView{
//
//            ZStack{
//                Color.green
//
//                if isShowingMenu {
//                    sideMenuView(isShowing_menu: $isShowingMenu)
//                }
//
//
//
//
//                Home_View()
//                    .offset(x: isShowingMenu ? 300 : 0, y: 0)
//                    .scaleEffect(isShowingMenu ? 0.8 : 1 )
//                    //.cornerRadius(isShowingMenu ? 20 : 10)
//                    .navigationBarItems(leading: Button(action: {
//                        withAnimation(.spring()){
//                            isShowingMenu.toggle()
//                        }
//                    }, label: {
//                        Image(systemName: "list.bullet")
//                            //.foregroundColor(.black)
//                    }))
//                    .navigationTitle("Home")
//                    .foregroundColor(Color.red)
//            }
//
//        }
//    }
//}




//Okay it is done
//struct SideMenu_Header: View{
//    @Binding var isShowing_menu: Bool
//    var body: some View{
//        VStack {
//            HStack {
//                Image("uk_flag")
//                            .resizable()
//                            .frame (width: 260, height: 200)
//
//                Spacer()
//            }
//            Spacer()
//
//        }
//        .ignoresSafeArea()
//
//    }
//}


//            Button {
//                isShowing_menu.toggle()
//            } label: {
//                Text("xmark")
//                    .frame(width: 32, height: 32)
//                    .foregroundColor(.blue)
//                    .padding()
//            }

//struct SideMenuOptions: View{
//    let vm: SideMenuViewModel
//
//    var body: some View{
//        HStack(spacing: 16){
//            Image(systemName: vm.imageName)
//        //.frame(width: 24, height: 24)
//
//            Text(vm.title)
//                .font(.system(size: 15, weight: .semibold))
//
//        Spacer()
//        }.foregroundColor(.green)
//    }
//}

//struct sideMenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        sideMenuView(isShowing_menu: .constant(true))
//    }
//}

//struct Home_View: View {
//    var body: some View {
//        ZStack{
//            Color.red
//                //.ignoresSafeArea()
//
//            Text("Jemmy")
//                .padding()
//                .background(Color.green)
//        }
//
//    }
//}

//enum SideMenuViewModel: Int, CaseIterable{
//case profile
//case lists
//case bookmarks
//case messages
//case notifications
//case logout
//
//    var title: String {
//        switch self {
//    case .profile: return "Profile"
//    case .lists: return "Lists"
//    case .bookmarks: return "Bookmarks"
//    case .messages: return "Messages"
//    case .notifications: return "Notifications"
//    case .logout: return "Logout"
//    }
//}
//
//    var imageName: String{
//        switch self {
//        case .profile: return "person"
//        case .lists: return "list.bullet"
//        case .bookmarks: return "bookmark"
//        case .messages: return "bubble left"
//        case .notifications: return "bell"
//        case .logout: return "arrow.left.square"
//        }
//    }
//
//}





    
//                    List {
//                        NavigationLink {
//                            Rating_view(rating: .constant(4))
//                        } label: {
//                            ReuseAble_list_item(title: "Australia", image: "chevron.right")
//                        }
//                        ForEach(SideMenuViewModel.allCases, id: \.self){ option in
//                            NavigationLink {
//                                Text(option.title)
//                            } label: {
//                                SideMenuOptions(vm: option)
//                            }
//
//                        }
//
//                        //Text("ddddd")
//                    }




//downloadDataWith_combine
//import SwiftUI
//import Combine
//
//
////https://app.quicktype.io a website to check/match the model
//struct PostsModel: Identifiable, Codable {
//    let userId: Int
//    let id: Int
//    let title: String
//    let body: String
//}
//
//class downloadDataWith_combineVM: ObservableObject{
//
//    @Published var posts: [PostsModel] = []
//    var cancelable = Set<AnyCancellable>()
//
//    @Published var isLoading: Bool = false
//
//    //https://jsonplaceholder.typicode.com A website which contains fake JSON data
//    func getPosts(){
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
//
//        URLSession.shared.dataTaskPublisher(for: url)
//           // .subscribe(on: DispatchQueue.global(qos: .background))//It is automatically done by dataTaskPublisher
//            .receive(on: DispatchQueue.main)
//            .tryMap(handleOutput)
//            .decode(type: [PostsModel].self, decoder: JSONDecoder())
//            .sink { completion in
//        print("Completion: \(completion)") //to throw an error message and unsucessful, if it fails.
//        switch completion{
//        case .finished:
//            print("Finished")
//        case .failure(let error):
//            print("There was an error loading data: \(error)") // in real app, we'd show an alert
//        }
//        } receiveValue: { [weak self] returnedPostModel in //receive the value otherwise
//            self?.posts = returnedPostModel}
//            .store(in: &cancelable)
//
//        isLoading = true
//    }
//
//    func handleOutput(ouput: URLSession.DataTaskPublisher.Output) throws -> Data{
//        guard
//            let response = ouput.response as? HTTPURLResponse,
//            response.statusCode >= 200 && response.statusCode < 300 else {
//                throw URLError(.badServerResponse)
//            }
//        return ouput.data
//    }
//
//}

//struct downloadData_withCombine: View {
//    @State var code = "ISBN"
//    @StateObject var vm = downloadDataWith_combineVM()
//
//    var body: some View {
//
//        ZStack{
//            Color.red.ignoresSafeArea()
//
//            List{
//                ForEach(vm.posts) { post in
//                    VStack{
//                        Text(post.title)
//                            .font(.title)
//                        Text(post.body)
//                    }
//                }
//            }
//
//            if vm.isLoading {
//                ProgressView()
//                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
//                    .scaleEffect(2)
//            }
//
//
//        }.onAppear {
//            vm.isLoading = true
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                vm.getPosts()
//                vm.isLoading = false
//            }
//
//        }
//
//
//    }
//}
//
//struct downloadData_withCombine_Previews: PreviewProvider {
//    static var previews: some View {
//        downloadData_withCombine()
//    }
//}
