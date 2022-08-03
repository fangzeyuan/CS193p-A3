//
//  SetGame.swift
//  A3
//
//  Created by 房泽远 on 2022/7/30.
//

// This is a model.

import Foundation

struct SetGame<CardContent> where CardContent: Equatable{
    
    // private set 使得外部可以看到 但是不能touch

    private (set) var cards: Array<Card>
    
    private(set) var score = 0
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    private let color_list = ["red", "green", "purple"]
    private let number_list = [1,2,3]
    private let shading_list = ["solid", "striped", "open"]
    private let shape_list = ["diamond","squiggle","oval"]
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}), !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
           // 如果目前 有且只有一张朝上的卡
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                // 成功匹配
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                cards[chosenIndex].isMatched = true
                cards[potentialMatchIndex].isMatched = true
                score  += 2
                }else{
                //如股没有成功匹配 检查卡片是否被看到过
                    if cards[chosenIndex].isSeen {score -= 1}
                    if cards[potentialMatchIndex].isSeen {score -= 1}
                    cards[chosenIndex].isSeen = true
                    cards[potentialMatchIndex].isSeen = true
                }
            indexOfTheOneAndOnlyFaceUpCard = nil
        }
            // 其他情况 不止一张卡 或者没有卡 朝上
            else{
            
            // 选一张卡
            for index in cards.indices{
                cards[index].isFaceUp = false
            }
            indexOfTheOneAndOnlyFaceUpCard = chosenIndex
        }
            cards[chosenIndex].isFaceUp.toggle()

        }
            print("\(cards) ")
    }
 
    
    init(numberofPairsOfcards: Int, createCardContent:(Int)-> CardContent){
        cards = Array<Card>()
        //add numberofPairsofCard x 2 cards to cards array
        // 四个变量中 随机选择一个不一样的的变量
        // 剩下三个变量是一样的
        for pairIndex in 0..<numberofPairsOfcards{
        
            let setContent = SetContent()
            
            let content1: MyCardContent = MyCardContent(set: setContent, order : 0)
            let content2: MyCardContent = MyCardContent(set: setContent, order : 1)
            let content3: MyCardContent = MyCardContent(set: setContent, order: 2)
            cards.append(Card(content: content1,id :pairIndex*3))
            cards.append(Card(content: content2,id :pairIndex*3+1))
            cards.append(Card(content: content3,id :pairIndex*3+2))
        }
        //  打乱顺序
       // cards = cards.shuffled()
        print("\(cards)")
    }
    
    struct Card: Identifiable{

        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: MyCardContent
        var id :Int
        var isSeen:Bool = false
    }
    
    
    struct MyCardContent: Equatable{
    

    init(set: SetContent, order: Int){
        color = set.color_list[order]
        number = set.number_list[order]
        shape = set.shape_list[order]
        shading = set.shading_list[order]
    }
    
    var color: String
    var number: Int
    var shape: String
    var shading: String
    
}
    
    // Abandoned
    func index(of card: Card) ->Int?{
        for index in 0..<cards.count{
            if cards[index].id == card.id{
                return index
            }
        }
        return nil
    }
}
