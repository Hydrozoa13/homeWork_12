/*:
 ## Упражнение - приведение типов и их контроль
 
 Создайте коллекцию типа [Any], включающую несколько вещественных чисел, целых, строк и булевых значений.  Распечатайте содержимое коллекции.
 */
let collection: [Any] = ["Card", 6, true, 4.83, "256", 999,
                         4567.235, true, false, -43, "Juice",
                         "Laptop", false, 554.785768, "Ring",
                         1990, "Sock", 23, true, "-76", 45.2]

print(collection)
/*:
 Пройдите по всем элементам коллекции.  Для каждого целого, напечайте "Целое число " и его значение.  Повторите то же самое для вещественных чисел, строк и булевых значений.
 */
for item in collection {
    if item is Int {
        print("Целое число - \(item)")
    } else if item is Double {
        print("Вещественное число - \(item)")
    } else if item is String {
        print("Строковое значение - \(item)")
    } else {
        print("Булево значение - \(item)")
    }
}
/*:
 Создайте словарь [String : Any], где все значения — это смесь вещественных и целых чисел, строк и булевых значений.  Выведите крассиво на консоль пары ключ/значения для всех элементов коллекции.
 */
let countOfCollection = collection.count
var keysArray: [String] = []
for i in 1...countOfCollection {
    keysArray.append("Key \(i)")
}
let dictionary = Dictionary(uniqueKeysWithValues: zip(keysArray, collection))
for item in dictionary {
    print("\(item.key) - \(item.value)")
}
/*:
 Создайте переменную `total` типа `Double`, равную 0.  Переберите все значения словаря, и добавьте значение каждого целого и вещественного числа к значению вашей переменной.  Для каждой строки добавьте 1.  Для каждого булева значения, добавьте 2, в случае, если значение равно `true`, либо вычтите 3, если оно `false`.  Напечатайте значение `total`.
 */
var total: Double = 0
for value in dictionary.values {
    if let valueInt = value as? Int {
        total += Double(valueInt)
    } else if let valueDouble = value as? Double {
        total += valueDouble
    } else if let valueString = value as? String {
        total += 1
    } else if let valueBool = value as? Bool {
        if valueBool {
            total += 2
        } else {
            total -= 3
        }
    }
}
print(total)
/*:
 Обнулите переменную `total` и снова пройдите по всей коллекции, прибавляя к ней все целые и вещественные числа.  Для каждой строки, встретившейся на пути, попробуйте сконвертировать её в число, и добавьте это значение к общему.  Игнорируйте булевы значения.  Распечатайте итог.
 */
total = 0
for value in dictionary.values {
    switch value {
    case let valueInt as Int: total += Double(valueInt)
    case let valueDouble as Double: total += valueDouble
    case let valueString as String:
        if let unwrpValueString = Double(valueString) {
            total += unwrpValueString
        }
    default: break
    }
}
print(total)
