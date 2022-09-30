//
//  SettingsVC.swift
//  ptofileTest
//
//  Created by vladislav vaz on 30/09/22.
//

import UIKit
import Network

class SettingsVC: UIViewController {
    
    @IBOutlet weak var internetLabel: UILabel!
    
    let networkMonitor = NWPathMonitor()
    let queque = DispatchQueue(label: "InternetConnectionsMonitor")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        networkMonitor.pathUpdateHandler = { pathUpdateHandler in
            if pathUpdateHandler.status == .satisfied {
                print("Internet connection is on.")
                DispatchQueue.main.async {
                    self.internetLabel.text = "On"
                }
                
            } else {
                print("There's no internet connection.")
                DispatchQueue.main.async {
                    self.internetLabel.text = "Off"
                }
            }
        }
            networkMonitor.start(queue: queque)
        }
        
		

}
