//
//  LeagueTableViewController.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/04/03.
//

import UIKit

class LeagueTableViewController: UIViewController {
    
        // MARK: - Properties
        
    private let viewModel: LeagueTableViewModel
        
        // MARK: - Initialization
        
    init(viewModel: LeagueTableViewModel = LeagueTableViewModel()) {
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
        }
        
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchLeagueTable()

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
