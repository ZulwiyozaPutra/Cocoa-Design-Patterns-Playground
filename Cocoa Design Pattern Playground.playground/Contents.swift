import UIKit
import Foundation

class DataSourceExample: NSObject, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "")
        let description = "Row \(indexPath.row) Section \(indexPath.section)"
        cell.textLabel?.text = "It's a cell!"
        cell.detailTextLabel?.text = description
        
        return cell
    }
}

let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
let dataSource = DataSourceExample()
tableView.dataSource = dataSource
tableView.reloadData()
tableView



// Design Patter: Target/Action

class MyTarget: NSObject {
    func performAction() {
        print("bullseye!")
    }
}

let target = MyTarget()
let button = UIButton()


// And set our target to perform the "performAction" function when a "TouchUpInside" event occurs.
button.addTarget(target, action: #selector(MyTarget.performAction), for: .touchUpInside)
button.sendActions(for: .touchUpInside)


// Design Pattern: MVC

// Used to count up or down
struct CounterModel {
    // Only this struct can adjust the value
    private(set) var value:Int = 0
    
    mutating func increment() {
        value += 1
    }
    
    mutating func decrement() {
        value -= 1
    }
}


class ViewController {
    
    var counterModel: CounterModel = CounterModel()
    var counterValue: Int = 0
    
    let incrementButton = UIButton()
    let decrementButton = UIButton()
    
    init() {
        incrementButton.addTarget(self, action: #selector(self.didIncrement), for: .touchUpInside)
        decrementButton.addTarget(self, action: #selector(self.didDecrement), for: .touchUpInside)
    }
    
    // MARK - Controller functions
    
    @objc func didIncrement() {
        counterModel.increment()
        updateViewLayer()
    }
    
    @objc func didDecrement() {
        counterModel.decrement()
        updateViewLayer()
    }
    
    func updateViewLayer() {
        counterValue = counterModel.value
    }
}

let viewController = ViewController()
viewController.incrementButton.sendActions(for: .touchUpInside)
viewController.incrementButton.sendActions(for: .touchUpInside)
viewController.counterValue
