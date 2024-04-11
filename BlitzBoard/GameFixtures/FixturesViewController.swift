//
//  FixturesViewController.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/04/03.
//

import UIKit

class FixturesViewController: UIViewController {
        
        @IBOutlet private var tableView: UITableView!
        
        private let viewModel = FixturesViewModel(repository: FixturesRepository())
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call ViewModel to fetch top scorers
        viewModel.fetchFixtures()

    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
