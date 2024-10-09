//
//  DetailVC.swift
//  Pratice
//
//  Created by admin on 05/10/24.
//

import UIKit

class DetailVC: UIViewController {

    var currentjokes:JokeModel!
    @IBOutlet weak var punchlinelbl: UILabel!
    @IBOutlet weak var setuplbl: UILabel!
    @IBOutlet weak var typelbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setdata()

        // Do any additional setup after loading the view.
    }
    func setdata(){
        typelbl.text=currentjokes.type
        setuplbl.text=currentjokes.setup
        punchlinelbl.text=currentjokes.punchline
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
