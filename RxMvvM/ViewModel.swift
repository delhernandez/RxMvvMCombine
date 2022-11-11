//
//  ViewModel.swift
//  RxMvvM
//
//  Created by Delfin Hernandez Gomez on 11/11/22.
//

import Foundation
import Combine

class ViewModel {
    
    private let randomImageUrl = "https://picsum.photos/700/400"
    
    @Published var isLoading: Bool
    @Published var imageData: Data?
    
    init() {
        isLoading = true
    }
    
    func loadImage() {
        DispatchQueue.global().async {
            while(true) {
                self.isLoading = true
                sleep(1)
                do {
                    if let imageUrl = URL(string: self.randomImageUrl) {
                        self.imageData = try? Data(contentsOf: imageUrl)
                    }
                }
                self.isLoading = false
                sleep(5)
            }
        }
    }
}
