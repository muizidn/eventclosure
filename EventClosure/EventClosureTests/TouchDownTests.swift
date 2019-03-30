////  TouchDownTests.swift
//  EventClosureTests
//
//  Created by PondokIOS on 27/03/19.
//  Copyright © 2019 PondokIT. All rights reserved.
//

import XCTest
@testable import EventClosure

class TouchDownTests: EventClosureTests {
    
    func testA() {
        onEventInvoked(for: .touchDown)
    }
}
