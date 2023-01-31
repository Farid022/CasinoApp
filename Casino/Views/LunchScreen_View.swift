//
//  LunchScreen_View.swift
//  Casino
//
//  Created by Muhammad Farid Ullah on 13/07/2022.
//

import SwiftUI
import Combine
import Foundation
import Network

struct LunchScreen_vieww: View{
    @ObservedObject var vm = NetworkMonitor()
    @State private var isLoading = false
     
    var body: some View {
        ZStack {
            if vm.isConnected {
                HomeView()
            }else{
                ZStack{
                        Image("lunchScreen")
                        .resizable()
                        //.scaledToFill()
                        .ignoresSafeArea()
                    
                    VStack{
                        Text("No Internet Connection")
                            .foregroundColor(.white)
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Button {
                            //vm.check_InternetConnection()
                            vm.isConnected = true
                        } label: {
                            Text("Try Again")
                                .foregroundColor(.white)
                                .font(.title)
                                .fontWeight(.bold)
                                //.padding(.top, 60)
                        }
                        .padding(.top)
                        Spacer()
                    }
                    .padding()
                    .padding()
                    .padding(.top)
                    .padding()
                    
                }
                
            }
            
            if isLoading {
                ZStack{
                    Image("lunchScreen")
                        .resizable()
                        .scaledToFill()
                    
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .black))
                        .scaleEffect(2)
                        .padding(.trailing, 50)
//                        //.padding(.top, 48)
                    
                }
                .ignoresSafeArea()
            }
            
        }
        .onAppear{
            stateFakeNetworkCall()
        }
        .alert(isPresented: $vm.showAlertSheet2) {
                Alert(title: Text("Not Connected"), message: Text("Please check your internet connection1"),
                      dismissButton: .default(Text("OK"), action: {
                    isLoading = false
                    print("isloading \(isLoading)")
                }))
        }
    }
    
    func stateFakeNetworkCall(){
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            isLoading = false
            if !vm.isConnected {
                vm.showAlertSheet2 = true
                isLoading = false
            }
        }
    }
}

struct LunchScreen_vieww_Previews: PreviewProvider {
    static var previews: some View {
        LunchScreen_vieww()
    }
}
