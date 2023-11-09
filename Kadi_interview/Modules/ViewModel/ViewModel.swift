//
//  ViewModel.swift
//  Kadi_interview
//
//  Created by sara alhammad on 08/11/2023.
//

import Foundation
class ViewModel: BaseViewModel, ObservableObject {
    @Published var postsList : [Posts] = []
    @Published var showFormView : Bool = false
    @Published var isEdit : Bool = false
    
    @Published var selectedPost : Posts? = nil{
        didSet {
            title = selectedPost?.title ?? ""
            body = selectedPost?.body ?? ""

            }
        }
    @Published var title: String = ""
    @Published var body: String = ""
    @Published var titleErrorMsg : String? = nil
    @Published var bodyErrorMsg : String? = nil
    
    
    let client: NetworkClient
    
    init(client: NetworkClient = NetworkClient()) {
        self.client = client
        super.init()
    }
    
    func getPosts(){
        self.isLoading = true
        client.fetch(){ result in
            switch result {
            case .success(let response):
                self.isLoading = false
                self.postsList = response
                
            case .failure(let error):
                self.isLoading = false
                self.showErrorMessage(message: error.localizedDescription)
            }
        }
    }
 
    func addPosts(){
        guard validateForm() else { return }
        if let last = postsList.last{
            let id = last.id + 1
            let userId = last.userId
            let post = Posts(userId: userId, id: id, title: title, body: body)
            postsList.append(post)
            showFormView = false
        }
        
    }
    
    func editPosts(){
        guard validateForm() else { return }
        if let selectedPost = selectedPost{
            if let index = postsList.firstIndex(where: {$0.id == selectedPost.id }) {
                postsList[index].title = title
                postsList[index].body = body
                showFormView = false
            }
        }
        
    }
    
    func validateForm ()-> Bool{
        var isValid = true
        if let error = validateTextField(title, validators: [.isRequired]) {
            titleErrorMsg = error
            isValid = false
        }else{
            titleErrorMsg = nil
        }
        if let error = validateTextField(body, validators: [.isRequired]) {
            bodyErrorMsg = error
            isValid = false
        }else{
            bodyErrorMsg = nil
        }
       
        return isValid
    }
    
}
