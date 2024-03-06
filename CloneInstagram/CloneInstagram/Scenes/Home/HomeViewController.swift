//
//  HomeViewController.swift
//  CloneInstagram
//
//  Created by Visit Patcharapanyapong on 6/3/2567 BE.
//

import UIKit

protocol HomeViewControllerDisplayLogic: AnyObject {
    func displayData(viewModel: HomeModels.Datas.ViewModel)
}

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var interactor: HomeInteractor?
    var datas: [HomeModels.CellTypes] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupScene()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        interactor?.getDatas()
    }
    
    private func setupScene() {
        let presenter = HomePresenter()
        interactor = HomeInteractor()
        interactor?.presenter = presenter
        presenter.viewController = self
    }
    
    private func setup() {
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        
        let nib = UINib(nibName: "HeaderTableViewCell", bundle: nil)
        let storiesNib = UINib(nibName: "StoriesTableViewCell", bundle: nil)
        let contentNib = UINib(nibName: "ContentTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "HeaderTableViewCell")
        tableView.register(storiesNib, forCellReuseIdentifier: "StoriesTableViewCell")
        tableView.register(contentNib, forCellReuseIdentifier: "ContentTableViewCell")
    }
}

extension HomeViewController: HomeViewControllerDisplayLogic {
    func displayData(viewModel: HomeModels.Datas.ViewModel) {
        datas = viewModel.datas
        tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let element = datas[indexPath.row]
        
        switch element {
        case .header:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell", for: indexPath) as? HeaderTableViewCell else {
                return UITableViewCell()
            }
            return cell
        case let .stories(data):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoriesTableViewCell", for: indexPath) as? StoriesTableViewCell else {
                return UITableViewCell()
            }
            cell.setCell(data: data)
            return cell
        case let .contents(data):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContentTableViewCell", for: indexPath) as? ContentTableViewCell else {
                return UITableViewCell()
            }
            cell.setCell(data: data)
            return cell
        }
    }
}
