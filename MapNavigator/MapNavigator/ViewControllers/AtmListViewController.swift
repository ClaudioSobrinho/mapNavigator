//
//  AtmListViewController.swift
//  MapNavigator
//
//  Created by Claudio Sobrinho on 29/10/2018.
//  Copyright © 2018 Claudio Sobrinho. All rights reserved.
//

import UIKit

class AtmListViewController: UIViewController {
    
    // MARK: - Private Vars
    private let viewModel: InitialScreenViewModel
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Initializers
    init(viewModel: InitialScreenViewModel = InitialScreenViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
    
    // MARK: - Appearance
    private func configureAppearance() {
        title = Localizable.AtmListVC.title
        
        let cancelButton = UIButton()
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(UIColor.black, for: .normal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: cancelButton)
        cancelButton.addTarget(self, action: #selector(didTouchCancelButton), for: .touchUpInside)
        
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.register(cellType: AtmListCell.self)
        tableView.tableFooterView = UIView()
        let headerView = UIView()
        headerView.height = 16
        tableView.tableHeaderView = headerView
    }
    
    // MARK: Actions
    @objc func didTouchCancelButton() {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource
extension AtmListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfItems = viewModel.numberOfItems()
        
        return numberOfItems
    }
}

// MARK: - UITableViewDelegate
extension AtmListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let atmCell = tableView.dequeueReusableCell(withIdentifier: AtmListCell.identifier) as! AtmListCell
        let cellViewModel = viewModel.cellViewModel(for: indexPath.row)
        atmCell.configure(withViewModel: cellViewModel)
        return atmCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
