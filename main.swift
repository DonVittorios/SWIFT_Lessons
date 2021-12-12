//
//  main.swift
//  DZ7_Victor_Denisov
//
//  Created by Виктор on 11.12.2021.
//

import Foundation

// MARK: - Errors
enum ParkingMeterClassError: Error {
    case invalidSelection                    // нет в ассортименте
    case outOfStock                          // нет в наличии
    case insufficientFunds(coinsNeeded: Int) // недостаточно денег, передаем недостаточную сумму
}

// MARK: - Parking meter positions
struct ParkingMeter {
    var price: Int
    var count: Int
    let place: Place
}
struct Place {
    let name: String
}
// MARK: - Сreated the mechanics of the parking meter
class ParkingMeterClass {
    var parkingSpaces = [
        "Легковые": ParkingMeter(price: 100, count: 50, place: Place(name: "Легковые")),
        "Автобусы": ParkingMeter(price: 150, count: 20, place: Place(name: "Автобусы")),
        "Грузовые": ParkingMeter(price: 200, count: 10, place: Place(name: "Грузовые"))]
    var coinsDeposited = 0
    //MARK: - Product sale function
    func vend(itemNamed name: String) throws -> Place {
        guard let item = parkingSpaces[name] else {
            throw ParkingMeterClassError.invalidSelection
        }
        guard item.count > 0 else {
            throw ParkingMeterClassError.outOfStock
        }
        guard item.price <= coinsDeposited else {
            throw ParkingMeterClassError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        coinsDeposited -= item.price
        var newItem = item
        newItem.count -= 1
        parkingSpaces[name] = newItem
        print("Dispensing \(name)")
        return newItem.place
    }
}
// MARK: - Purchase attempts and error handling
let parkingMeter = ParkingMeterClass()
do {let firstSale = try parkingMeter.vend(itemNamed: "Мотоциклы")
} catch ParkingMeterClassError.invalidSelection {
    print("Такого типа парковочного места нет.")
} catch ParkingMeterClassError.insufficientFunds(let coinsNeeded) {
    print("Введенная сумма недостаточна. необходимо еще \(coinsNeeded) рублей.")
} catch let error {
    print("Произошла ошибка: \(error.localizedDescription)")
}
do {let secondSale = try parkingMeter.vend(itemNamed: "Автобусы")
} catch ParkingMeterClassError.invalidSelection {
    print("Такого типа парковочного места нет.")
} catch ParkingMeterClassError.insufficientFunds(let coinsNeeded) {
    print("Введенная сумма недостаточна. необходимо еще \(coinsNeeded) рублей.")
} catch let error {
    print("Произошла ошибка: \(error.localizedDescription)")
}
do {let thirdSale = try parkingMeter.vend(itemNamed: "Грузовые")
} catch ParkingMeterClassError.invalidSelection {
    print("Такого типа парковочного места нет.")
} catch ParkingMeterClassError.insufficientFunds(let coinsNeeded) {
    print("Введенная сумма недостаточна. необходимо еще \(coinsNeeded) рублей.")
} catch let error {
    print("Произошла ошибка: \(error.localizedDescription)")
}
