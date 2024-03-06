//
//  HomePresenter.swift
//  CloneInstagram
//
//  Created by Visit Patcharapanyapong on 6/3/2567 BE.
//

import Foundation

protocol HomePresenterPresentationLogic {
    func presentData()
}

class HomePresenter: HomePresenterPresentationLogic {
    weak var viewController: HomeViewControllerDisplayLogic?
    
    func presentData() {
        let stories: [StoriesTableViewCellModel] = [
            .init(image: "im_test", name: "Test1"),
            .init(image: "im_test", name: "Test2"),
            .init(image: "im_test", name: "Test3"),
            .init(image: "im_test", name: "Test4"),
            .init(image: "im_test", name: "Test5"),
            .init(image: "im_test", name: "Test6"),
            .init(image: "im_test", name: "Test7"),
            .init(image: "im_test", name: "Test8"),
            .init(image: "im_test", name: "Test9"),
            .init(image: "im_test", name: "Test10"),
            .init(image: "im_test", name: "Test11"),
            .init(image: "im_test", name: "Test12"),
            .init(image: "im_test", name: "Test13"),
            .init(image: "im_test", name: "Test14"),
            .init(image: "im_test", name: "Test15"),
        ]
        var contents: [ContentTableViewCellModel] = []
        for index in 0...20 {
            contents.append(ContentTableViewCellModel(
                imageProfile: "im_test",
                name: "Test\(index + 1)",
                likeByName: "like By Fiw\(index + 1)",
                likeByImage: "im_test",
                commentImage: "im_test"))
        }
        let contentsCell = contents.map { HomeModels.CellTypes.contents($0) }
        let elements: [HomeModels.CellTypes] = [
            .header,
            .stories(stories)
        ]
        let combineElements = elements + contentsCell
        let viewModel = HomeModels.Datas.ViewModel(datas: combineElements)
        viewController?.displayData(viewModel: viewModel)
    }
}
