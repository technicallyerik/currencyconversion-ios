//
//  ViewController.swift
//  CurrencyConversion-MVVM
//
//  Created by Erik Weiss on 7/3/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var amountToConvert: UITextField!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var convertButton: UIButton!
    var viewModel: ViewModel!  // IN MVVM, VIEW OWNS VIEW MODEL
    var disposeBag: DisposeBag!
    
    override func viewDidLoad() {
        
        disposeBag = DisposeBag()
        self.viewModel = ViewModel()
        amountToConvert.rx.text.map{ Double.init($0 ?? "0") ?? 0 }.bind(to: viewModel.sourceAmount).addDisposableTo(disposeBag)
        viewModel.destinationAmount.asObservable().map{ "\($0)" }.bind(to: result.rx.text).addDisposableTo(disposeBag)
        convertButton.rx.tap.subscribe({ [weak self] _ in self?.viewModel.performConversion() }).addDisposableTo(disposeBag)

    }
    
}

