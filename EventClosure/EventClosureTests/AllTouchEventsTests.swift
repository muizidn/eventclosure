////  AllTouchEventsTests.swift
//  EventClosureTests
//
//  Created by PondokIOS on 27/03/19.
//  Copyright © 2019 PondokIT. All rights reserved.
//

import XCTest
@testable import EventClosure

class AllTouchEventsTests: BaseEventTests {
    
    override var event: UIControl.Event {
        return .allTouchEvents
    }
    
    func testOnEvent() {
        var value = 0
        event.onEvent(control: control) {
            value += 1
        }
        for _ in 1...10 {
            controlSendActions()
        }
        XCTAssertEqual(value, 10 )
    }
    
    func testRemoveEvent() {
        var value = 10
        let action = event.onEvent(control: control) {
            value -= 1
        }
        while value > 3 {
            controlSendActions()
        }
        let isRemoved = event.removeEvent(
            control: control,
            action: action
        )
        controlSendActions()
        XCTAssertEqual(value, 3)
        XCTAssertTrue(isRemoved)
    }
}
