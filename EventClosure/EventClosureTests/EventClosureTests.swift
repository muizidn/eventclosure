//
//  EventClosureTests.swift
//  EventClosureTests
//
//  Created by PondokIOS on 30/03/19.
//  Copyright © 2019 PondokIT. All rights reserved.
//

import XCTest
@testable import EventClosure

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let viewController = ViewController()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let window = UIWindow()
        window.rootViewController = viewController
        self.window = window
        return true
    }
}

class ViewController: UIViewController {
    let control = UIControl()
}

class EventClosureTests: XCTestCase {
    
    private
    var control: UIControl!
    
    override func setUp() {
        super.setUp()
        control = UIControl()
    }
    
    override func tearDown() {
        control = nil
        super.tearDown()
    }
    
    private
    func onEventInvoked(for event: UIControl.Event, file: StaticString = #file, line: UInt = #line) {
        setUp()
        defer { tearDown() }
        
        var value = 0
        event.onEvent(control: control) {
            value += 1
        }
        for _ in 1...10 {
            control.sendActions(for: event)
        }
        XCTAssertEqual(value, 10, file: file, line: line)
    }
    
    private
    func onEventAdded(for event: UIControl.Event, file: StaticString = #file, line: UInt = #line) {
        setUp()
        defer { tearDown() }
        
        guard control.actionsCount == 0 else {
            fatalError(
            )
        }
        for i in 1...100 {
            event.onEvent(control: control, completion: { })
            guard control.actionsCount == i else {
                fatalError("\(control.actionsCount) != \(i)")
            }
        }
        XCTAssertEqual(control.actionsCount, 100, file: file, line: line)
    }
    
    private
    func onEventReturnDifferentAction(for event: UIControl.Event, file: StaticString = #file, line: UInt = #line) {
        setUp()
        defer { tearDown() }
        
        let action1 = event.onEvent(control: control, completion: { })
        let action2 = event.onEvent(control: control, completion: { })
        XCTAssertTrue(!action1.isEqual(action2) && action1 != action2, "\(action1) must be different with \(action2)")
    }
    
    private
    func eventRemoved(for event: UIControl.Event, file: StaticString = #file, line: UInt = #line) {
        setUp()
        defer { tearDown() }
        
        let action = event.onEvent(control: control, completion: { })
        let isRemoved = event.removeEvent(control: control, action: action)
        XCTAssertTrue(isRemoved, "\(action) not removed")
    }
    
    private
    func eventNotInvokedAfterRemoved(for event: UIControl.Event, file: StaticString = #file, line: UInt = #line) {
        setUp()
        defer { tearDown() }
        
        var value = 10
        let action = event.onEvent(control: control) {
            value -= 1
        }
        while value > 3 {
            control.sendActions(for: event)
        }
        event.removeEvent(
            control: control,
            action: action
        )
        control.sendActions(for: event)
        XCTAssertEqual(value, 3, "Event not removed, expected \(3) returned \(value)",file: file, line: line)
    }
    
    func testDifferentActionTypeMustNotEqual() {
        let actionVoid = Action(action: {_ in } , input: ())
        let actionInt = Action(action: {_ in}, input: 0)
        XCTAssertNotEqual(actionVoid, actionInt)
    }
    
    func testTouchDown() {
        onEventInvoked(for: .touchDown)
        onEventAdded(for: .touchDown)
        onEventReturnDifferentAction(for: .touchDown)
        eventNotInvokedAfterRemoved(for: .touchDown)
        eventRemoved(for: .touchDown)
    }
    
    func testTouchDownRepeat() {
        onEventInvoked(for: .touchDownRepeat)
        onEventAdded(for: .touchDownRepeat)
        onEventReturnDifferentAction(for: .touchDownRepeat)
        eventNotInvokedAfterRemoved(for: .touchDownRepeat)
        eventRemoved(for: .touchDownRepeat)
    }
    
    func testTouchDragInside() {
        onEventInvoked(for: .touchDragInside)
        onEventAdded(for: .touchDragInside)
        onEventReturnDifferentAction(for: .touchDragInside)
        eventNotInvokedAfterRemoved(for: .touchDragInside)
        eventRemoved(for: .touchDragInside)
    }
    
    func testTouchDragOutside() {
        onEventInvoked(for: .touchDragOutside)
        onEventAdded(for: .touchDragOutside)
        onEventReturnDifferentAction(for: .touchDragOutside)
        eventNotInvokedAfterRemoved(for: .touchDragOutside)
        eventRemoved(for: .touchDragOutside)
    }
    
    func testTouchDragEnter() {
        onEventInvoked(for: .touchDragEnter)
        onEventAdded(for: .touchDragEnter)
        onEventReturnDifferentAction(for: .touchDragEnter)
        eventNotInvokedAfterRemoved(for: .touchDragEnter)
        eventRemoved(for: .touchDragEnter)
    }
    
