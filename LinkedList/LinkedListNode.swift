//Класс определяющий узел односвязного списка
//Узел имеет значение(различного типа) и ссылку на следующий узел

import Foundation

class LinkedListNode<T> {
    var value: T
    var nextNode: LinkedListNode<T>?
    
    init(value: T){
        self.value = value
    }
    
    deinit {
        print("Node with value \(value) deinit!")
    }
}
