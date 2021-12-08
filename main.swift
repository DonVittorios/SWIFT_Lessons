//
//  main.swift
//  DZ4_Victor_Denisov
//
//  Created by Виктор on 03.12.2021.
//

import Foundation

print("Решение Заданий № 1 - 6:")

// Создал перечисления
enum EngineState {
    case start
    case stop
}

enum WindowsState {
    case open
    case close
}

enum TrunkState {
    case full
    case empty
}
enum TransmissionСondition {
    enum AT {
        case parking
        case revers
        case neutral
        case drive
        case sport
    }
    enum MT {
        case first
        case second
        case third
        case fourth
        case fifth
        case revers
        case neutral
    }
}
enum NeonIllumination {
    case constantIllumination
    case flashingBacklight
    case off
}
enum TypeOfSemitrailer {
    case awning
    case refrigerator
    case onboard
    case container
    case trucksDump
    case truck
    case tank
}

// Создал родительский класс
class CarClass {
    let carBrand: String
    let carModel: String
    let yearOfProduction: Int
    var carColor: String
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
    func changeColor(color: String) {
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
    init(carBrand: String,
         carModel: String,
         carColor: String,
         yearOfProduction: Int,
         engineState: EngineState,
         windowsState: WindowsState) {
        self.carBrand = carBrand
        self.carModel = carModel
        self.carColor = carColor
        self.yearOfProduction = yearOfProduction
        self.engineState = engineState
        self.windowsState = windowsState
    }
}

// Создал класс с характеристиками для спорткара
class SportCar: CarClass {
    var trunkState: TrunkState
    var neonIllumination: NeonIllumination
    var trunkVolume: Int {
        willSet {
            if  (trunkState == .empty), (trunkVolume > 0), (trunkVolume != 0), (newValue < trunkVolume) {
                let space = trunkVolume - newValue
                print("В багажнике \(carBrand) осталось свободного места: \(space) килограмм")
            } else {
                print ("Данный объем не поместится в \(carBrand), т.к. багажник полный.")
            }
        }
    }
    var transmissionСondition: TransmissionСondition.AT {
        willSet {
            if newValue == .drive {
                print("Коробка передач в режиме: Drive")
            } else if newValue == .neutral {
                print("Коробка передач в режиме: Neutral")
            } else if newValue == .parking {
                print("Коробка передач в режиме: Parking")
            } else if newValue == .revers {
                print("Коробка передач в режиме: Revers")
            } else if newValue == .sport {
                print("Коробка передач в режиме: Sport")
            }
        }
    }
    func backlightControl() {
        if neonIllumination == .constantIllumination {
            print("В \(carBrand) \(carModel) включена неоновая подсветка")
        } else if neonIllumination == .flashingBacklight {
            print("В \(carBrand) \(carModel) включена мигающая неоновая подсветка")
        } else {
            print("В \(carBrand) \(carModel) неоновая подсветка выключена")
        }
    }
    func emptyTrunck() {
        trunkState = .empty
        print ("В багажнике \(carBrand) пусто.")
    }

