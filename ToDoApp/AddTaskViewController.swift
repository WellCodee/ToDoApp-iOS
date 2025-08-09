//
//  AddTaskViewController.swift
//  ToDoApp
//
//  Created by Rania Arbash on 2025-08-02.
//

import UIKit

protocol AddingTaskDelegate {
    func addingTaskDoneWithResult(newtask: Task)
    func addingTaskCanceled()
}


class AddTaskViewController: UIViewController {

    var delegate : AddingTaskDelegate?
    
    @IBOutlet weak var taskTitle: UITextField!
    
    @IBOutlet weak var isUrgentSwitch: UISwitch!
    
    
    @IBOutlet weak var taskDatePicker: UIDatePicker!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func saveClicked(_ sender: Any) {
        
        
        
        if let title = taskTitle.text, !title.isEmpty {
            delegate?.addingTaskDoneWithResult(newtask: Task(name: taskTitle.text!, isUrgent: isUrgentSwitch.isOn, dateCreated: taskDatePicker.date))
            dismiss(animated: true)
        }
        else {
            var alertVC = UIAlertController(title: "Missing Info!", message: "You should enter the task title...", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .default))
            
            present(alertVC, animated: true)
            
            
        }
        
    }
    
    
    
    @IBAction func cancelClicked(_ sender: Any) {
        delegate?.addingTaskCanceled()
        dismiss(animated: true)
        
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
