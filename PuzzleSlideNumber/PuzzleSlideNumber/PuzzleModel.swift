//
//  PuzzleModel.swift
//  SlideNumberPuzzle
//
//  Created by Siriluk Rachaniyom on 27/3/2564 BE.
//

import Foundation

public var counter = 0
public var move = 0
public var status = false
struct PuzzleModel<CardContent: Equatable> {
 
    var cards: Array<Card>
    var shuftcard: Array<Card>
    var slovePuzzle: Array<Card>
    
    init(numOfPairsOfCard: Int, cardContentFactory: (Int) ->CardContent) {
        cards = []
        shuftcard = []
        slovePuzzle = []
        
        for pairIndex in 0..<numOfPairsOfCard{
            let content = cardContentFactory(pairIndex)
            shuftcard.append(Card(id: pairIndex*2, content: content))
        }
        cards = shuftcard.shuffled()
        shuftcard = cards
        
        for pairIndex in 0..<numOfPairsOfCard{
            let content = cardContentFactory(pairIndex)
            slovePuzzle.append(Card(id: pairIndex*2, content: content))
        }
        
    }
    
    var blankCard: Card{
        Card(id: 33, content: "0" as! CardContent)
    }
    
    
    func endgame() -> Bool{
        var point = 0
        for i in 0..<16 {
            
            if shuftcard[i].content == slovePuzzle[i].content {
                point = point + 1
            }
        }
        if point == 16 {
            return true
        }
        return false
    }
    
    mutating func choose(card: Card){
        var temp: Card
        var temp2: Card
        if let chosenIndex = cards.firstIndex(matching: card){
            if chosenIndex != 15 && cards[chosenIndex+1].content == blankCard.content {
                temp = cards[chosenIndex]
                cards[chosenIndex] = blankCard
                cards[chosenIndex+1] = temp
                temp2 = shuftcard[chosenIndex]
                shuftcard[chosenIndex] = shuftcard[chosenIndex+1]
                shuftcard[chosenIndex+1] = temp2
                move += 1
                if endgame() {
                    status = true
                }
                
            }
            if chosenIndex != 0 && cards[chosenIndex-1].content == blankCard.content {
                temp = cards[chosenIndex]
                cards[chosenIndex] = blankCard
                cards[chosenIndex-1] = temp
                temp2 = shuftcard[chosenIndex]
                shuftcard[chosenIndex] = shuftcard[chosenIndex-1]
                shuftcard[chosenIndex-1] = temp2
                move += 1
                if endgame() {
                    status = true
                }
                
            }
            if chosenIndex != 0 && chosenIndex != 1 && chosenIndex != 2 && chosenIndex != 3
            && cards[chosenIndex-4].content == blankCard.content {
                temp = cards[chosenIndex]
                cards[chosenIndex] = blankCard
                cards[chosenIndex-4] = temp
                temp2 = shuftcard[chosenIndex]
                shuftcard[chosenIndex] = shuftcard[chosenIndex-4]
                shuftcard[chosenIndex-4] = temp2
                move += 1
                if endgame() {
                    status = true
                }
            }
            if chosenIndex != 12 && chosenIndex != 13 && chosenIndex != 14 && chosenIndex != 15
            && cards[chosenIndex+4].content == blankCard.content {
                temp = cards[chosenIndex]
                cards[chosenIndex] = blankCard
                cards[chosenIndex+4] = temp
                temp2 = shuftcard[chosenIndex]
                shuftcard[chosenIndex] = shuftcard[chosenIndex+4]
                shuftcard[chosenIndex+4] = temp2
                move += 1
                if endgame() {
                    status = true
                }
                
            }
        }
        
    }
    

    struct Card: Identifiable {
        var id: Int
        var isFaceUp = false
        var content: CardContent
        
    }
}



