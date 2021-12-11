//
//  main.swift
//  DZ6_Victor_Denisov
//
//  Created by Виктор on 11.12.2021.
//

import Foundation

// MARK: - enumirates
enum TypeCars {
    case passenger
    case bus
    case cargo
    case longCargo
}

// MARK: - protocols
protocol NumberOfCars {
    var numberOfCar: Int { get set }
}

// MARK: - structures
struct ParkingSpace: NumberOfCars {
    var typeCars: TypeCars
    var numberOfCar: Int
}

extension ParkingSpace: CustomStringConvertible {
    var description: String {
        return "Количество занятых парковочных мест для автомобилей типа \(typeCars) занято \(numberOfCar) шт.\n"
    }
}

struct CarQueue<T: NumberOfCars> {
    private var cars: [T] = []
    var numberOfCarsInTheParkingLot: Int {
        var numberOfCar = 0
        for car in cars {
            numberOfCar += car.numberOfCar
        }
        return numberOfCar
    }
    mutating func appCar (car: T) {
        cars.append(car)
    }
    mutating func removeCar () -> T? {
        cars.removeLast()
    }
    subscript (cars: Int ...) -> Int{
            var numberOfCar = 0
            for index in cars where index < self.cars.count {
                numberOfCar += self.cars[index].numberOfCar
            }
            return numberOfCar
        }
}
extension CarQueue{
    func filtred(meaning: (T) -> Bool) -> [T] {
        var myCars = [T]()
        for car in cars {
            if meaning(car){
                myCars.append(car)
            }
        }
        return myCars
    }
}
// MARK: - values and output to the console
var parkingPlace = CarQueue<ParkingSpace>()

parkingPlace.appCar(car: ParkingSpace(typeCars: TypeCars.passenger, numberOfCar: 1))
parkingPlace.appCar(car: ParkingSpace(typeCars: TypeCars.bus, numberOfCar: 2))
parkingPlace.appCar(car: ParkingSpace(typeCars: TypeCars.cargo, numberOfCar: 3))
parkingPlace.appCar(car: ParkingSpace(typeCars: TypeCars.longCargo, numberOfCar: 4))


parkingPlace [0, 1, 2, 3]
let nuberOfPlace = parkingPlace.filtred(meaning: {$0.numberOfCar > 2})
print(nuberOfPlace)
print("Количество занятых парковочных мест всего: \(parkingPlace.numberOfCarsInTheParkingLot) шт.")
