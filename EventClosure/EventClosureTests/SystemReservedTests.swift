////  SystemReservedTests.swift
//  EventClosureTests
//
//  Created by PondokIOS on 27/03/19.
//  Copyright © 2019 PondokIT. All rights reserved.
//

import XCTest
@testable import EventClosure

class SystemReservedTests: BaseEventTests {
    
    override var event: UIControl.Event {
        return .systemReserved
    }
    
    func testOnEvent() {
        var value = 0
        control.onSystemReserved {
            value += 1
        }
        for _ in 1...10 {
            controlSendActions()
        }
        XCTAssertEqual(value, 10 )
    }
    func testRemoveEvent() { }    
}
