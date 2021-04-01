//
//  EmojiGameView.swift
//  Memorize
//
//  Created by Siriluk Rachaniyom on 12/2/2564 BE.
//

import SwiftUI

struct PuzzleView: View {
    @ObservedObject var viewModel : PuzzleViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 170){
            Button(action: { //ปุ่มrestrat game
                withAnimation(Animation.easeInOut(duration: 1)){self.viewModel.restartGame()} //เป็นการใส่animationเพื่อที่เวลากดปุ่ม card จะมีการสลับแบบanimation ที่during=2เพื่อให้เคลื่อนไหวช้าลง ซึ่งเป็นการสร้างanimeแบบexplicite
                move = 0
            }, label: {
                Text("New Games")
                     .fontWeight(.bold)
                     .font(.largeTitle)
                     .padding()
                     .background(Color.green)
                     .cornerRadius(40)
                     .foregroundColor(.white)
                
            })
        }
        Grid(viewModel.card) { card in
            Cardview(card: card).onTapGesture {
                withAnimation(.linear(duration: 0.25)) {
                    viewModel.choose(card: card)
                }
            }
            .padding(5)
            
            
        }
        .foregroundColor(.orange)
        .padding()
        
        
        if status {
            VStack{
                Image.init("winner")
                Text("The Winner!")
                    .fontWeight(.bold)
                    .font(.system(size: 50))
                    .padding()
                    .foregroundColor(.red)
            }
        }
        
        Text("Moves: \(move)")
             .fontWeight(.bold)
             .font(.largeTitle)
             .padding()
             .foregroundColor(.blue)
    }
}

struct Cardview: View {
    var card: PuzzleModel<String>.Card
    var body: some View {
        GeometryReader{ geometry in
            if card.content == "0" {}
            else {
                Text(card.content)
                    .font(Font.system(size: fontSize(for: geometry.size)))
                    .foregroundColor(.white)
                    .cardify(isFaceUp: card.isFaceUp)//ไว้เรียก cardify โดยใส่ค่าของcardว่าหงาย/คว่ำอยู่
            }
        }
        .aspectRatio(CGSize(width: 4, height: 4), contentMode: .fit)
    }
    
    // MARK: Drawing Constants
    
    private let frontScaleFactor: CGFloat = 0.75
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3.0
    
    private func fontSize(for size: CGSize) -> CGFloat{
        min(size.width, size.height)*0.75
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PuzzleView(viewModel: PuzzleViewModel())
    }
}
