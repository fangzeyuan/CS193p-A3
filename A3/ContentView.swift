//
//  ContentView.swift
//  A3
//
//  Created by 房泽远 on 2022/7/28.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var game: SetGameView
    var body: some View {
    
    //    VStack{
                //ScrollView{
                AspectVGrid(items: game.cards, aspectRatio: 2/3) {
                    card in CardView(card:card)
                            .aspectRatio(2/3,contentMode: .fit)
              //              .onTapGesture{
              //                  game.choose(card)
              //              }
                
            }
            // .foregroundColor(viewModel.color)
            //.foregroundColor(.red)
        
        //.padding(.horizontal)
          //  Spacer()
           // Button( "New Game",action: viewModel.newGame)
        
    }
}
    
    struct CardView: View{
        let card: SetGame<String>.Card
        
        var body: some View{
            ZStack{
                let shape = RoundedRectangle(cornerRadius: 20)
                if card.isFaceUp{
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 3)
                
                        VStack{
                                ForEach(0..<card.content.number){_ in
                                switch(card.content.shape){
                                    case "oval":
                                   
                                    Oval().stroke(color: card.content.color).aspectRatio( contentMode: .fit)
                                case "squiggle":
                                        SquiggleShape().stroke(color: card.content.color).aspectRatio( contentMode: .fit)
                                   
                                    
                                case "diamond":
                                  
                                        Diamond().stroke(color: card.content.color).aspectRatio( contentMode: .fit)
                                    
                                default :
                                    Text(card.content.shape).font(.largeTitle)
                                }
                            }
                    //        Spacer()
                        }.padding(.horizontal)
                
                         
             
                   
                    
                }
                else if card.isMatched{
                    shape.opacity(0)
                }
                else{
                    shape.fill()
                
                }
            }
        }
}


struct ContentView_Previews: PreviewProvider {
    

    static var previews: some View {
        let game = SetGameView()
        ContentView(game: game)
    }
}
