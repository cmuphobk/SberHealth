//
//  SHFoundation.swift
//  SHFoundation
//
//  Created by docdoc on 24.10.2022.
//

import UIKit

public enum SHFoundation {
    public enum Environment {
        case develop, production
    }

    private static var _environment: Environment?
    public static var environment: Environment {
        guard let environment = _environment else {
            assertionFailure("Environment must be initiated before using!")
            return .production
        }
        return environment
    }
    public static func initialize(environment: Environment) {
        _environment = environment
    }
}