    func testTouchDragExit() {
        onEventInvoked(for: .touchDragExit)
        onEventAdded(for: .touchDragExit)
        onEventReturnDifferentAction(for: .touchDragExit)
        eventNotInvokedAfterRemoved(for: .touchDragExit)
        eventRemoved(for: .touchDragExit)
    }
    
    func testTouchUpInside() {
        onEventInvoked(for: .touchUpInside)
        onEventAdded(for: .touchUpInside)
        onEventReturnDifferentAction(for: .touchUpInside)
        eventNotInvokedAfterRemoved(for: .touchUpInside)
        eventRemoved(for: .touchUpInside)
    }
    
    func testTouchUpOutside() {
        onEventInvoked(for: .touchUpOutside)
        onEventAdded(for: .touchUpOutside)
        onEventReturnDifferentAction(for: .touchUpOutside)
        eventNotInvokedAfterRemoved(for: .touchUpOutside)
        eventRemoved(for: .touchUpOutside)
    }
    
    func testTouchCancel() {
        onEventInvoked(for: .touchCancel)
        onEventAdded(for: .touchCancel)
        onEventReturnDifferentAction(for: .touchCancel)
        eventNotInvokedAfterRemoved(for: .touchCancel)
        eventRemoved(for: .touchCancel)
    }
    
    
    func testValueChanged() {
        onEventInvoked(for: .valueChanged)
        onEventAdded(for: .valueChanged)
        onEventReturnDifferentAction(for: .valueChanged)
        eventNotInvokedAfterRemoved(for: .valueChanged)
        eventRemoved(for: .valueChanged)
    }
    
    func testPrimaryActionTriggered() {
        onEventInvoked(for: .primaryActionTriggered)
        onEventAdded(for: .primaryActionTriggered)
        onEventReturnDifferentAction(for: .primaryActionTriggered)
        eventNotInvokedAfterRemoved(for: .primaryActionTriggered)
        eventRemoved(for: .primaryActionTriggered)
    }
    
    
    func testEditingDidBegin() {
        onEventInvoked(for: .editingDidBegin)
        onEventAdded(for: .editingDidBegin)
        onEventReturnDifferentAction(for: .editingDidBegin)
        eventNotInvokedAfterRemoved(for: .editingDidBegin)
        eventRemoved(for: .editingDidBegin)
    }
    
    func testEditingChanged() {
        onEventInvoked(for: .editingChanged)
        onEventAdded(for: .editingChanged)
        onEventReturnDifferentAction(for: .editingChanged)
        eventNotInvokedAfterRemoved(for: .editingChanged)
        eventRemoved(for: .editingChanged)
    }
    
    func testEditingDidEnd() {
        onEventInvoked(for: .editingDidEnd)
        onEventAdded(for: .editingDidEnd)
        onEventReturnDifferentAction(for: .editingDidEnd)
        eventNotInvokedAfterRemoved(for: .editingDidEnd)
        eventRemoved(for: .editingDidEnd)
    }
    
    func testEditingDidEndOnExit() {
        onEventInvoked(for: .editingDidEndOnExit)
        onEventAdded(for: .editingDidEndOnExit)
        onEventReturnDifferentAction(for: .editingDidEndOnExit)
        eventNotInvokedAfterRemoved(for: .editingDidEndOnExit)
        eventRemoved(for: .editingDidEndOnExit)
    }
    
    
    func testAllTouchEvents() {
        onEventInvoked(for: .allTouchEvents)
        onEventAdded(for: .allTouchEvents)
        onEventReturnDifferentAction(for: .allTouchEvents)
        eventNotInvokedAfterRemoved(for: .allTouchEvents)
        eventRemoved(for: .allTouchEvents)
    }
    
    func testAllEditingEvents() {
        onEventInvoked(for: .allEditingEvents)
        onEventAdded(for: .allEditingEvents)
        onEventReturnDifferentAction(for: .allEditingEvents)
        eventNotInvokedAfterRemoved(for: .allEditingEvents)
        eventRemoved(for: .allEditingEvents)
    }
    
    func testApplicationReserved() {
        onEventInvoked(for: .applicationReserved)
        onEventAdded(for: .applicationReserved)
        onEventReturnDifferentAction(for: .applicationReserved)
        eventNotInvokedAfterRemoved(for: .applicationReserved)
        eventRemoved(for: .applicationReserved)
    }
    
    func testSystemReserved() {
        onEventInvoked(for: .systemReserved)
        onEventAdded(for: .systemReserved)
        onEventReturnDifferentAction(for: .systemReserved)
        eventNotInvokedAfterRemoved(for: .systemReserved)
        eventRemoved(for: .systemReserved)
    }
    
    func testAllEvents() {
        onEventInvoked(for: .allEvents)
        onEventAdded(for: .allEvents)
        onEventReturnDifferentAction(for: .allEvents)
        eventNotInvokedAfterRemoved(for: .allEvents)
        eventRemoved(for: .allEvents)
    }   
}
