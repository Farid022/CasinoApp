//
//  Password_Email_Validation_VM.swift
//  Casino
//
//  Created by Muhammad Farid Ullah on 21/07/2022.
//

//import Foundation
//
//class EmailValidation: ObservableObject{
//    @Published var errorMessage = ""
//    @Published var pass_errorMessage = ""
//    @Published var email = "" {
//        didSet{
//            if self.email.isEmpty {
//                self.errorMessage = "Required"
//            }else if !self.email.isValidEmail(){
//                self.errorMessage = "Invalid Email"
//            }else{
//                self.errorMessage = ""
//            }
//        }
//    }
//    
//    
//    @Published var pass = "" {
//        didSet {
//            self.isValidPassword()
//        }
//    }
//    
//    func isValidPassword(){
//        guard !self.pass.isEmpty else{
//            pass_errorMessage = "Required"
//            return
//        }
//        
//        let setPassError = self.pass.isPassword() == false
//        if setPassError{
//            if self.pass.count < 3 {
//                self.pass_errorMessage = "Name must be longer than 2 charachters"
//                return
//            }else{
//                self.pass_errorMessage = ""
//            }
//            
////            if !self.pass.isUpperCase(){
////                self.pass_errorMessage = "Must contains atleast one uppercase."
////            }
////            if !self.pass.isLowerCase(){
////                self.pass_errorMessage = "Must contains atleast one lowercase."
////            }
////            if !self.pass.containsCharacter(){
////                self.pass_errorMessage = "Must contains atleast one special character."
////            }
////            if !self.pass.containsDigits(){
////                self.pass_errorMessage = "Must contains atleast one digit."
////            }
//            
//            
//        }else{
//            self.pass_errorMessage = ""
//        }
//    }
//}
//
//extension String{
//    func isValidEmail() -> Bool {
//        
//        let emailRegEx = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" +
//            "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
//            "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" +
//            "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" +
//            "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
//            "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
//            "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
//        
//        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
//        return emailTest.evaluate(with: self)
//    }
//    
//    func isPassword() -> Bool{
//        
////        let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{6,}$"
////            return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
//        
//        let passwordRegex =
//            "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<]{3,}$"
//        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
//        return passwordPred.evaluate(with: self)
//    }
//    
////    func isUpperCase() -> Bool{
////        let uppercaseRegRegex = ".*[A-Z]+.*"
////        return NSPredicate (format: "SELF MATCHES %@", uppercaseRegRegex).evaluate(with:self)
////    }
////
////    func isLowerCase() -> Bool{
////        let lowercaseRegRegex = ".*[A-Z]+.*"
////        return NSPredicate (format: "SELF MATCHES %@", lowercaseRegRegex).evaluate(with:self)
////    }
////
////    func containsCharacter() -> Bool{
////        let characterRegRegex = ".*[!@#$%^&*()\\-_=+{}|?>.<]+.*"
////        return NSPredicate (format: "SELF MATCHES %@", characterRegRegex).evaluate(with: self)
////    }
////
////    func containsDigits() -> Bool{
////        let digitReqRegex = ".*[0-9]+.*"
////        return NSPredicate (format: "SELF MATCHES %@", digitReqRegex).evaluate(with:self)
////    }
//}
