//
//  MenuPresenter.swift
//  HammerSystemsTestTask
//
//  Created by pavel mishanin on 16.10.2022.
//

import Foundation
import UIKit

protocol IMenuPresenter: AnyObject {
    var numberOfRowsInSection: Int { get }
    func getFoodByIndex(_ index: Int) -> FoodViewModel
    func didSelectCategory(_ string: String)
    func loadImageData(_ string: String, completion: @escaping (Data) -> ())
    func onViewAttached(controller: IMenuViewController)
}

final class MenuPresenter {
    
    private weak var controller: IMenuViewController?
    private let interactor: IMenuInteractor
    
    private var foodArray: [FoodViewModel] = []
    
    init(interactor: IMenuInteractor) {
        self.interactor = interactor
    }
}

extension MenuPresenter: IMenuPresenter {
    
    var numberOfRowsInSection: Int {
        get {
            foodArray.count
        }
    }
    
    func getFoodByIndex(_ index: Int) -> FoodViewModel {
        foodArray[index]
    }
    
    func didSelectCategory(_ string: String) {
        guard let row = foodArray.firstIndex(where: { $0.category == string }) else { return }
        
        controller?.scrollTo(row: row, section: 1)
    }
    
    func loadImageData(_ string: String, completion: @escaping (Data) -> ()) {
        interactor.loadImageData(string) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    completion(data)
                }
            case .failure(let error):
                print("ERROR --> \(error)")
            }
        }
    }
    
    func onViewAttached(controller: IMenuViewController) {
        self.controller = controller
        loadData()
    }
}

private extension MenuPresenter {
    
    func loadData() {
        interactor.loadData { [ weak self ] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let array):
                self.foodArray.append(contentsOf: array)
                
                DispatchQueue.main.async {
                    self.controller?.reloadData()
                }
            case .failure(let error):
                print("ERROR --> \(error)")
            }
        }
    }
}
