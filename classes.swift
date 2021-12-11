//
//  classes.swift
//  DZ5_Victor_Denisov
//
//  Created by Виктор on 11.12.2021.
//

import Foundation

// MARK: - Create classes
class CarClass: CarProtocol {
    var carBrand: String
    var carModel: String
    var yearOfProduction: Int
    var carColor: String
    init(carBrand: String,
         carModel: String,
         carColor: String,
         yearOfProduction: Int) {
        self.carBrand = carBrand
        self.carModel = carModel
        self.carColor = carColor
        self.yearOfProduction = yearOfProduction
    }
}

// MARK: - Create class SportCar
final class SportCar: CarClass {
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
         trunkVolume: Int,
         transmissionСondition: TransmissionСondition.AT,
         neonIllumination: NeonIllumination,
         trunkState: TrunkState) {
        self.trunkVolume = trunkVolume
        self.transmissionСondition = transmissionСondition
        self.neonIllumination = neonIllumination
        self.trunkState = trunkState
        super.init(carBrand: carBrand,
                   carModel: carModel,
                   carColor: carColor,
                   yearOfProduction: yearOfProduction)
    }
}

// MARK: - Extention for SportCar
extension SportCar: CustomStringConvertible {

    var description: String {
        return "Автомобиль \(carBrand) \(carModel) цвета \(carColor) произведен в \(yearOfProduction)\n"
    }
}

// MARK: - create class TrunkCar
final class TrunkCar: CarClass {
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
         trunkVolume: Int,
         transmissionСondition: TransmissionСondition.MT,
         typeOfSemitrailer: TypeOfSemitrailer,
         trunkState: TrunkState) {
        self.trunkVolume = trunkVolume
        self.transmissionСondition = transmissionСondition
        self.typeOfSemitrailer = typeOfSemitrailer
        self.trunkState = trunkState
        super.init(carBrand: carBrand,
                   carModel: carModel,
                   carColor: carColor,
                   yearOfProduction: yearOfProduction)
    }
}

// MARK: - Extention for TrunkCar
extension TrunkCar: CustomStringConvertible {

    var description: String {
        return "Автомобиль \(carBrand) \(carModel) цвета \(carColor) произведен в \(yearOfProduction)\n"
    }
}
