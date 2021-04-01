//
//  PuzzleViewModel.swift
//  SlideNumberPuzzle
//
//  Created by Siriluk Rachaniyom on 27/3/2564 BE.
//

import SwiftUI

public var numcard = 16
class PuzzleViewModel: ObservableObject{
    @Published private(set) var model: PuzzleModel<String> = createMemoryGame()
    
    var card: Array<PuzzleModel<String>.Card>{
        model.cards
    }
    
    func choose(card: PuzzleModel<String>.Card)  {
        model.choose(card: card)
    }

    
    private static func createMemoryGame() ->PuzzleModel<String>{
        let emoji = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","0"]
        
        numcard = 16
        return PuzzleModel<String>(numOfPairsOfCard: numcard){emoji[$0]}
        
    }
    func restartGame() {
        model = PuzzleViewModel.createMemoryGame()
    }
}
