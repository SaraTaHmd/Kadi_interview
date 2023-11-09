//
//  BaseModel.swift
//  Kadi_interview
//
//  Created by sara alhammad on 08/11/2023.
//

import Foundation

class BaseViewModel {
    @Published var showAlert: Bool = false
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""
    func showErrorMessage(message: String) {
        errorMessage = message
        showAlert = true
    }

}
