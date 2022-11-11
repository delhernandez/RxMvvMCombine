//
//  ViewController.swift
//  RxMvvM
//
//  Created by Delfin Hernandez Gomez on 7/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var imageIV: UIImageView!
    
    let viewModel: ViewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        subscribeToLoadingState()
        
        subscribeToImageState()
        
        viewModel.loadImage()
    }
    
    
    func subscribeToLoadingState() {
       // TODO
        
    }
    
    func subscribeToImageState  () {
        // TODO
    }
    
}