    init(carBrand: String,
         carModel: String,
         carColor: String,
         yearOfProduction: Int,
         engineState: EngineState,
         windowsState: WindowsState,
         trunkState: TrunkState,
         trunkVolume: Int,
         transmissionСondition: TransmissionСondition.AT,
         neonIllumination: NeonIllumination) {
        self.trunkState = trunkState
        self.trunkVolume = trunkVolume
        self.transmissionСondition = transmissionСondition
        self.neonIllumination = neonIllumination
        super.init(carBrand: carBrand,
                   carModel: carModel,
                   carColor: carColor,
                   yearOfProduction: yearOfProduction,
                   engineState: engineState,
                   windowsState: windowsState)
    }
}

// Создал класс с характеристиками для Грузовика
class TrunkCar: CarClass {
    var trunkState: TrunkState
    var typeOfSemitrailer: TypeOfSemitrailer
    var trunkVolume: Int {
        willSet {
            if  (trunkState == .empty), (trunkVolume > 0), (trunkVolume != 0), (newValue < trunkVolume) {
                let space = trunkVolume - newValue
                print("В кузове \(carBrand) осталось свободного места: \(space) килограмм")
            } else {
                print ("Данный объем не поместится в \(carBrand), т.к. кузов полный.")
            }
        }
    }
    var transmissionСondition: TransmissionСondition.MT {
        willSet {
            if newValue == .first {
                print("Внимание включена 1-я передача!")
            } else if newValue == .second {
                print("Внимание включена 2-я передача!")
            } else if newValue == .third {
                print("Внимание включена 3-я передача!")
            } else if newValue == .fourth {
                print("Внимание включена 4-я передача!")
            } else if newValue == .fifth {
                print("Внимание включена 5-я передача!")
            } else if newValue == .revers {
                print("Внимание включена задняя передача!")
            } else if newValue == .neutral {
                print("Коробка передач в позиции: Нейтраль!")
            }
        }
    }
    func switchingTheTypeOfSemitrailer() {
        switch typeOfSemitrailer {
        case .awning:
            print("К \(carBrand) \(carModel) зацеплен тентовый полуприцеп.")
        case .container:
            print("К \(carBrand) \(carModel) зацеплен контейнеровоз.")
        case .onboard:
            print("К \(carBrand) \(carModel) зацеплен бортовой полуприцеп.")
        case .refrigerator:
            print("К \(carBrand) \(carModel) зацеплен рефрижератор.")
        case .tank:
            print("К \(carBrand) \(carModel) зацеплена цистерна.")
        case .truck:
            print("К \(carBrand) \(carModel) зацеплен трал.")
        case .trucksDump:
            print("К \(carBrand) \(carModel) зацеплен самосвал.")
        }
    }
    func emptyTrunck() {
        trunkState = .empty
        print ("В кузове \(carBrand) пусто.")
    }
    init(carBrand: String,
         carModel: String,
         carColor: String,
         yearOfProduction: Int,
         engineState: EngineState,
         windowsState: WindowsState,
         trunkState: TrunkState,
         trunkVolume: Int,
         transmissionСondition: TransmissionСondition.MT,
         typeOfSemitrailer: TypeOfSemitrailer) {
        self.trunkState = trunkState
        self.trunkVolume = trunkVolume
        self.transmissionСondition = transmissionСondition
        self.typeOfSemitrailer = typeOfSemitrailer
        super.init(carBrand: carBrand,
                   carModel: carModel,
                   carColor: carColor,
                   yearOfProduction: yearOfProduction,
                   engineState: engineState,
                   windowsState: windowsState)
    }
}

// Задаю свойства нескольким экземплярам Спорткаров и Грузовиков
var firstCar = SportCar(carBrand: "Ferrary",
                       carModel: "Enzo",
                       carColor: "Красный",
                       yearOfProduction: 2000,
                       engineState: EngineState.stop,
                       windowsState: WindowsState.close,
                       trunkState: TrunkState.full,
                       trunkVolume: 100,
                       transmissionСondition: TransmissionСondition.AT.neutral,
                       neonIllumination: .off)

var nextCar = SportCar(carBrand: "Porshe",
                      carModel: "911",
                      carColor: "Синий",
                      yearOfProduction: 2020,
                      engineState: EngineState.start,
                      windowsState: WindowsState.open,
                      trunkState: TrunkState.empty,
                      trunkVolume: 150,
                      transmissionСondition: TransmissionСondition.AT.parking,
                      neonIllumination: .flashingBacklight)

var firstTruck = TrunkCar(carBrand: "Freeghtliner",
                          carModel: "FLD",
                          carColor: "Черный",
                          yearOfProduction: 2005,
                          engineState: EngineState.stop,
                          windowsState: WindowsState.close,
                          trunkState: TrunkState.empty,
                          trunkVolume: 90000,
                          transmissionСondition: TransmissionСondition.MT.neutral,
                          typeOfSemitrailer: TypeOfSemitrailer.refrigerator)

var nextTruck = TrunkCar(carBrand: "Kenworth",
                         carModel: "W900",
                         carColor: "Желтый",
                         yearOfProduction: 1961,
                         engineState: EngineState.start,
                         windowsState: WindowsState.open,
                         trunkState: TrunkState.full,
                         trunkVolume: 100000,
                         transmissionСondition: TransmissionСondition.MT.first,
                         typeOfSemitrailer: TypeOfSemitrailer.tank)

//Вывожу в консоль значения свойств и меняю некоторые свойства
print("Год выпуска \(firstCar.carBrand) \(firstCar.carModel): \(firstCar.yearOfProduction) год")
print("Цвет \(firstCar.carBrand) \(firstCar.carModel): \(firstCar.carColor)")
firstCar.engineState = .start
firstCar.windowsState = .close
firstCar.trunkVolume = 60
firstCar.changeColor(color: "Красный")
firstCar.transmissionСondition = .parking
firstCar.backlightControl()

print("---------------------------------------------")

print("Год выпуска \(nextCar.carBrand) \(nextCar.carModel): \(nextCar.yearOfProduction) год")
print("Цвет \(nextCar.carBrand) \(nextCar.carModel): \(nextCar.carColor)")
nextCar.engineState = .stop
nextCar.windowsState = .close
nextCar.trunkVolume = 160
nextCar.changeColor(color: "Желтый")
nextCar.transmissionСondition = .drive
nextCar.backlightControl()

print("---------------------------------------------")

print("Год выпуска \(firstTruck.carBrand) \(firstTruck.carModel): \(firstTruck.yearOfProduction) год")
print("Цвет \(firstTruck.carBrand) \(firstTruck.carModel): \(firstTruck.carColor)")
firstTruck.engineState = .start
firstTruck.windowsState = .open
firstTruck.trunkVolume = 40000
firstTruck.changeColor(color: "Зеленый")
firstTruck.transmissionСondition = .first
firstTruck.switchingTheTypeOfSemitrailer()

print("---------------------------------------------")

print("Год выпуска \(nextTruck.carBrand) \(nextTruck.carModel): \(nextTruck.yearOfProduction) год")
print("Цвет \(nextTruck.carBrand) \(nextTruck.carModel): \(nextTruck.carColor)")
nextTruck.engineState = .stop
nextTruck.windowsState = .close
nextTruck.trunkVolume = 150000
nextTruck.changeColor(color: "Синий")
nextTruck.transmissionСondition = .neutral
nextTruck.switchingTheTypeOfSemitrailer()
