//
//  ViewController.swift
//  RxMvvM
//
//  Created by Delfin Hernandez Gomez on 7/11/22.
//

import UIKit
import Combine


class ViewController: UIViewController {
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var imageIV: UIImageView!
    
    static let nombre = "Selfin"
    
    let viewModel: ViewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        subscribeToLoadingState()
        
        subscribeToImageState()
        
        viewModel.loadImage()
        
        let subscriber: any Subscriber = StringSubscriber()
        
        let publisher = ["A","B","C","D","E"].publisher
        
        viewModel.stringEvents.sink { value in
            print(value)
        }

        let subject = PassthroughSubject<String, Error>()
        
        subject.subscribe(StringSubscriber())
        
        subject.send("A")
        subject.send("B")
        
    }
    
    
    func subscribeToLoadingState() {
        // TODO
        _ = viewModel.$imageData
            .subscribe(on: DispatchQueue.main)
            .sink(receiveValue: { imageData in
                guard let data = imageData else {
                    OperationQueue.main.addOperation({
                        self.imageIV.isHidden = true
                    })
                    return
                }
                if let image = UIImage(data: data){
                    OperationQueue.main.addOperation({
                        self.imageIV.image = image
                        self.imageIV.isHidden = false
                    })
                }
            })
    }
    
    func subscribeToImageState  () {
        // TODO
        _ = viewModel.$isLoading
            .subscribe(on: DispatchQueue.main)
            .sink(receiveValue: { isLoading in
                if(isLoading){
                    OperationQueue.main.addOperation({
                        self.imageIV.isHidden = true
                        self.loader.startAnimating()
                        self.loader.isHidden = false
                    })
                }else {
                    OperationQueue.main.addOperation({
                        self.imageIV.isHidden = false
                        self.loader.isHidden = true
                        self.loader.stopAnimating()
                    })
                }
            })
    }
    
}


