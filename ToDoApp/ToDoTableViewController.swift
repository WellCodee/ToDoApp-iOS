//
//  ToDoTableViewController.swift
//  ToDoApp
//
//  Created by Rania Arbash on 2025-07-25.
//

import UIKit

class ToDoTableViewController: UITableViewController, AddingTaskDelegate {
 
    

    var allTasks  = TaskManager.shared.tasks
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
      
       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = allTasks[indexPath.row].name
        cell.detailTextLabel?.text = allTasks[indexPath.row].dateCreated.description
    
        cell.backgroundColor = allTasks[indexPath.row].isUrgent ? .red : .green
        
        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            TaskManager.shared.deleteTask(at: indexPath.row)
            allTasks  = TaskManager.shared.tasks
            tableView.reloadData()
        }
    }
    
    func addingTaskDoneWithResult(newtask: Task) {
        TaskManager.shared.addTask(ntask: newtask)
        allTasks.append(newtask)
        tableView.reloadData()
    }
    
    func addingTaskCanceled() {
        
    }
    
    
    
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        var addingVC = segue.destination as? AddTaskViewController
        addingVC?.delegate = self
        
    }
    

}
