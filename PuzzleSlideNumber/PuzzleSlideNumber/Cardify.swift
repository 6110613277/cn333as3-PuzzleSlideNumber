//
//  Cardify.swift
//  Memorize
//
//  Created by Siriluk Rachaniyom on 5/3/2564 BE.
//

import SwiftUI

struct Cardify: AnimatableModifier { //ViewModifier คือเหมือนกับเรารับviewเข้ามาแล้วmodifyจากนั้นก็ส่งviewตัวใหม่ออกไป
    var rotation: Double
    var isFaceUp: Bool {//ไว้แทนค่าcardว่าหงาย/คว่ำ
        rotation < 90 //ถ้าหมุนเกิน 90 จะให้คว่ำ ถ้าน้อยกว่าให้หงาย
    }
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0:180 //ถ้าหงายจะให้เป็น0 ถ้าคว่ำให้เป็น180
    }
    var animatableData: Double{ //เป็นdataาำหรับทำanimation
        get {rotation}
        set {rotation = newValue}
    }
    
    func body(content: Content) -> some View{
        ZStack {
            Group {
                if true{
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.yellow)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    content
                }
            }
             
        }
        //.rotation3DEffect(Angle.degrees(rotation), axis:(0,1,0)) //เพื่อให้cardค่อยๆหงายขึ้นมา โดยให้หมุนรอบแกนy
        //.animation(Animation.linear(duration: 1)) //เนื่องจากเป็นการสร้างanimation แบบ expliciteจึงต้องใส่ animationหลัง affectที่กำหนด
    }
    // MARK: Drawing Constants
    
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 5.0
}

extension View {
    func cardify(isFaceUp: Bool) -> some View{
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}


