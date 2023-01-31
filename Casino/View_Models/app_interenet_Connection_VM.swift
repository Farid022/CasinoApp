//
//  app_interenet_Connection_VM.swift
//  Casino
//
//  Created by Muhammad Farid Ullah on 14/08/2022.
//

import SwiftUI
import Combine
import Foundation
import Network

final class NetworkMonitor: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Monitor")
    @Published var showAlertSheet2 = false
     
    @Published var isConnected = false
     
    init() {
        check_InternetConnection()
    }
    
    func check_InternetConnection(){
        monitor.pathUpdateHandler =  { [weak self] path in
            DispatchQueue.main.async {
                self?.isConnected = path.status == .satisfied ? true : false
            }
        }
        monitor.start(queue: queue)
        if self.isConnected {
            self.showAlertSheet2 = true
            print("State is \(self.showAlertSheet2)")
        }
    }
}

