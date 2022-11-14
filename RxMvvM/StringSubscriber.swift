//
//  StringSubscriber.swift
//  RxMvvM
//
//  Created by Delfin Hernandez Gomez on 11/11/22.
//

import Foundation
import Combine

class StringSubscriber: Subscriber {
        
    typealias Input = String
    typealias Failure = Error
    
    func receive(subscription: Subscription) {
        subscription.request(.max(2))
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        print("He recibido un nuevo valor: \(input)")
        return .none
    }
    
    func receive(completion: Subscribers.Completion<Failure>) {
        print("He receibido un completion. El flujo se cierra aqui")
    }
        
}

