//
//  Client.swift
//  Kadi_interview
//
//  Created by sara alhammad on 09/11/2023.
//

import Foundation


final class NetworkClient {
    
    func fetch(callback: @escaping (Result<[Posts], Error>) -> ()){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts")else{return}
        let task = URLSession.shared.dataTask(with: url){[weak self] data,_,error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let posts = try JSONDecoder().decode([Posts].self, from: data)
                DispatchQueue.main.async{
                    callback(.success(posts))
                }
                print("fetch result \(posts)")
            }catch{
                callback(.failure(error))
                print(error)
            }
            
        }
        task.resume()
    }

}
