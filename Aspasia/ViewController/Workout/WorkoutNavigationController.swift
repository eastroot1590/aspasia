//
//  WorkoutNavigationController.swift
//  Aspasia
//
//  Created by 이동근 on 2021/10/20.
//

import UIKit

class WorkoutNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.prefersLargeTitles = true
        navigationBar.standardAppearance.backgroundColor = .white
        navigationBar.standardAppearance.shadowColor = .clear
    }
}
