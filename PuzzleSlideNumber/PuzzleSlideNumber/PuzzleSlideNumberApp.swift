//
//  PuzzleSlideNumberApp.swift
//  PuzzleSlideNumber
//
//  Created by Siriluk Rachaniyom on 1/4/2564 BE.
//

import SwiftUI

@main
struct PuzzleSlideNumberApp: App {
    var body: some Scene {
        WindowGroup {
            PuzzleView(viewModel: PuzzleViewModel())
        }
    }
}
