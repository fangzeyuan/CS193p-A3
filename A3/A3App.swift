//
//  A3App.swift
//  A3
//
//  Created by 房泽远 on 2022/7/28.
//

import SwiftUI

@main
struct A3App: App {

    let game = SetGameView()
    var body: some Scene {
        WindowGroup {
            ContentView(game: game)
        }
    }
}
