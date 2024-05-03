//
//  HomeViewController.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/04/14.
//

import UIKit

class FootballDataViewController: UIViewController {
    @IBOutlet weak var wallpaper: UIImageView!
    @IBOutlet weak var settingBtn: UIButton!
    @IBOutlet weak var standingsBtn: UIButton!
    @IBOutlet weak var fixturesBtn: UIButton!
    @IBOutlet weak var scorersBtn: UIButton!
let viewModel = FootballDataViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
// Example: Fetch data and display it
let standings = viewModel.fetchStandings()
let fixtures = viewModel.fetchFixtures()
let topScorers = viewModel.fetchTopScorers()
        print("Standings: \(standings)")
        print("Fixtures: \(fixtures)")
        print("Top Scorers: \(topScorers)")
        // Now you can use this data to update your UI elements
    }
}
