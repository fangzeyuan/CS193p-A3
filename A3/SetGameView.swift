//
//  SetGameView.swift
//  A3
//
//  Created by 房泽远 on 2022/7/30.
//

import SwiftUI

class SetGameView: ObservableObject{
    
    static func createMemorygame(emojis: Array<String>, nCards: Int) -> SetGame<String>{
        SetGame<String>(numberofPairsOfcards: nCards) { pairIndex in
            emojis[pairIndex]
        }
    }
    static var emojis = ["1","2","3","4","5"]

//    private(set) var emojis: Array<String>
    @Published private(set) var model = SetGame<String>(numberofPairsOfcards: 5){
            pairIndex in emojis[pairIndex]
    }
    
//    init(){
//        theme = GameTheme(name: "Balls Normal")
//        emojis = theme.emojis
//        model = EmojiMemoryGame.createMemorygame(emojis: theme.emojis,nCards: theme.numberOfPairsOfCards)
//    }
   
    // Copy
    var cards : Array<SetGame<String>.Card>{
        return model.cards
    }
}


