//
//  enums.swift
//  DZ5_Victor_Denisov
//
//  Created by Виктор on 11.12.2021.
//

import Foundation

// MARK: - Create enumeration
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
