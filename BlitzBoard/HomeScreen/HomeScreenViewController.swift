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
let standings = viewModel.fetchStandings()
let fixtures = viewModel.fetchFixtures()
let topScorers = viewModel.fetchTopScorers()
        print("Standings: \(standings)")
        print("Fixtures: \(fixtures)")
        print("Top Scorers: \(topScorers)")
    }
}
