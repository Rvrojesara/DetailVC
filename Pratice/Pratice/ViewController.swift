//
//  ViewController.swift
//  Pratice
//
//  Created by admin on 05/10/24.
//

import UIKit

class ViewController: UIViewController  {
    
    var JokeArr:[JokeModel]=[]
    var selectedjokes:JokeModel!
    
    @IBOutlet weak var tablevc: UITableView!
    
    @IBOutlet weak var loadingindicator: UIActivityIndicatorView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        callApiJokes()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    func callApiJokes(){
        loadingindicator.startAnimating()
        ApiManger().fetchJokes{result in
            switch result{
            case.success(let data):
                self.JokeArr.append(contentsOf: data)
                self.tablevc.reloadData()
                self.loadingindicator.stopAnimating()
                self.loadingindicator.isHidden=true
                
            case.failure(let error):
                debugPrint("Something went wrong")
                self.loadingindicator.stopAnimating()
                self.loadingindicator.isHidden=true
            }
        }
    }
}
    extension ViewController:UITableViewDataSource, UITableViewDelegate{
        func setup(){
            tablevc.dataSource=self
            tablevc.delegate=self
            tablevc.register(UINib(nibName: "JokeCell", bundle:nil), forCellReuseIdentifier: "JokeCell")
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return JokeArr.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "JokeCell", for: indexPath) as! JokeCell
            
            cell.typelabel.text=JokeArr[indexPath.row].type
            cell.setuplabel.text=JokeArr[indexPath.row].setup
            cell.punchlinelabel.text=JokeArr[indexPath.row].punchline
            return cell
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 150
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            selectedjokes=JokeArr[indexPath.row]
            performSegue(withIdentifier: "GoToNext", sender: self)
        }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier=="GoToNext"{
                if let detail=segue.destination as? DetailVC{
                    detail.currentjokes=selectedjokes
                }
            }
        }
        
        func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let delete=UIContextualAction(style: .destructive, title: "delete"){action,source,completion in
                self.JokeArr.remove(at: indexPath.row)
                self.tablevc.reloadData()
            }
            let configuration = UISwipeActionsConfiguration(actions: [delete])
            configuration.performsFirstActionWithFullSwipe=false
            return configuration
        }
    }


