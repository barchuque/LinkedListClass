//Инициализация пустого списка (без вершины)
let myList = LinkedList<String>()

myList.add("a")
myList.add("b")
myList.add("c")

//myList.removeLast()
myList.remove(at: 2)

myList[1] = "newValue"

print("Elements of list: \(myList.toArray()) \nNumber of elements: \(myList.getCount())")

