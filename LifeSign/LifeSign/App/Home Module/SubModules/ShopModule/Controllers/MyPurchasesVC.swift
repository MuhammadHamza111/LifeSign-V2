//
//  MyPurchasesVC.swift
//  LifeSign
//
//  Created by Haider Ali on 12/05/2021.
//  Copyright © 2021 softwarealliance. All rights reserved.
//

import UIKit

class MyPurchasesVC: LifeSignBaseVC {
    
    // MARK:- OUTLETS -
    @IBOutlet weak var whatIhaveLabel: UILabel! {
        didSet {
            whatIhaveLabel.font = Constants.bigButtonFont
        }
    }
    @IBOutlet weak var availableDailySignContactLabel: UILabel! {
        didSet {
            availableDailySignContactLabel.font = Constants.labelFont
        }
    }
    @IBOutlet weak var availableExtraClicksLabel: UILabel! {
        didSet {
            availableExtraClicksLabel.font = Constants.labelFont
        }
    }
    @IBOutlet weak var extraPockGamesLabel: UILabel! {
        didSet {
            extraPockGamesLabel.font = Constants.labelFont
        }
    }
    @IBOutlet weak var removeAdsLabel: UILabel! {
        didSet {
            removeAdsLabel.font = Constants.labelFont
        }
    }
    @IBOutlet weak var availabelMessageContactLabel: UILabel! {
        didSet {
            availabelMessageContactLabel.font = Constants.labelFont
        }
    }
    @IBOutlet weak var availableSMS: UILabel! {
        didSet {
            availableSMS.font = Constants.labelFont
        }
    }
    @IBOutlet var collection: [UIButton]!
    
    // MARK:- PROPERTIES -
    
    
    // MARK:- VIEW LIFECYCLE -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setText()
        observerLanguageChange()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK:- FUNCTIONS -
    
    func setUI () {
        
    }
    
    @objc func setText() {
        guard let resources = UserManager.shared.userResources else {return}
        availableDailySignContactLabel.text = "\(resources.daily_sign_contact) " + AppStrings.getPurchasesDSContactString()
        availableExtraClicksLabel.text = "\(resources.auto_clicked) " + AppStrings.getPurchasesClicksString()
        extraPockGamesLabel.text = "\(resources.game_contact) " + AppStrings.getPurchasesGamesString()
        removeAdsLabel.text = AppStrings.getPurchasesRemovedAdsString()
        availabelMessageContactLabel.text = "\(resources.message_contact) " + AppStrings.getMessageContactPurchased()
        availableSMS.text = "\(resources.total_sms) " + AppStrings.getPurchasesSMSString()
        
        for buttons in collection {
            buttons.setTitle(AppStrings.getAddFriendString(), for: .normal)
        }
    }
    
    func observerLanguageChange() {
        NotificationCenter.default.addObserver(self, selector: #selector(setText), name: .languageCanged, object: nil)
    }
    
    // MARK:- ACTIONS -
    
    @IBAction func didTapAddMore(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            print("Buy More DS Contact")
            self.dismiss(animated: true) {
                NotificationCenter.default.post(name: .redirectToShop, object: ["shopIndex":0])
            }
        case 2:
            print("Buy More Auto Clicks")
            self.dismiss(animated: true) {
                NotificationCenter.default.post(name: .redirectToShop, object: ["shopIndex":1])
            }
        case 3:
            print("Buy More Poke Games")
            self.dismiss(animated: true) {
                NotificationCenter.default.post(name: .redirectToShop, object: ["shopIndex":1])
            }
        case 4:
            print("Buy Remove Ads")
            self.dismiss(animated: true) {
                NotificationCenter.default.post(name: .redirectToShop, object: ["shopIndex":2])
            }
        case 5:
            print("Buy Message Contacts")
            self.dismiss(animated: true) {
                NotificationCenter.default.post(name: .redirectToShop, object: ["shopIndex":2])
            }
        case 6:
            print("Buy More SMS")
            self.dismiss(animated: true) {
                NotificationCenter.default.post(name: .redirectToShop, object: ["shopIndex":2])
            }
        default:
            return
        }
    }
    
    @IBAction func didTapBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
