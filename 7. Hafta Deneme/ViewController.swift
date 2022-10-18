//
//  ViewController.swift
//  7. Hafta Deneme
//
//  Created by Sümeyye Kılıçoğlu on 23.08.2022.
//
import TinyConstraints
import UIKit

class ViewController: UIViewController {
    
    
   public var noteArray = [String]()
    var titleArray = [String]()
    var chosenNote = ""
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TableViewCell.self,
                           forCellReuseIdentifier: TableViewCell.identifier)
        return tableView
    }()
    private let addButton: UIButton = {
        let addButton = UIButton()
        addButton.setTitle("Add", for: .normal)
        addButton.layer.cornerRadius = 10
        addButton.backgroundColor = .black
        addButton.setTitleColor(.white, for: .normal)
     
        return addButton
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
       
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        view.addSubview(tableView)
        view.addSubview(addButton)
        
        tableView.edgesToSuperview()
        
        addButton.topToSuperview().constant = 700
        addButton.leftToSuperview().constant = 50
        addButton.rightToSuperview().constant = -50
        
        addButton.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Segue" {
            if let AViewController = segue.destination as? AViewController {
                AViewController.delegate = self
            }
        }
    }
    @objc func addTapped() {
        chosenNote = ""
        performSegue(withIdentifier: "Segue", sender: nil)
    }
}




extension ViewController: AViewControllerDelegate {
    func saveNote(note title: String, title note: String) {
        noteArray.append(note)
        titleArray.append(title)
        tableView.reloadData()
        
    }
}








extension ViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteArray.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath)
                as? TableViewCell else {
            return UITableViewCell()
        }
        cell.titleLabel.text = "\(titleArray[indexPath.row])"
        cell.noteLabel.text = "\(noteArray[indexPath.row])"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenNote = noteArray [indexPath.row]
        performSegue(withIdentifier: "Segue", sender: nil)
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, IndexPath) in self.noteArray.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [IndexPath], with: .fade)
            
        }
        let edit = UITableViewRowAction(style: .normal, title: "Edit") { [self] action, indexPath in
            self.chosenNote = noteArray [indexPath.row]
            performSegue(withIdentifier: "Segue", sender: nil)
           
        
        }
        edit.backgroundColor = UIColor.blue
        
    return [delete, edit]
}
}
