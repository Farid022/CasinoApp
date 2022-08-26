//
//  Bonus_View.swift
//  Casino
//
//  Created by Muhammad Farid Ullah on 20/07/2022.
//

import SwiftUI

struct Bonus_View_sidMenu: View {
    @Environment(\.presentationMode) var presentationMoood
    @GestureState private var dragOffset = CGSize.zero
    @State var isLoading: Bool = false
    
    @State var textName: String = ""
    @State var textEmail: String = ""
    
    @AppStorage("appSorage_textName") var appSorage_textName: String?
    @AppStorage("appSorage_textEmail") var appSorage_textEmail: String?
    
    @ObservedObject var pass_email_vm = EmailValidation()

    var body: some View {
        
        if (appSorage_textName != nil) && (appSorage_textEmail != nil) {
            Login_Bonus_View(image_name: "sideMenu_pic")
        }
        else
        {
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
                                
                                Text("Bonus")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                                    .padding(.trailing, 40)
                                
                                Spacer()
                                
                            }, alignment: .center)
                    
                    //ScrollView{
                        Text("Enter your email to unlock fantastic bonuses!")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                        
                    
                        
                    Group{
                        TextField("Name", text: $pass_email_vm.pass)
                            .frame(height: 10)
                            .padding(.top)
                        
                        Rectangle()
                            .frame(height: 1.0, alignment: .bottom)
                            .foregroundColor(Color.black.opacity(0.2))
                            .overlay(
                                HStack{
                                    Spacer()
                                    Text(pass_email_vm.pass_errorMessage)
                                        .font(.subheadline)
                                        .foregroundColor(.red)
                                    //Spacer()
                                }, alignment: .top
                            )
                        
                        //.padding(.bottom, 40)
                        
                        TextField("Email", text: $pass_email_vm.email)
                            .frame(height: 10).padding(.top)
                        Rectangle()
                            .frame(height: 1.0, alignment: .bottom)
                            .foregroundColor(Color.black.opacity(0.2))
                            .overlay(
                                HStack{
                                    Spacer()
                                    Text(pass_email_vm.errorMessage)
                                        .font(.subheadline)
                                        .foregroundColor(.red)
                                    //Spacer()
                                }, alignment: .top
                            )
                        //.foregroundColor(pass_email_vm.email ? Color.black.opacity(0.2) : Color.green)

                                                
                        Button {
                            appSorage_textName = pass_email_vm.pass
                            appSorage_textEmail = pass_email_vm.email
                        } label: {
                            Text("SUBMIT")
                                .font(.system(size: 13))
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity)
                                .frame(height: 33)
                                .foregroundColor(.white)
                                .background(Color.orange)
                        }.padding(.top)
                    }
                    .padding(.leading)
                    .padding(.trailing)
                    Spacer()
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
    
    
        
}

struct Bonus_View_Previews: PreviewProvider {
    static var previews: some View {
        Bonus_View_sidMenu()
    }
}



struct GeomateryReader_examp: View {
    func getPercentage(geo: GeometryProxy) -> Double{
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistance))
    }
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: true) {
            HStack {
                ForEach(1..<10) { index in
                    GeometryReader { sizeOfGeomatry in
                        RoundedRectangle(cornerRadius: 15)
                            .rotation3DEffect(
                                Angle(degrees: getPercentage(geo: sizeOfGeomatry) * 30),
                                axis: (x: 0.0, y: 1.1, z: 0.0))
                            
                    }.frame(width: 300, height: 250)
                        .shadow(radius: 10)
                        .padding()
                }
            }
        }
        
//        GeometryReader { geomatey in
//            HStack(spacing: 0){
//                Rectangle()
//                    .fill(Color.green)
//                    //.frame(width: UIScreen.main.bounds.width * 0.666) //this will not work if you rotate your phone into landscap, so we geomateryReader where geomatery means size
//                    .frame(width: geomatey.size.width * 0.666)
//                Rectangle()
//                    .fill(Color.red)
//            }.ignoresSafeArea()
//
//        }
        
       
        
        
    }
}



