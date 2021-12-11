//
//  main.swift
//  DZ5_Victor_Denisov
//
//  Created by Виктор on 11.12.2021.
//

import Foundation

// MARK: - Set properties for class instances
var firstCar = SportCar(carBrand: "Ferrary",
                        carModel: "Enzo",
                        carColor: "Красный",
                        yearOfProduction: 2000,
                        engineState: EngineState.stop,
                        windowsState: WindowsState.close,
                        trunkVolume: 100,
                        transmissionСondition: TransmissionСondition.AT.neutral,
                        neonIllumination: .off,
                        trunkState: TrunkState.empty)

var nextCar = SportCar(carBrand: "Porshe",
                       carModel: "911",
                       carColor: "Синий",
                       yearOfProduction: 2020,
                       engineState: EngineState.start,
                       windowsState: WindowsState.open,
                       trunkVolume: 150,
                       transmissionСondition: TransmissionСondition.AT.parking,
                       neonIllumination: .flashingBacklight,
                       trunkState: TrunkState.full)

var firstTruck = TrunkCar(carBrand: "Freeghtliner",
                          carModel: "FLD",
                          carColor: "Черный",
                          yearOfProduction: 2005,
                          engineState: EngineState.stop,
                          windowsState: WindowsState.close,
                          trunkVolume: 90000,
                          transmissionСondition: TransmissionСondition.MT.neutral,
                          typeOfSemitrailer: TypeOfSemitrailer.refrigerator,
                          trunkState: TrunkState.empty)

var nextTruck = TrunkCar(carBrand: "Kenworth",
                         carModel: "W900",
                         carColor: "Желтый",
                         yearOfProduction: 1961,
                         engineState: EngineState.start,
                         windowsState: WindowsState.open,
                         trunkVolume: 100000,
                         transmissionСondition: TransmissionСondition.MT.first,
                         typeOfSemitrailer: TypeOfSemitrailer.tank,
                         trunkState: TrunkState.full)

// MARK: - Output property values to the console and changed some properties
print("Год выпуска \(firstCar.carBrand) \(firstCar.carModel): \(firstCar.yearOfProduction) год")
print("Цвет \(firstCar.carBrand) \(firstCar.carModel): \(firstCar.carColor)")
firstCar.engineState(engine: EngineState.start)
firstCar.windowsState(windows: WindowsState.open)
firstCar.trunkVolume = 60
firstCar.changeColor(color: "Красный")
firstCar.transmissionСondition = .parking
firstCar.backlightControl()

print("---------------------------------------------")

print("Год выпуска \(nextCar.carBrand) \(nextCar.carModel): \(nextCar.yearOfProduction) год")
print("Цвет \(nextCar.carBrand) \(nextCar.carModel): \(nextCar.carColor)")
nextCar.engineState(engine: EngineState.stop)
nextCar.windowsState(windows: WindowsState.close)
nextCar.trunkVolume = 160
nextCar.changeColor(color: "Желтый")
nextCar.transmissionСondition = .drive
nextCar.backlightControl()

print("---------------------------------------------")

print("Год выпуска \(firstTruck.carBrand) \(firstTruck.carModel): \(firstTruck.yearOfProduction) год")
print("Цвет \(firstTruck.carBrand) \(firstTruck.carModel): \(firstTruck.carColor)")
firstTruck.engineState(engine: EngineState.start)
firstTruck.windowsState(windows: WindowsState.open)
firstTruck.trunkVolume = 40000
firstTruck.changeColor(color: "Зеленый")
firstTruck.transmissionСondition = .first
firstTruck.switchingTheTypeOfSemitrailer()

print("---------------------------------------------")

print("Год выпуска \(nextTruck.carBrand) \(nextTruck.carModel): \(nextTruck.yearOfProduction) год")
print("Цвет \(nextTruck.carBrand) \(nextTruck.carModel): \(nextTruck.carColor)")
nextTruck.engineState(engine: EngineState.stop)
nextTruck.windowsState(windows: WindowsState.close)
nextTruck.trunkVolume = 150000
nextTruck.changeColor(color: "Синий")
nextTruck.transmissionСondition = .neutral
nextTruck.switchingTheTypeOfSemitrailer()

