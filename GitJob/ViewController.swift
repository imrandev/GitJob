//
//  ViewController.swift
//  GitJob
//
//  Created by Fahim Mashroor on 24/3/21.
//

import UIKit
import Alamofire
import SkeletonView

class ViewController: UIViewController {

    @IBOutlet var tableView : UITableView!
    
    var jobs : [Job] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchJobs()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.isSkeletonable = true
        tableView.showSkeleton(usingColor: .blue, transition: .crossDissolve(0.25))
    }

    func fetchJobs() {
        let request = AF.request("https://jobs.github.com/positions.json")
        request.responseDecodable(of: [Job].self){
            (response) in
            self.jobs = response.value!
            print(self.jobs[0].title!)
            self.tableView.stopSkeletonAnimation()
            self.view.hideSkeleton()
            self.tableView.reloadData()
        }
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped!!")
    }
}

extension ViewController : SkeletonTableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.jobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! JobTableViewCell
        cell.load(job: self.jobs[indexPath.row])
        return cell
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "cell"
    }
}

