//
//  TextFieldView.swift
//  Kadi_interview
//
//  Created by sara alhammad on 08/11/2023.
//

import SwiftUI
import Combine

struct TextFieldView: View {
    @FocusState private var isFocused: Bool
    @Binding var text: String
    @Binding var errorMessage: String?
    var title: String
    var isNumber: Bool = false
    var isMultiline: Bool = true
    var numberOfLines: Int = 3
    var isRequired: Bool = false

    var borderColor: Color {
        if errorMessage != nil {
            return .red
        } else {
            return .gray.opacity(0.5)
        }
        return .clear
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            VStack{
                HStack(spacing: 0){
                    Text(title)
                        .foregroundColor(Color.gray)
                        .padding(.leading,15)
                    if isRequired{
                        Text("*")
                            .foregroundColor(.red).frame(alignment: .top)
                    }
                    Spacer()
                }

                TextField("", text: $text, axis: isMultiline ? .vertical : .horizontal)
                    .lineLimit(numberOfLines, reservesSpace: isMultiline)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 10)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(borderColor, lineWidth: 0.5)
                    )
                    .multilineTextAlignment(.leading)
                    .focused($isFocused)
                    .if(isNumber) { view in
                        view.onReceive(Just(text)) { newString in
                            let filtered = newString.filter { "0123456789".contains($0) }
                            if filtered != newString {
                                self.text = filtered
                            }
                        }
                        .keyboardType(.numberPad)
                    }
                
            }
            if errorMessage != nil {
                HStack{
                    Text("\(errorMessage!)").foregroundColor(.red)
                }
            }
        }
    }
    
}

struct TextFieldView_Previews: PreviewProvider {
    @State static var text = ""
    @State static var errorMessage: String? = "error"
    static var previews: some View {
        TextFieldView(text: $text, errorMessage: $errorMessage, title: "Title")
    }
}


func validateTextField(_ text: String?, validators: [TextFieldValidators]) -> String? {
    for validator in validators {
        switch validator {
        case .isRequired:
            if text == nil || text!.isEmpty {
                return validator.errorMessage
            }
        }
    }
    return nil
}

enum TextFieldValidators{
    case isRequired

    var errorMessage: String {
        switch self {
        case .isRequired:
            return "This field is mandatory"
        }
    }
}

