//
//  ViewController.swift
//  TableViewMultipleSelection
//
//  Created by Do Tri on 9/7/18.
//  Copyright © 2018 Do Tri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var tbView: UITableView!
    var viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tbView.delegate = self
        tbView.dataSource = self
        tbView.allowsMultipleSelection = true
        
        viewModel.didToggleSelection = { [weak self] hasSelection in
            self?.nextButton?.isEnabled = hasSelection
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func next(_ sender: UIButton) {
        print("OK OK OK")
    }

}

extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if viewModel.selectedItems.count > 2 {
            return nil
        }
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.items[indexPath.row].isSelected = true
        viewModel.reloadData()
        viewModel.didToggleSelection?(!viewModel.selectedItems.isEmpty)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        viewModel.items[indexPath.row].isSelected = false
        viewModel.reloadData()
        viewModel.didToggleSelection?(!viewModel.selectedItems.isEmpty)
    }
    
    
}

extension ViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomCell
        cell.item = viewModel.items[indexPath.row]
        return cell
    }
}

