//
//  ViewController.swift
//  GithubApiApp
//
//  Created by Jonatan Eduardo de Araujo on 27/05/21.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    
    
    @IBAction func checkButtonAction() {
        getGithubData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Voltar", style: .plain, target: nil, action: nil)
    }
    
    func getGithubData() {
        
        let tableViewController = self.storyboard?.instantiateViewController(identifier: "TableViewController") as! TableViewController
        let trimUserName = userName.text ?? "".trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard let url = URL(string: "https://api.github.com/users/\(trimUserName)/repos") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let error = error {
                print("Fetch failed: \(error.localizedDescription)")
            } else {
                if let data = data {
                    do {
                        let repos = try JSONDecoder().decode([Repo].self, from: data)
                        DispatchQueue.main.async {
                            tableViewController.repos = repos
                            self.navigationController?.pushViewController(tableViewController, animated: true)
                        }
                    } catch {
                        print(error)
                    }
                }
            }
        }.resume()
    }
    
}

