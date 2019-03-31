//
//  main.swift
//  Example
//
//  Created by PondokIOS on 31/03/19.
//  Copyright © 2019 PondokIT. All rights reserved.
//

import UIKit

func getArgc() -> Int32 {
    return CommandLine.argc
}

func getArgv() -> UnsafeMutablePointer<UnsafeMutablePointer<Int8>?> {
    return CommandLine.unsafeArgv
}

UIApplicationMain(getArgc(), getArgv(), nil, NSStringFromClass(AppDelegate.self))
