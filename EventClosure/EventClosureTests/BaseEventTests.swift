//
//  BaseEventTests.swift
//  EventClosureTests
//
//  Created by PondokIOS on 30/03/19.
//  Copyright © 2019 PondokIT. All rights reserved.
//

import XCTest

class BaseEventTests: XCTestCase {
    private(set) var control: UIControl!
    
    /// default .allEvents
    var event: UIControl.Event {
        return UIControl.Event.allEvents
    }
    
    override func setUp() {
        super.setUp()
        control = UIControl()
    }
    
    override func tearDown() {
        control = nil
        super.tearDown()
    }
    
    func controlSendActions() {
        control.sendActions(for: event)
    }
}
