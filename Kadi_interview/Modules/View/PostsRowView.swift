//
//  PostsRowView.swift
//  Kadi_interview
//
//  Created by sara alhammad on 08/11/2023.
//

import SwiftUI

struct PostsRowView: View {
    @StateObject var VM: ViewModel
    var index : Int

    var body: some View {
        VStack {

            Text("\(VM.postsList[index].title)")
                .font(.system(size: 15))
                .padding(.bottom)
                .frame(maxWidth: .infinity)


            Text("\(VM.postsList[index].body)")
                .font(.system(size: 10))
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity)

                
        }

        .frame(maxWidth: .infinity)
        .padding(10)
        .background(.white)
        .cornerRadius(15)

    }
}

#Preview {
    PostsRowView(VM: ViewModel(), index: 0)
}
