//
//  ContentView.swift
//  Kadi_interview
//
//  Created by sara alhammad on 07/11/2023.
//

import SwiftUI

struct ListView: View {
    @StateObject var VM: ViewModel
    init(VM: ViewModel = ViewModel()) {
        self._VM = StateObject(wrappedValue: VM)
        VM.getPosts()
    }
    
    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    ScrollView {
                        if VM.postsList.isEmpty && !VM.isLoading{
                            Text("No Posts available")
                                .foregroundColor(.gray)
                                .padding(.top,150)
                            .padding()

                        }else{
                           
                            VStack {
                                ForEach(VM.postsList.indices, id: \.self) { index in
                                    
                                    Button {
                                        VM.isEdit = true
                                        VM.selectedPost = VM.postsList[index]
                                        VM.showFormView.toggle()
                                    } label: {
                                        PostsRowView(VM: VM, index: index)
                                            .padding(.bottom,10)
                                    }.foregroundColor(.black)
                                       
                                }
                            }
                            .padding()
            
                        }

                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.1))
                    
                    .navigationDestination(isPresented: $VM.showFormView) {
                        FormView(VM: VM)
                           }
                }
                .navigationBarTitleDisplayMode(.large)
                .navigationTitle("Post list")
                .navigationBarItems(trailing: Button(action: {
                    VM.isEdit = false
                    VM.selectedPost = nil
                    VM.showFormView.toggle()
                }, label: {
                    HStack{
                        Image(systemName: "plus")
                    }}))
                .alert(isPresented: self.$VM.showAlert) { Alert.show(message: self.VM.errorMessage) }
            }
            LoaderView().hidden(!VM.isLoading)
        }
       
    }
}

#Preview {
    ListView()
}
