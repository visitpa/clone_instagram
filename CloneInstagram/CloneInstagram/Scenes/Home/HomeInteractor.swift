//
//  HomeInteractor.swift
//  CloneInstagram
//
//  Created by Visit Patcharapanyapong on 6/3/2567 BE.
//

import Foundation

protocol HomeInteractorBusinessLogic {
    func getDatas()
}

class HomeInteractor: HomeInteractorBusinessLogic {
    var presenter: HomePresenterPresentationLogic?
    
    func getDatas() {
        presenter?.presentData()
    }
}
