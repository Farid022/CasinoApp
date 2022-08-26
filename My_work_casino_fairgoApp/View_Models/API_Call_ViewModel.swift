//
//  API_Call_ViewModel.swift
//  Casino
//
//  Created by Muhammad Farid Ullah on 14/08/2022.
//

import SwiftUI
import Combine
import Foundation
//News API VM
class News_Post_VM: ObservableObject {
    
    var cancallables = Set<AnyCancellable>()
    @Published var news_post_array: NewsAPI_Model_Base?
    
    init(){
        requestPost()
    }
    
    private func requestPost(){
        /*OverView on Combine
         Customize handling of asyncronous events by combining event-processing operators
         1. Publisher: Deliver a sequence of values over time, we create publisher and then subrcriber to it, so that when it publishes any data, and we can notify of the data.
         2. Subscriber: It acts on the elements as it recieves them.
         */
        
        //Real world example: if you want to sign up for monthly package to be delivered to your house.
        /*
         1. sing up for the monthly subsrciption to be delivered to you.
         2. shift the package to the client.
         3. recieve the package at your font door.
         4. check the box, to make sure it is not demaged.
         5. open the box and make sure it match what you asked for.
         6. use the item!!!!
         7. the entire process can be cancelled at any time.
         */
        //Explaination
        /*
         1. create the publisher.
         2. subscribe the publisher on background thread.
         3. recieve the task on main thread.
         4. tryMap (check the data is good).
         5. decode (decode the data into postModel).
         6. sink (put the item on the View/app)
         */
        postmanFuturePublisher(baseUrl: "https://casinoapp.casinonativeweb.xyz/api/news_info.php", parameters: [URLQueryItem(name: "pcgName", value: "com.snai.milan.italy.easy.win.scommesse.apps")])
            .map { $0 } // ?
            .decode(type: NewsAPI_Model_Base.self, decoder: JSONDecoder()) //Decoding the data
            .receive(on: DispatchQueue.main) //we need to do it on main thread,to avoid background thread
            .sink { completion in
            print("Completion: \(completion)") //to throw an error message and unsucessful, if it fails.
            switch completion {
                case .finished:
                    print("finished")
                case .failure(let error):
                    print(error)     // in real app, we'd show an alert
                }
            } receiveValue: {[unowned self] model in
                self.news_post_array = model   //receive the value and store in the postModel
               // print("The Data is: \(postmanModel) ")
            }.store(in: &cancallables)
    }
    
    func postmanEscaping(baseUrl:String,parameters:[URLQueryItem],completionHandler: @escaping (_ data:Data,_ error:Error?) -> Void){
        //https://casinoapp.casinonativeweb.xyz/api/category_info.php
        guard var baseUrl = URLComponents(string: baseUrl) else {return}
        baseUrl.queryItems = parameters
        let mainUrl = baseUrl.url!
        
       var request = URLRequest(url: mainUrl)
       request.httpMethod = "POST"
      
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //it takes us to the URL(request),when it comes back with the URL the {} will run.
        URLSession.shared.dataTask(with: request) { data, response, error in
            //check we have correct data.
            guard let data = data else {return}
            print(response.debugDescription)
            completionHandler(data,error) //if there is error, the data will be nil
        }.resume()
    }
   
    func postmanFuturePublisher(baseUrl:String,parameters:[URLQueryItem]) -> Future<Data,Error>{
       Future { promise in
           self.postmanEscaping(baseUrl: baseUrl, parameters: parameters) { data, error in
               if let error = error {
                   promise(.failure(error))
               }else {
                   promise(.success(data))
               }
           }
       }
   }
}

//Categories API VM
class Categories_Post_VM: ObservableObject{
    
    var cancallables = Set<AnyCancellable>()
    @Published var category_post_array: CategoryAPI_Model_Base?
    
    init(){
        requestPost()
    }
    
    private func requestPost(){
        postmanFuturePublisher(baseUrl: "https://casinoapp.casinonativeweb.xyz/api/category_info.php", parameters: [URLQueryItem(name: "pcgName", value: "com.snai.milan.italy.easy.win.scommesse.apps")])
            .map {$0} // ?
            .decode(type: CategoryAPI_Model_Base.self, decoder: JSONDecoder()) //Decoding the data
            .receive(on: DispatchQueue.main) //we need to do it on main thread,to avoid background thread
            .sink { completion in
            print("Completion: \(completion)") //to throw an error message and unsucessful, if it fails.
            switch completion {
                case .finished:
                    print("finished")
                case .failure(let error):
                    print(error)     // in real app, we'd show an alert
                }
            } receiveValue: {[unowned self] model in
                self.category_post_array = model   //receive the value and store in the postModel
            }.store(in: &cancallables)
    }
    
