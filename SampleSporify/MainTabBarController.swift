//
//  MainTabBarController.swift
//  SampleSporify
//
//  Created by Emre Havan on 20.03.20.
//  Copyright © 2020 Emre Havan. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    var collapsableVCFlow: ExpandableViewController?
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configureCollapsedTrainingView() {
        guard collapsableVCFlow == nil else {
            return
        }
        collapsableVCFlow = ExpandableViewController()
        collapsableVCFlow!.tabController = self
        view.addSubview(collapsableVCFlow!.view)
        collapsableVCFlow!.view.translatesAutoresizingMaskIntoConstraints = false
        collapsableVCFlow!.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collapsableVCFlow!.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

        collapsableVCFlow!.view.bottomAnchor.constraint(equalTo: tabBar.topAnchor).isActive = true
        let heightConstraint = collapsableVCFlow!.view.heightAnchor.constraint(equalToConstant: 50.0)
        heightConstraint.isActive = true
        collapsableVCFlow!.heightConstraint = heightConstraint

        collapsableVCFlow!.didMove(toParent: self)
    }
    
    func removeCollapsedView() {
        if let collapsableVCFlow = collapsableVCFlow {
            collapsableVCFlow.view.removeFromSuperview()
            collapsableVCFlow.removeFromParent()
            self.collapsableVCFlow = nil
        }
    }
}