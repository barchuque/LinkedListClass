//Класс определяющий односвязный список и несколько основных методов для работы с ним

class LinkedList<T> {
    private var head: LinkedListNode<T>?
    var count: Int = 0
    
    //Добавление узла в конец списка
    func add(_ element: T) {
        guard var currentNode = head else {
            head = LinkedListNode(value: element)
            count += 1
            return
        }
        
        while let nextNode = currentNode.nextNode {
            currentNode = nextNode
        }
        
        currentNode.nextNode = LinkedListNode(value: element)
        count += 1
    }
    
    //Удаление узла по индексу
    func remove(at index: Int){
        guard var currentNode = head, index >= 0 else {
            fatalError("Index out of bounds for length!")
        }
        
        if index == 0 {
            head = head?.nextNode
            return
        }
        
        var previosNode = currentNode
        var nextNode: LinkedListNode<T>?
        
        
        for _ in 0..<index {
            if currentNode.nextNode != nil {
                previosNode = currentNode
                currentNode = currentNode.nextNode!
                nextNode = currentNode.nextNode
            } else {
                fatalError("Index out of bounds for length!")
            }
        }
        
        previosNode.nextNode = nextNode
        count -= 1
    }
    
    //Удаление последнего узла списка
    func removeLast() {
        guard var currentNode = head else {
            return
        }
        
        var previosNode = currentNode
        
        while let nextNode = currentNode.nextNode {
            previosNode = currentNode
            currentNode = nextNode
        }
        previosNode.nextNode = nil
        
        count -= 1
    }
    
    //Удаление всех узлов списка
    func clear() {
        head = nil
        count = 0
    }
    
    //Получение или изменение значения существующего узла
    subscript(_ index: Int) -> T {
        get {
            guard var currentNode = head, index >= 0 else { fatalError("Index out of bounds for length!") }
            
            for _ in 0..<index {
                if let nextNode = currentNode.nextNode {
                    currentNode = nextNode
                } else {
                    fatalError("Index out of bounds for length!")
                }
            }
            
            return currentNode.value
        }
        
        set {
            guard var currentNode = head, index >= 0 else { fatalError("Index out of bounds for length!") }
            
            for _ in 0..<index {
                if let nextNode = currentNode.nextNode {
                    currentNode = nextNode
                } else {
                    fatalError("Index out of bounds for length!")
                }
            }
            
            currentNode.value = newValue
        }
    }
    
    //Преобразование списка в массив значений
    func toArray() -> [T]{
        guard var currentNode = head else { return [T]() }
        var valueArray = [currentNode.value]
        
        while let nextNode = currentNode.nextNode {
            currentNode = nextNode
            valueArray.append(nextNode.value)
        }
        
        return valueArray
    }
    
    //Получение количества узлов списка
    func getCount() -> Int {
        return count
    }
}