    func postmanEscaping(baseUrl:String,parameters:[URLQueryItem],completionHandler: @escaping (_ data:Data,_ error:Error?) -> Void){
        //https://casinoapp.casinonativeweb.xyz/api/category_info.php
        guard var baseUrl = URLComponents(string: baseUrl) else {return}
        baseUrl.queryItems = parameters
        let mainUrl = baseUrl.url!
        
       var request = URLRequest(url: mainUrl)
       request.httpMethod = "POST"
      
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //it takes us to the URL(request),when it comes back with the URL the {} will run.
        URLSession.shared.dataTask(with: request) { data, response, error in
            //check we have correct data.
            guard let data = data else {return}
            print(response.debugDescription)
            completionHandler(data,error) //if there is error, the data will be nil
        }.resume()
    }
   
    func postmanFuturePublisher(baseUrl:String,parameters:[URLQueryItem]) -> Future<Data,Error>{
       Future { promise in
           self.postmanEscaping(baseUrl: baseUrl, parameters: parameters) { data, error in
               if let error = error {
                   promise(.failure(error))
               }else {
                   promise(.success(data))
               }
           }
       }
   }
}

//Product API VM
class Product_Post_VM: ObservableObject{
    
    var cancallables = Set<AnyCancellable>()
    @Published var product_post_array: ProductAPI_Model_Base?
    
    init(){
        requestPost()
    }
    
    private func requestPost(){
        postmanFuturePublisher(baseUrl: "https://casinoapp.casinonativeweb.xyz/api/product_info.php?catId=1", parameters: [URLQueryItem(name: "pcgName", value: "com.snai.milan.italy.easy.win.scommesse.apps")])
            .map {$0} // ?
            .decode(type: ProductAPI_Model_Base.self, decoder: JSONDecoder()) //Decoding the data
            .receive(on: DispatchQueue.main) //we need to do it on main thread,to avoid background thread
            .sink { completion in
            print("Completion: \(completion)") //to throw an error message and unsucessful, if it fails.
            switch completion {
                case .finished:
                    print("finished")
                case .failure(let error):
                    print(error)     // in real app, we'd show an alert
                }
            } receiveValue: {[unowned self] model in
                self.product_post_array = model   //receive the value and store in the postModel
            }.store(in: &cancallables)
    }
    
    func postmanEscaping(baseUrl:String,parameters:[URLQueryItem],completionHandler: @escaping (_ data:Data,_ error:Error?) -> Void){
        //https://casinoapp.casinonativeweb.xyz/api/category_info.php
        guard var baseUrl = URLComponents(string: baseUrl) else {return}
        baseUrl.queryItems = parameters
        let mainUrl = baseUrl.url!
        
       var request = URLRequest(url: mainUrl)
       request.httpMethod = "POST"
      
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //it takes us to the URL(request),when it comes back with the URL the {} will run.
        URLSession.shared.dataTask(with: request) { data, response, error in
            //check we have correct data.
            guard let data = data else {return}
            print(response.debugDescription)
            completionHandler(data,error) //if there is error, the data will be nil
        }.resume()
    }
   
    func postmanFuturePublisher(baseUrl:String,parameters:[URLQueryItem]) -> Future<Data,Error>{
       Future { promise in
           self.postmanEscaping(baseUrl: baseUrl, parameters: parameters) { data, error in
               if let error = error {
                   promise(.failure(error))
               }else {
                   promise(.success(data))
               }
           }
       }
   }
}

//Category_BlackJack API VM
class Category_bonusAPI_Post_VM: ObservableObject{
    
    var cancallables = Set<AnyCancellable>()
    @Published var category_blackJack_array: Category_bonusAPI_model_Base?
    
    init(catID: String){
        requestPost(catID: catID)
    }
    
    private func requestPost(catID: String){
        postmanFuturePublisher(baseUrl: "https://casinoapp.casinonativeweb.xyz/api/product_cat_info.php", parameters: [URLQueryItem(
            name: "catId", value: catID)])
            .map {$0} // ?
            .decode(type: Category_bonusAPI_model_Base.self, decoder: JSONDecoder()) //Decoding the data
            .receive(on: DispatchQueue.main) //we need to do it on main thread,to avoid background thread
            .sink { completion in
            print("Completion: \(completion)") //to throw an error message and unsucessful, if it fails.
            switch completion {
                case .finished:
                    print("finished")
                case .failure(let error):
                    print(error)     // in real app, we'd show an alert
                }
            } receiveValue: {[unowned self] model in
                self.category_blackJack_array = model   //receive the value and store in the postModel
            }.store(in: &cancallables)
    }
    
    func postmanEscaping(baseUrl:String,parameters:[URLQueryItem],completionHandler: @escaping (_ data:Data,_ error:Error?) -> Void){
        //https://casinoapp.casinonativeweb.xyz/api/category_info.php
        guard var baseUrl = URLComponents(string: baseUrl) else {return}
        baseUrl.queryItems = parameters
        let mainUrl = baseUrl.url!
        
       var request = URLRequest(url: mainUrl)
       request.httpMethod = "POST"
      
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //it takes us to the URL(request),when it comes back with the URL the {} will run.
        URLSession.shared.dataTask(with: request) { data, response, error in
            //check we have correct data.
            guard let data = data else {return}
            print(response.debugDescription)
            completionHandler(data,error) //if there is error, the data will be nil
        }.resume()
    }
   
