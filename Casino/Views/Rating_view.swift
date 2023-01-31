//
//  Rating_view.swift
//  Casino
//
//  Created by Muhammad Farid Ullah on 28/06/2022.
//

import SwiftUI
struct Rating_view: View{
    @Binding var rating: Int
    var lebel = ""
    var max_rating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    
    var body: some View{
        //Text("HJeee")
        HStack {
            Text("")
            if lebel.isEmpty == false {
                Text("lebel")
            }
            
            ForEach(1..<max_rating + 1, id: \.self) { number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
    
    func image(for number: Int) -> Image{
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

struct Rating_view_Previews: PreviewProvider {
    static var previews: some View {
        Rating_view(rating: .constant(3))
    }
}
