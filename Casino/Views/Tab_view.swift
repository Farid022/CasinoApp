//
//  Tab_view.swift
//  Casino
//
//  Created by Muhammad Farid Ullah on 28/06/2022.
//

import SwiftUI
struct Tab_view: View {
    
//    @State var selectedTab: Int = 0  // if we need this var in secondry tab then we must have to bind it with the 2nd one
    
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    
    @State var count: Int = 0
    @State var finishText: String? = nil
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()


            // TabView {
            //                 ForEach(promo_images, id: \.self) { image in
            //                     Image(image)
            //                         .resizable()
            //                         .scaledToFill()
            //                 }
            //             }
            //             .frame(height: 190)
            //             .clipShape(RoundedRectangle(cornerRadius: 10))
            //             .tabViewStyle(.page)
            //             .padding(.horizontal)
            //             .shadow(radius: 6)
            //             .onReceive(timer) { _ in
            //                 withAnimation(.default){
            //                     count = count == 5 ? 1 : count + 1
            //                 }
            //             }
                            


            
            //VStack {
            TabView(selection: $count) {
                
                Image("australia_flag")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 215)
                   // .scaledToFill()
                    .tag(1)
                
                Image("brazil_flag")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 215)
                    .tag(2)
                
                Image("germany_flag")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 215)
                    .tag(3)
                
                Image("italy_flag")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 215)
                    .tag(4)
                
                    
                }
                .tabViewStyle(PageTabViewStyle())
                .onReceive(timer) { _ in
                    withAnimation(.default){
                        count = count == 5 ? 1 : count + 1
                    }
                }
        }
    }
}


// TabView {
//                             ForEach(promo_images, id: \.self) { image in
//                                 Image(image)
//                                     .resizable()
//                                     .scaledToFill()
//                             }
//                         }
//                         .frame(height: 190)
//                         .clipShape(RoundedRectangle(cornerRadius: 10))
//                         .tabViewStyle(.page)
//                         .padding(.horizontal)
//                         .shadow(radius: 6)
//                         .onReceive(timer) { _ in
//                             withAnimation(.default){
//                                 count = count == 5 ? 1 : count + 1
//                             }
//                         }
                            

struct Tab_view_examp_Previews: PreviewProvider {
    static var previews: some View {
        Tab_view()
            .previewInterfaceOrientation(.portrait)
    }
}

