//
//  Web_view_description.swift
//  Casino
//
//  Created by Muhammad Farid Ullah on 29/06/2022.
//

import SwiftUI
import WebKit

struct Web_view_description: View {
    @State private var size: CGSize = .zero
    @State var html_String = "<html>\r\n\r\n<head>\r\n  <meta charset=\"utf-8\">\r\n  <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n</head>\r\n<body>\r\n  <h1>Play BlackJack</h1>\r\n  <p>Equally well known as Twenty-One. The rules are simple, the play is thrilling, and there is opportunity for high strategy. In fact, for the expert player who mathematically plays a perfect game and is able to count cards, the odds are sometimes in that player`s favor to win.</p>\r\n  <p>But even for the casual participant who plays a reasonably good game, the casino odds are less, making Blackjack one of the most attractive casino games for the player. While the popularity of Blackjack dates from World War I, its roots go back to the 1760s in France, where it is called Vingt-et-Un (French for 21). Today, Blackjack is the one card game that can be found in every American casino. As a popular home game, it is played with slightly different rules. In the casino version, the house is the dealer (a \"permanent bank\"). In casino play, the dealer remains standing, and the players are seated. The dealer is in charge of running all aspects of the game, from shuffling and dealing the cards to handling all bets. In the home game, all of the players have the opportunity to be the dealer (a \"changing bank\").</p>\r\n\r\n  <p> </p>\r\n  <h2><strong>The Pack<br/></strong></h2>\r\n  <p>The standard 52-card pack is used, but in most casinos several decks of cards are shuffled together. The six-deck game (312 cards) is the most popular. In addition, the dealer uses a blank plastic card, which is never dealt, but is placed toward the bottom of the pack to indicate when it will be time for the cards to be reshuffled. When four or more decks are used, they are dealt from a shoe (a box that allows the dealer to remove cards one at a time, face down, without actually holding one or more packs).</p>\r\n  \r\n  <p> </p>\r\n  <h2><strong>Object of the Game<br/></strong></h2>\r\n  <p>Each participant attempts to beat the dealer by getting a count as close to 21 as possible, without going over 21.</p>\r\n\r\n  <p> </p>\r\n  <h2><strong>Card Values/Scoring<br/></strong></h2>\r\n  <p>It is up to each individual player if an ace is worth 1 or 11. Face cards are 10 and any other card is its pip value.</p>\r\n\r\n  <p> </p>\r\n  <h2><strong>The Shuffle and Cut<br/></strong></h2>\r\n  <p>The dealer thoroughly shuffles portions of the pack until all the cards have been mixed and combined. The dealer designates one of the players to cut, and the plastic insert card is placed so that the last 60 to 75 cards or so will not be used. (Not dealing to the bottom of all the cards makes it more difficult for professional card counters to operate effectively.)</p>\r\n\r\n  <p> </p>\r\n  <h2><strong>The Deal<br/></strong></h2>\r\n  <p>When all the players have placed their bets, the dealer gives one card face up to each player in rotation clockwise, and then one card face up to themselves. Another round of cards is then dealt face up to each player, but the dealer takes the second card face down. Thus, each player except the dealer receives two cards face up, and the dealer receives one card face up and one card face down. (In some games, played with only one deck, the players` cards are dealt face down and they get to hold them. Today, however, virtually all Blackjack games feature the players` cards dealt face up on the condition that no player may touch any cards.)</p>\r\n\r\n  <p> </p>\r\n  <h2><strong>Naturals<br/></strong></h2>\r\n  <p>If a player`s first two cards are an ace and a \"ten-card\" (a picture card or 10), giving a count of 21 in two cards, this is a natural or \"blackjack.\" If any player has a natural and the dealer does not, the dealer immediately pays that player one and a half times the amount of their bet. If the dealer has a natural, they immediately collect the bets of all players who do not have naturals, (but no additional amount). If the dealer and another player both have naturals, the bet of that player is a stand-off (a tie), and the player takes back his chips.</p>\r\n\r\n  <p>If the dealer`s face-up card is a ten-card or an ace, they look at their face-down card to see if the two cards make a natural. If the face-up card is not a ten-card or an ace, they do not look at the face-down card until it is the dealer`s turn to play.</p>\r\n\r\n\r\n  <p> </p>\r\n  <h2><strong>The Play<br/></strong></h2>\r\n  <p>The player to the left goes first and must decide whether to \"stand\" (not ask for another card) or \"hit\" (ask for another card in an attempt to get closer to a count of 21, or even hit 21 exactly). Thus, a player may stand on the two cards originally dealt to them, or they may ask the dealer for additional cards, one at a time, until deciding to stand on the total (if it is 21 or under), or goes \"bust\" (if it is over 21). In the latter case, the player loses and the dealer collects the bet wagered. The dealer then turns to the next player to their left and serves them in the same manner.</p>\r\n  \r\n  <p>The combination of an ace with a card other than a ten-card is known as a \"soft hand,\" because the player can count the ace as a 1 or 11, and either draw cards or not. For example with a \"soft 17\" (an ace and a 6), the total is 7 or 17. While a count of 17 is a good hand, the player may wish to draw for a higher total. If the draw creates a bust hand by counting the ace as an 11, the player simply counts the ace as a 1 and continues playing by standing or \"hitting\" (asking the dealer for additional cards, one at a time).</p>\r\n\r\n  <p> </p>\r\n  <h2><strong>The Dealer`s Play<br/></strong></h2>\r\n  <p>When the dealer has served every player, the dealers face-down card is turned up. If the total is 17 or more, it must stand. If the total is 16 or under, they must take a card. The dealer must continue to take cards until the total is 17 or more, at which point the dealer must stand. If the dealer has an ace, and counting it as 11 would bring the total to 17 or more (but not over 21), the dealer must count the ace as 11 and stand. The dealer`s decisions, then, are automatic on all plays, whereas the player always has the option of taking one or more cards.</p>\r\n  \r\n  <p> </p>\r\n  <h2><strong>Signaling Intentions<br/></strong></h2>\r\n  <p>When a player`s turn comes, they can say \"Hit\" or can signal for a card by scratching the table with a finger or two in a motion toward themselves, or they can wave their hand in the same motion that would say to someone \"Come here!\" When the player decides to stand, they can say \"Stand\" or \"No more,\" or can signal this intention by moving their hand sideways, palm down and just above the table.</p>\r\n\r\n  <p> </p>\r\n  <h2><strong>Splitting Pairs<br/></strong></h2>\r\n  <p>If a player`s first two cards are of the same denomination, such as two jacks or two sixes, they may choose to treat them as two separate hands when their turn comes around. The amount of the original bet then goes on one of the cards, and an equal amount must be placed as a bet on the other card. The player first plays the hand to their left by standing or hitting one or more times; only then is the hand to the right played. The two hands are thus treated separately, and the dealer settles with each on its own merits. With a pair of aces, the player is given one card for each ace and may not draw again. Also, if a ten-card is dealt to one of these aces, the payoff is equal to the bet (not one and one-half to one, as with a blackjack at any other time).</p>\r\n\r\n  <p> </p>\r\n  <h2><strong>Doubling Down<br/></strong></h2>\r\n  <p>Another option open to the player is doubling their bet when the original two cards dealt total 9, 10, or 11. When the player`s turn comes, they place a bet equal to the original bet, and the dealer gives the player just one card, which is placed face down and is not turned up until the bets are settled at the end of the hand. With two fives, the player may split a pair, double down, or just play the hand in the regular way. Note that the dealer does not have the option of splitting or doubling down.</p>\r\n\r\n  <p> </p>\r\n  <h2><strong>Insurance<br/></strong></h2>\r\n  <p>When the dealer`s face-up card is an ace, any of the players may make a side bet of up to half the original bet that the dealer`s face-down card is a ten-card, and thus a blackjack for the house. Once all such side bets are placed, the dealer looks at the hole card. If it is a ten-card, it is turned up, and those players who have made the insurance bet win and are paid double the amount of their half-bet - a 2 to 1 payoff. When a blackjack occurs for the dealer, of course, the hand is over, and the players` main bets are collected - unless a player also has blackjack, in which case it is a stand-off. Insurance is invariably not a good proposition for the player, unless they are quite sure that there are an unusually high number of ten-cards still left undealt.</p>\r\n\r\n  <p> </p>\r\n  <h2><strong>Settlement<br/></strong></h2>\r\n  <p>A bet once paid and collected is never returned. Thus, one key advantage to the dealer is that the player goes first. If the player goes bust, they have already lost their wager, even if the dealer goes bust as well. If the dealer goes over 21, the dealer pays each player who has stood the amount of that player`s bet. If the dealer stands at 21 or less, the dealer pays the bet of any player having a higher total (not exceeding 21) and collects the bet of any player having a lower total. If there is a stand-off (a player having the same total as the dealer), no chips are paid out or collected.</p>\r\n\r\n  <p> </p>\r\n  <h2><strong>Reshuffling<br/></strong></h2>\r\n  <p>When each player`s bet is settled, the dealer gathers in that player`s cards and places them face up at the side against a clear plastic L-shaped shield. The dealer continues to deal from the shoe until coming to the plastic insert card, which indicates that it is time to reshuffle. Once that round of play is over, the dealer shuffles all the cards, prepares them for the cut, places the cards in the shoe, and the game continues.</p>\r\n\r\n\r\n  <p> </p>\r\n  <h2><strong>Basic Strategy<br/></strong></h2>\r\n  <p>Winning tactics in Blackjack require that the player play each hand in the optimum way, and such strategy always takes into account what the dealer`s upcard is. When the dealer`s upcard is a good one, a 7, 8, 9, 10-card, or ace for example, the player should not stop drawing until a total of 17 or more is reached. When the dealer`s upcard is a poor one, 4, 5, or 6, the player should stop drawing as soon as he gets a total of 12 or higher. The strategy here is never to take a card if there is any chance of going bust. The desire with this poor holding is to let the dealer hit and hopefully go over 21. Finally, when the dealer`s up card is a fair one, 2 or 3, the player should stop with a total of 13 or higher.</p>\r\n  <p>With a soft hand, the general strategy is to keep hitting until a total of at least 18 is reached. Thus, with an ace and a six (7 or 17), the player would not stop at 17, but would hit.</p>\r\n  <p>The basic strategy for doubling down is as follows: With a total of 11, the player should always double down. With a total of 10, he should double down unless the dealer shows a ten-card or an ace. With a total of 9, the player should double down only if the dealer`s card is fair or poor (2 through 6).</p>\r\n  <p>For splitting, the player should always split a pair of aces or 8s; identical ten-cards should not be split, and neither should a pair of 5s, since two 5s are a total of 10, which can be used more effectively in doubling down. A pair of 4s should not be split either, as a total of 8 is a good number to draw to. Generally, 2s, 3s, or 7s can be split unless the dealer has an 8, 9, ten-card, or ace. Finally, 6s should not be split unless the dealer`s card is poor (2 through 6).</p>\r\n</body>\r\n</html>"
    
