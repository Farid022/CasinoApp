////
////  See_more_view.swift
////  Casino
////
////  Created by Muhammad Farid Ullah on 28/06/2022.
////
//
//import SwiftUI
//
//struct See_moreView: View {
//    var colums = [GridItem(.adaptive(minimum: 160), spacing: 10)]
//    @Environment(\.presentationMode) var presentationMoood
//    @StateObject var vm = Country_View_Model()
//
//
//    var body: some View {
//        ZStack {
//            VStack(spacing: 0.0) {
//
//                Color.black
//                    .ignoresSafeArea()
//                    .frame(height: 40)
//
//                    .overlay(
//                        HStack {
//
//                            Button(action: {
//                                presentationMoood.wrappedValue.dismiss()
//                            }) {
//                                    Image(systemName: "arrow.backward")
//                                    .foregroundColor(.white)
//                                    .padding(.leading)
//                            }
//                            .frame(height: 44)
//
//
//                        Spacer()
//
//                        Text("Casino")
//                            .foregroundColor(.white)
//                            .font(.system(size: 20))
//                            .fontWeight(.bold)
//                            .padding(.leading,30)
//
//                            Spacer()
//
//                            Button(action: {
//                                //
//                            }) {
//                                    Image(systemName: "magnifyingglass")
//                                    .foregroundColor(.white)
//                                    //.padding(.leading)
//                            }
//
//                            Button(action: {
//                                //
//                            }) {
//                                    Image(systemName: "play.fill")
//                                    .foregroundColor(.white)
//                                    //.padding(.leading)
//                            }
//                            .padding(.all,10)
//
//
//
//
//                        //Spacer()
//                    }, alignment: .bottom)
//
//                ScrollView {
//
//                    Text("List of more countries!")
//                        .font(.title2)
//
//                    LazyVGrid(columns: colums, spacing: 8){
//                        ForEach(vm.countries) { contry in
//                            NavigationLink {
//                                See_moreView()
//                            } label: {
//                                //Country_view_card(country_details: contry)
//                            }
//
//                        }
//                        //.cornerRadius(8)
//                    }
//                    .padding(.leading, 8)
//                    .padding(.trailing, 8)
//                }
//
//            }.navigationBarHidden(true)
//            .navigationBarBackButtonHidden(true)
//
//        }
//    }
//}
//
//
//struct See_more_view_Previews: PreviewProvider {
//    static var previews: some View {
//        See_moreView()
//    }
//}
