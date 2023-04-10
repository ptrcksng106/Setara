//
//  SetaraaaaaApp.swift
//  Setaraaaaa
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 31/03/23.
//

import SwiftUI

@main
struct SetaraaaaaApp: App {
    @AppStorage("isOnboarding") var isOnboarding = true
    
    var body: some Scene {
        WindowGroup {
//           ViewDuaView()
//            SpendingView()
//            TablePlateView()
//             HomeView()
//            ItemView()
            if isOnboarding {
                ViewDuaView()
            } else {
                HomeView()
            }
            
//            ItemView()
        }
    }
}
