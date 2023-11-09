//
//  FormView.swift
//  Kadi_interview
//
//  Created by sara alhammad on 08/11/2023.
//

import SwiftUI

struct FormView: View {
    @StateObject var VM: ViewModel
    @FocusState var isInputActive: Bool
    var body: some View {
        VStack {
            Spacer().frame(height: 50)
            HStack{
                Text("Post")
                Spacer()
            }
            .font(.largeTitle)
            .padding()
            
            VStack {
                TextFieldView(text: $VM.title, errorMessage: $VM.titleErrorMsg, title: "Title",isRequired: true)
                .padding(.vertical, 20)
                
                
                TextFieldView(text: $VM.body, errorMessage: $VM.bodyErrorMsg, title: "Body",isRequired: true)
                .padding(.vertical, 20)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(15)

            Spacer()
        }
        
        .padding()
        .background(Color.gray.opacity(0.1))
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(VM.isEdit ? "Edit Post" : "Create New Post")
        .navigationBarItems(trailing: Button(action: {
            if VM.isEdit{
                VM.editPosts()
            }else{
                VM.addPosts()
            }
        }, label: {
            HStack{
                Text("Save")
            }}))
        
        .focused($isInputActive)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                VStack {
                    Spacer()
                    Button("done") {
                            isInputActive = false
                    }
                }
            }
        }

    }
}

#Preview {
    FormView(VM: ViewModel())
}
