//
//  protocols.swift
//  DZ5_Victor_Denisov
//
//  Created by Виктор on 11.12.2021.
//

import Foundation

// MARK: - Create protocol
protocol CarProtocol {
    var carBrand: String { get }
    var carModel: String { get }
    var yearOfProduction: Int { get }
    var carColor: String { get set }
    mutating func windowsState(windows: WindowsState)
    mutating func changeColor(color: String)
    mutating func engineState(engine: EngineState)
}

// MARK: - Create extension for CarProtocol
extension CarProtocol {
    mutating func windowsState(windows: WindowsState) {
        if windows == .open {
            print("Окна автомобиля \(carBrand) открыты.")
        } else {
            print("Окна автомобиля \(carBrand) закрыты.")
        }
    }
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
    mutating func engineState(engine: EngineState) {
        if engine == .start {
            print("Двигатель \(carBrand) запущен.")
        } else {
            print("Двигатель \(carBrand) заглушен.")
        }
    }
}
