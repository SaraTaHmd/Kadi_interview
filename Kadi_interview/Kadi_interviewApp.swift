//
//  Kadi_interviewApp.swift
//  Kadi_interview
//
//  Created by sara alhammad on 07/11/2023.
//

import SwiftUI

@main
struct Kadi_interviewApp: App {
    let VM = ViewModel()
    var body: some Scene {
        WindowGroup {
            ListView(VM: VM)
                .environment(\.layoutDirection,LayoutDirection.leftToRight)
        }
    }
}
