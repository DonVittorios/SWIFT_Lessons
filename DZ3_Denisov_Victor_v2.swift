//
//  main.swift
//  DZ3_Denisov_Victor_v2
//
//  Created by Виктор on 28.11.2021.
//

import Foundation

/*
 1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
 6. Вывести значения свойств экземпляров в консоль.
*/

print("Решение Заданий № 1 - 6:")

// Создал перечисления

enum EngineState {
    case start
    case stop //состояние двигателя
}

enum WindowsState {
    case open
    case close //состояние окон
}

enum TrunkState {
    case full
    case empty // состояние багажника/кузова
}

// Создал структуру Спорткара
struct SportCa {
    let carBrand: String
    let carModel: String
    var carColor: String
    mutating func changeColor(color: String) {
        switch color {
        case "Красный":
            carColor = "Красный"
            print("\(carBrand) \(carModel) покрасили в: \(carColor)")
        case "Желтый":
            carColor = "Желтый"
            print("\(carBrand) \(carModel) покрасили в: \(carColor)")
        case "Синий":
            carColor = "Синий"
            print("\(carBrand) \(carModel) покрасили в: \(carColor)")
        case "Зеленый":
            carColor = "Зеленый"
            print("\(carBrand) \(carModel) покрасили в: \(carColor)")
        case "Черный":
            carColor = "Черный"
            print("\(carBrand) \(carModel) покрасили в: \(carColor)")

        default:
            print("У данной марки такого цвета нет!")
        }
    }
    let yearOfProduction: Int
    var engineState: EngineState {
        willSet {
            if newValue == .start {
                print("Двигатель \(carBrand) запущен.")
            } else {
                print("Двигатель \(carBrand) заглушен.")
            }
        }
    }
    var windowsState: WindowsState {
        willSet {
            if newValue == .open {
                print("Окна автомобиля \(carBrand) открыты.")
            } else {
                print("Окна автомобиля \(carBrand) закрыты.")
            }
        }
    }
    var trunkState: TrunkState
    mutating func emptyTrunck() {
        trunkState = .empty
        print ("В багажнике \(carBrand) пусто.")
    }
    var trunkVolume: Int {
        willSet {
            if  (trunkState == .empty) && (trunkVolume > 0) && (trunkVolume != 0) && (newValue < trunkVolume) {
                let space = trunkVolume - newValue
                print("В багажнике \(carBrand) осталось свободного места: \(space) Куб. см.")
            } else {
                print ("Данный объем не поместится в \(carBrand), т.к. багажник полный.")
            }
        }
    }
}

// Создал структуру Грузовика
struct TrunkCar {
    let carBrand: String
    let carModel: String
    var carColor: String
    mutating func changeColor(color: String) {
        switch color {
        case "Красный":
            carColor = "Красный"
            print("\(carBrand) \(carModel) покрасили в: \(carColor)")
        case "Желтый":
            carColor = "Желтый"
            print("\(carBrand) \(carModel) покрасили в: \(carColor)")
        case "Синий":
            carColor = "Синий"
            print("\(carBrand) \(carModel) покрасили в: \(carColor)")
        case "Зеленый":
            carColor = "Зеленый"
            print("\(carBrand) \(carModel) покрасили в: \(carColor)")
        case "Черный":
            carColor = "Черный"
            print("\(carBrand) \(carModel) покрасили в: \(carColor)")

        default:
            print("У данной марки такого цвета нет!")
        }
    }
    let yearOfProduction: Int
    var engineState: EngineState {
        willSet {
            if newValue == .start {
                print("Двигатель \(carBrand) запущен.")
            } else {
                print("Двигатель \(carBrand) заглушен.")
            }
        }
    }
    var windowsState: WindowsState {
        willSet {
            if newValue == .open {
                print("Окна грузовика \(carBrand) открыты.")
            } else {
                print("Окна грузовика \(carBrand) закрыты.")
            }
        }
    }
    var trunkState: TrunkState
    mutating func emptyTrunck() {
        trunkState = .empty
        print ("В багажнике \(carBrand) пусто.")
    }
    var trunkVolume: Int {
        willSet {
            if  (trunkState == .empty) && (trunkVolume > 0) && (trunkVolume != 0) && (newValue < trunkVolume) {
                let space = trunkVolume - newValue
                print("В кузове \(carBrand) осталось свободного места: \(space) килограмм")
            } else {
                print ("Данный объем не поместится в \(carBrand), т.к. кузов полный.")
            }
        }
    }
}

// Задаю свойства нескольким экземплярам Спорткаров и Грузовиков
var firstCar = SportCa(
    carBrand: "Ferrary",
    carModel: "Enzo",
    carColor: "Желтый",
    yearOfProduction: 2020,
    engineState: .stop,
    windowsState: .close,
    trunkState: .empty,
    trunkVolume: 100)

var nextCar = SportCa(
    carBrand: "Porshe",
    carModel: "911",
    carColor: "Синий",
    yearOfProduction: 2020,
    engineState: .start,
    windowsState: .open,
    trunkState: .empty,
    trunkVolume: 150 )

var firstTruck = TrunkCar(
    carBrand: "Freeghtliner",
    carModel: "FLD",
    carColor: "Черный",
    yearOfProduction: 2005,
    engineState: .stop,
    windowsState: .close,
    trunkState: .empty,
    trunkVolume: 90000)

var nextTruck = TrunkCar(
    carBrand: "Kenworth",
    carModel: "W900",
    carColor: "Желтый",
    yearOfProduction: 1961,
    engineState: .start,
    windowsState: .open,
    trunkState: .full,
    trunkVolume: 100000)

//Вывожу в консоль значения свойств и меняю некоторые свойства
print("Год выпуска \(firstCar.carBrand) \(firstCar.carModel): \(firstCar.yearOfProduction) год")
print("Цвет \(firstCar.carBrand) \(firstCar.carModel): \(firstCar.carColor)")
firstCar.engineState = .start
firstCar.windowsState = .close
firstCar.trunkVolume = 60
firstCar.changeColor(color: "Красный")

print("---------------------------------------------")

print("Год выпуска \(nextCar.carBrand) \(nextCar.carModel): \(nextCar.yearOfProduction) год")
print("Цвет \(nextCar.carBrand) \(nextCar.carModel): \(nextCar.carColor)")
nextCar.engineState = .stop
nextCar.windowsState = .close
nextCar.trunkVolume = 160
nextCar.changeColor(color: "Желтый")

print("---------------------------------------------")

print("Год выпуска \(firstTruck.carBrand) \(firstTruck.carModel): \(firstTruck.yearOfProduction) год")
print("Цвет \(firstTruck.carBrand) \(firstTruck.carModel): \(firstTruck.carColor)")
firstTruck.engineState = .start
firstTruck.windowsState = .open
firstTruck.trunkVolume = 40000
firstTruck.changeColor(color: "Зеленый")

print("---------------------------------------------")

print("Год выпуска \(nextTruck.carBrand) \(nextTruck.carModel): \(nextTruck.yearOfProduction) год")
print("Цвет \(nextTruck.carBrand) \(nextTruck.carModel): \(nextTruck.carColor)")
nextTruck.engineState = .stop
nextTruck.windowsState = .close
nextTruck.trunkVolume = 150000
nextTruck.changeColor(color: "Синий")
