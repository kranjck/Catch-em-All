//
//  ViewController.swift
//  Catch 'em All
//
//  Created by Gigi Kranjc on 2021-04-05.
//

import UIKit

class ListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
//    var creatures = ["pokemon", "pokemo", "pokem", "poke", "pok"]

    var creatures = Creatures()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        creatures.getData {
            DispatchQueue.main.async {
                self.navigationItem.title = "Returned \(self.creatures.creatureArray.count) of \(self.creatures.count) pokemon"
                self.tableView.reloadData()
            }
        }
    }


}
extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return creatures.creatureArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1). \(creatures.creatureArray[indexPath.row].name.capitalized)"
        return cell
    }
    
    
}
