//
//  Terms_&_condition_View.swift
//  Casino
//
//  Created by Muhammad Farid Ullah on 20/07/2022.
//

import SwiftUI

struct Terms_condition_View: View {
    //@StateObject var vm = downloadDataWith_combineVM()
    @Environment(\.presentationMode) var presentationMoood
    @StateObject var aboutUS_vm = AboutUs_API_Post_VM()
    @ObservedObject var webViewModel = WebViewModel(url: "")
    @GestureState private var dragOffset = CGSize.zero
    
    @State var isLoading: Bool = false
    
    var body: some View {
            ZStack{
                Color.white
                    .ignoresSafeArea()
                VStack(spacing: 15) {
                    Color("NavBar_Color")
                        .ignoresSafeArea()
                        .frame(height: 40)
                        .overlay(
                            HStack {
                                Button {
                                    presentationMoood.wrappedValue.dismiss()
                                } label: {
                                    Image(systemName: "line.horizontal.3")
                                        .foregroundColor(Color.white)
                                        .padding(.leading)
                                }
                                
                                Spacer()
                                
                                Text("Terms and conditions")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                                    .padding(.trailing, 40)
                                
                                Spacer()
                                
                            }, alignment: .center)
                    
                    ScrollView{
                        ForEach(aboutUS_vm.aboutUS_info_array?.json4 ?? [], id: \.self) { item in
                            WebViewContainer(webViewModel: webViewModel, html_string_request: item.termsDecription ?? "", fontSize: 17)
                            .frame(height: 6000)
                        }
                    }
                }
                
            }.navigationBarHidden(true)
        .gesture(DragGesture().updating($dragOffset, body: { value, state, transaction in
            if(value.startLocation.x < 20 &&
                            value.translation.width > 100) {
                     self.presentationMoood.wrappedValue.dismiss()
                 }
        }))
    }
}

struct Terms_condition_View_Previews: PreviewProvider {
    static var previews: some View {
        Terms_condition_View()
    }
}
