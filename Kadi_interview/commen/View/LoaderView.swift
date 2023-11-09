//
//  LoaderView.swift
//  Kadi_interview
//
//  Created by sara alhammad on 08/11/2023.
//

import JGProgressHUD
import UIKit
import SwiftUI

struct LoaderView: View {
    var scaleSize: CGFloat = 3.0
    
    var body: some View {
        ZStack{
            ProgressView()
                .scaleEffect(scaleSize, anchor: .center)
                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
        }
        
    }
}
