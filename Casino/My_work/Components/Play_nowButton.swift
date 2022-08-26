//
//  Play_nowButton.swift
//  Casino
//
//  Created by Muhammad Farid Ullah on 19/07/2022.
//

import SwiftUI

struct Play_nowButton: View {
    
    var body: some View {
            Text("PLAY NOW")
            .font(.system(size: 15))
                .bold()
                .foregroundColor(.red)
                .padding(.all, 6)
                .padding(.horizontal,8)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                    //Capsule()
                        .stroke(Color.red, lineWidth: 1.0))
    }
}

struct Play_nowButton_Previews: PreviewProvider {
    static var previews: some View {
        Play_nowButton()
    }
}