    func postmanFuturePublisher(baseUrl:String,parameters:[URLQueryItem]) -> Future<Data,Error>{
       Future { promise in
           self.postmanEscaping(baseUrl: baseUrl, parameters: parameters) { data, error in
               if let error = error {
                   promise(.failure(error))
               }else {
                   promise(.success(data))
               }
           }
       }
   }
}


//About us API VM
class AboutUs_API_Post_VM: ObservableObject{
    
    var cancallables = Set<AnyCancellable>()
    @Published var aboutUS_info_array: AboutusInfo_model_Base?
    
    init(){
        requestPost()
    }
    
    private func requestPost(){
        postmanFuturePublisher(baseUrl: "https://casinoapp.casinonativeweb.xyz/api/about_us_info.php", parameters: [URLQueryItem(
            name: "pcgName", value: "com.snai.milan.italy.easy.win.scommesse.apps")])
            .map {$0} // ?
            .decode(type: AboutusInfo_model_Base.self, decoder: JSONDecoder()) //Decoding the data
            .receive(on: DispatchQueue.main) //we need to do it on main thread,to avoid background thread
            .sink { completion in
            print("Completion: \(completion)") //to throw an error message and unsucessful, if it fails.
            switch completion {
                case .finished:
                    print("finished")
                case .failure(let error):
                    print(error)     // in real app, we'd show an alert
                }
            } receiveValue: {[unowned self] model in
                self.aboutUS_info_array = model   //receive the value and store in the postModel
            }.store(in: &cancallables)
    }
    
    func postmanEscaping(baseUrl:String,parameters:[URLQueryItem],completionHandler: @escaping (_ data:Data,_ error:Error?) -> Void){
        //https://casinoapp.casinonativeweb.xyz/api/category_info.php
        guard var baseUrl = URLComponents(string: baseUrl) else {return}
        baseUrl.queryItems = parameters
        let mainUrl = baseUrl.url!
        
       var request = URLRequest(url: mainUrl)
       request.httpMethod = "POST"
      
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //it takes us to the URL(request),when it comes back with the URL the {} will run.
        URLSession.shared.dataTask(with: request) { data, response, error in
            //check we have correct data.
            guard let data = data else {return}
            print(response.debugDescription)
            completionHandler(data,error) //if there is error, the data will be nil
        }.resume()
    }
   
    func postmanFuturePublisher(baseUrl:String,parameters:[URLQueryItem]) -> Future<Data,Error>{
       Future { promise in
           self.postmanEscaping(baseUrl: baseUrl, parameters: parameters) { data, error in
               if let error = error {
                   promise(.failure(error))
               }else {
                   promise(.success(data))
               }
           }
       }
   }
}

//Bonus info API VM
class BonusInfo_API_Post_VM: ObservableObject{
    
    var cancallables = Set<AnyCancellable>()
    @Published var bonus_info_array: BonusInfo_model_base?
    
    init(){
        requestPost()
    }

    private func requestPost(){
        postmanFuturePublisher(baseUrl: "https://casinoapp.casinonativeweb.xyz/api/bonus_info.php", parameters: [URLQueryItem(
            name: "pcgName", value: "com.snai.milan.italy.easy.win.scommesse.apps")])
            .map {$0} // ?
            .decode(type: BonusInfo_model_base.self, decoder: JSONDecoder()) //Decoding the data
            .receive(on: DispatchQueue.main) //we need to do it on main thread,to avoid background thread
            .sink { completion in
            print("Completion: \(completion)") //to throw an error message and unsucessful, if it fails.
            switch completion {
                case .finished:
                    print("finished")
                case .failure(let error):
                    print(error)     // in real app, we'd show an alert
                }
            } receiveValue: {[unowned self] model in
                self.bonus_info_array = model   //receive the value and store in the postModel
            }.store(in: &cancallables)
    }
    
    func postmanEscaping(baseUrl:String,parameters:[URLQueryItem],completionHandler: @escaping (_ data:Data,_ error:Error?) -> Void){
        //https://casinoapp.casinonativeweb.xyz/api/category_info.php
        guard var baseUrl = URLComponents(string: baseUrl) else {return}
        baseUrl.queryItems = parameters
        let mainUrl = baseUrl.url!
        
       var request = URLRequest(url: mainUrl)
       request.httpMethod = "POST"
      
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //it takes us to the URL(request),when it comes back with the URL the {} will run.
        URLSession.shared.dataTask(with: request) { data, response, error in
            //check we have correct data.
            guard let data = data else {return}
            print(response.debugDescription)
            completionHandler(data,error) //if there is error, the data will be nil
        }.resume()
    }
   
    func postmanFuturePublisher(baseUrl:String,parameters:[URLQueryItem]) -> Future<Data,Error>{
       Future { promise in
           self.postmanEscaping(baseUrl: baseUrl, parameters: parameters) { data, error in
               if let error = error {
                   promise(.failure(error))
               }else {
                   promise(.success(data))
               }
           }
       }
   }
}

