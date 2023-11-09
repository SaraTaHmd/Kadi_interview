//
//  Extentions.swift
//  Kadi_interview
//
//  Created by sara alhammad on 08/11/2023.
//

import Foundation
import SwiftUI

extension Alert {
    static func show(title: String = "error", message: String, dismissTitle: String = "ok") -> Alert {
        Alert(title: Text(title), message: Text(message), dismissButton:
                .default(Text(dismissTitle)))
    }
    
}

extension View {
    //If Statment
    @ViewBuilder func `if`<T: View>(_ condition: Bool, transform: (Self) -> T) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
    

    //Hide view
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    

}
