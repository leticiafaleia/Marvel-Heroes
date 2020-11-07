//
//  HeroTableViewController.swift
//  Marvel Heroes
//
//  Created by Letícia on 06/11/20.
//

import UIKit

class HeroTableViewController: UITableViewController {
    
    var name: String?
    var heroes: [Hero] = []
    var loadingHeroes = false
    var currentPage: Int = 0
    var total = 0
    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Searching a hero..."
        loadHeroes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func loadHeroes(){
        loadingHeroes = true
        Service.fetchHeroes(name: name, page: currentPage) { (heroInfo) in
            if let hero = heroInfo {
                self.heroes += hero.data.results
                self.total = hero.data.total
                DispatchQueue.main.async {
                    self.loadingHeroes = false
                    self.label.text = "\(self.name) not found!"
                    self.tableView.reloadData()
                }
            }
        }
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundView = heroes.count == 0 ? label : nil
        return heroes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HeroTableViewCell
        
        let hero = heroes[indexPath.row]
        cell.prepareCell(with: hero)
        return cell
    }
}
