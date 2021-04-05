//
//  DetailViewController.swift
//  Catch 'em All
//
//  Created by Gigi Kranjc on 2021-04-05.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var creature: Creature!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "pokemon"
        nameLabel.text = creature.name.capitalized
        heightLabel.text = "huge"
        weightLabel.text = "snacc"
        
        if creature == nil {
            creature = Creature(name: "", url: "")
        }
    }
    
    
}
//func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    print("\(indexPath.row) of \(creatures.creatureArray.count)")
//    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//    if indexPath.row == creatures.creatureArray.count-1 && creatures.urlString.hasPrefix("http") {
//        creatures.getData {
//            DispatchQueue.main.async {
//                self.navigationItem.title = "Retrieved \(self.creatures.creatureArray.count) of \(self.creatures.count) pokemon"
//                self.tableView.reloadData()
//            }
//        }
//    }
//    cell.textLabel?.text = "\(indexPath.row + 1). \(creatures.creatureArray[indexPath.row].name)"
//    return cell
//}