    var body: some View {
        SwiftUiWebView(html_string_request: $html_String)
    }
}



//Display html string in swiftui
struct WebViewe: UIViewRepresentable {
    
    @Binding var html_string_request: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(html_string_request, baseURL: nil)
        //self.uiView.navigationDelegate = self   //Bundle.main.resourceURL
        //uiView.uiDelegate = self
        
    }
    
}

struct Web_view_description_Previews: PreviewProvider {
    static var previews: some View {
        Web_view_description()
    }
}

struct SwiftUiWebView: UIViewRepresentable {
    @Binding var html_string_request: String

    class Coordinator: NSObject, WKNavigationDelegate {
        let parent: SwiftUiWebView
        
        init(_ parent: SwiftUiWebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print("Done loading")
        }
    }
    
    func makeCoordinator() -> SwiftUiWebView.Coordinator {
        Coordinator(self)
    }
    
    //let url: URL?
    
    func makeUIView(context: Context) -> WKWebView {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        return WKWebView(frame: .zero, configuration: config)
        
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.navigationDelegate = context.coordinator // <- This sets the delegate
        uiView.loadHTMLString(html_string_request, baseURL: Bundle.main.resourceURL)

    }
}


//Display a website in swiftui
struct WebViewe1: UIViewRepresentable {
    typealias UIViewType = WKWebView

    var url_to_display: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: url_to_display))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {

    }
  //calling WebViewe1(url_to_display: URL(string: "https:developer.apple.com")!)
}
