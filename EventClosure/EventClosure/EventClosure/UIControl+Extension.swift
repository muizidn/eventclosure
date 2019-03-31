//
//  UIControl+Extension.swift
//  EventClosure
//
//  Created by PondokIOS on 27/03/19.
//  Copyright © 2019 PondokIT. All rights reserved.
//

import UIKit

fileprivate var ActionKey: UInt8 = 0

/// Typealias for () -> Void
typealias VoidCallback = () -> Void

extension UIControl {
    private var _actionVoids: Set<ActionVoid> {
        get {
            if let value = objc_getAssociatedObject(self, &ActionKey) as? Set<ActionVoid> {
                return value
            }
            return []
        }
        set {
            objc_setAssociatedObject(self, &ActionKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    /// The number of actions associated to receiver
    public var actionsCount: Int {
        return _actionVoids.count
    }
    
    @discardableResult
    private func on(_ event: ActionEvent<VoidCallback>) -> ActionVoid {
        let action = Action(action: event.value, input: ())
        addTarget(action, action: action.selector, for: event.type)
        defer { _actionVoids.insert(action) }
        return action
    }
    
    @discardableResult
    private func remove(_ event: ActionEvent<ActionVoid>) -> Bool {
        let action = event.value
        removeTarget(action, action: action.selector, for: event.type)
        return _actionVoids.remove(action) != nil
    }
}

public extension UIControl {
    /// Replacement for addTarget(_:action:for: .touchDown)
    ///
    /// - Parameter closure: closure to be invoked
    /// - Returns: Action<Void> object contains closure
    @discardableResult
    func onTouchDown(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.touchDown(closure))
    }
    
    /// Replacement for addTarget(_:action:for: .touchDownRepeat)
    ///
    /// - Parameter closure: closure to be invoked
    /// - Returns: Action<Void> object contains closure
    @discardableResult
    func onTouchDownRepeat(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.touchDownRepeat(closure))
    }
    
    /// Replacement for addTarget(_:action:for: .touchDragInside)
    ///
    /// - Parameter closure: closure to be invoked
    /// - Returns: Action<Void> object contains closure
    @discardableResult
    func onTouchDragInside(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.touchDragInside(closure))
    }
    
    /// Replacement for addTarget(_:action:for: .touchDragOutside)
    ///
    /// - Parameter closure: closure to be invoked
    /// - Returns: Action<Void> object contains closure
    @discardableResult
    func onTouchDragOutside(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.touchDragOutside(closure))
    }
    
    /// Replacement for addTarget(_:action:for: .touchDragEnter)
    ///
    /// - Parameter closure: closure to be invoked
    /// - Returns: Action<Void> object contains closure
    @discardableResult
    func onTouchDragEnter(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.touchDragEnter(closure))
    }
    
    /// Replacement for addTarget(_:action:for: .touchDragExit)
    ///
    /// - Parameter closure: closure to be invoked
    /// - Returns: Action<Void> object contains closure
    @discardableResult
    func onTouchDragExit(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.touchDragExit(closure))
    }
    
    /// Replacement for addTarget(_:action:for: .touchUpInside)
    ///
    /// - Parameter closure: closure to be invoked
    /// - Returns: Action<Void> object contains closure
    @discardableResult
    func onTouchUpInside(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.touchUpInside(closure))
    }
    
    /// Replacement for addTarget(_:action:for: .touchUpOutside)
    ///
    /// - Parameter closure: closure to be invoked
    /// - Returns: Action<Void> object contains closure
    @discardableResult
    func onTouchUpOutside(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.touchUpOutside(closure))
    }
    
    /// Replacement for addTarget(_:action:for: .touchCancel)
    ///
    /// - Parameter closure: closure to be invoked
    /// - Returns: Action<Void> object contains closure
    @discardableResult
    func onTouchCancel(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.touchCancel(closure))
    }
    
    
    /// Replacement for addTarget(_:action:for: .valueChanged)
    ///
    /// - Parameter closure: closure to be invoked
    /// - Returns: Action<Void> object contains closure
    @discardableResult
    func onValueChanged(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.valueChanged(closure))
    }
    
    /// Replacement for addTarget(_:action:for: .primaryActionTriggered)
    ///
    /// - Parameter closure: closure to be invoked
    /// - Returns: Action<Void> object contains closure
    @available(iOS 9.0, *)
    @discardableResult
    func onPrimaryActionTriggered(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.primaryActionTriggered(closure))
    }
    
    /// Replacement for addTarget(_:action:for: .editingDidBegin)
    ///
    /// - Parameter closure: closure to be invoked
    /// - Returns: Action<Void> object contains closure
    @discardableResult
    func onEditingDidBegin(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.editingDidBegin(closure))
    }
    
    /// Replacement for addTarget(_:action:for: .editingChanged)
    ///
    /// - Parameter closure: closure to be invoked
    /// - Returns: Action<Void> object contains closure
    @discardableResult
    func onEditingChanged(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.editingChanged(closure))
    }
    
    /// Replacement for addTarget(_:action:for: .editingDidEnd)
    ///
    /// - Parameter closure: closure to be invoked
    /// - Returns: Action<Void> object contains closure
    @discardableResult
    func onEditingDidEnd(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.editingDidEnd(closure))
    }
    
    /// Replacement for addTarget(_:action:for: .editingDidEndOnExit)
    ///
    /// - Parameter closure: closure to be invoked
    /// - Returns: Action<Void> object contains closure
    @discardableResult
    func onEditingDidEndOnExit(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.editingDidEndOnExit(closure))
    }
    
    
    /// Replacement for addTarget(_:action:for: .allTouchEvents)
    ///
    /// - Parameter closure: closure to be invoked
    /// - Returns: Action<Void> object contains closure
    @discardableResult
    func onAllTouchEvents(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.allTouchEvents(closure))
    }
    
    /// Replacement for addTarget(_:action:for: .allEditingEvents)
    ///
    /// - Parameter closure: closure to be invoked
    /// - Returns: Action<Void> object contains closure
    @discardableResult
    func onAllEditingEvents(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.allEditingEvents(closure))
    }
    
    /// Replacement for addTarget(_:action:for: .applicationReserved)
    ///
    /// - Parameter closure: closure to be invoked
    /// - Returns: Action<Void> object contains closure
    @discardableResult
    func onApplicationReserved(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.applicationReserved(closure))
    }
    
    /// Replacement for addTarget(_:action:for: .systemReserved)
    ///
    /// - Parameter closure: closure to be invoked
    /// - Returns: Action<Void> object contains closure
    @discardableResult
    func onSystemReserved(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.systemReserved(closure))
    }
    
    /// Replacement for addTarget(_:action:for: .allEvents)
    ///
    /// - Parameter closure: closure to be invoked
    /// - Returns: Action<Void> object contains closure
    @discardableResult
    func onAllEvents(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.allEvents(closure))
    }
}

extension UIControl {
    /// Replacement for removeTarget(_:action:for: .touchDown)
    ///
    /// - Parameter action: Action to be removed from receiver
    /// - Returns: Boolean indicating success removal
    @discardableResult
    func rmTouchDown(_ action: ActionVoid) -> Bool {
        return remove(.touchDown(action))
    }
    
    /// Replacement for removeTarget(_:action:for: .touchDownRepeat)
    ///
    /// - Parameter action: Action to be removed from receiver
    /// - Returns: Boolean indicating success removal
    @discardableResult
    func rmTouchDownRepeat(_ action: ActionVoid) -> Bool {
        return remove(.touchDownRepeat(action))
    }
    
    /// Replacement for removeTarget(_:action:for: .touchDragInside)
    ///
    /// - Parameter action: Action to be removed from receiver
    /// - Returns: Boolean indicating success removal
    @discardableResult
    func rmTouchDragInside(_ action: ActionVoid) -> Bool {
        return remove(.touchDragInside(action))
    }
    
    /// Replacement for removeTarget(_:action:for: .touchDragOutside)
    ///
    /// - Parameter action: Action to be removed from receiver
    /// - Returns: Boolean indicating success removal
    @discardableResult
    func rmTouchDragOutside(_ action: ActionVoid) -> Bool {
        return remove(.touchDragOutside(action))
    }
    
    /// Replacement for removeTarget(_:action:for: .touchDragEnter)
    ///
    /// - Parameter action: Action to be removed from receiver
    /// - Returns: Boolean indicating success removal
    @discardableResult
    func rmTouchDragEnter(_ action: ActionVoid) -> Bool {
        return remove(.touchDragEnter(action))
    }
    
    /// Replacement for removeTarget(_:action:for: .touchDragExit)
    ///
    /// - Parameter action: Action to be removed from receiver
    /// - Returns: Boolean indicating success removal
    @discardableResult
    func rmTouchDragExit(_ action: ActionVoid) -> Bool {
        return remove(.touchDragExit(action))
    }
    
    /// Replacement for removeTarget(_:action:for: .touchUpInside)
    ///
    /// - Parameter action: Action to be removed from receiver
    /// - Returns: Boolean indicating success removal
    @discardableResult
    func rmTouchUpInside(_ action: ActionVoid) -> Bool {
        return remove(.touchUpInside(action))
    }
    
    /// Replacement for removeTarget(_:action:for: .touchUpOutside)
    ///
    /// - Parameter action: Action to be removed from receiver
    /// - Returns: Boolean indicating success removal
    @discardableResult
    func rmTouchUpOutside(_ action: ActionVoid) -> Bool {
        return remove(.touchUpOutside(action))
    }
    
    /// Replacement for removeTarget(_:action:for: .touchCancel)
    ///
    /// - Parameter action: Action to be removed from receiver
    /// - Returns: Boolean indicating success removal
    @discardableResult
    func rmTouchCancel(_ action: ActionVoid) -> Bool {
        return remove(.touchCancel(action))
    }
    
    
    /// Replacement for removeTarget(_:action:for: .valueChanged)
    ///
    /// - Parameter action: Action to be removed from receiver
    /// - Returns: Boolean indicating success removal
    @discardableResult
    func rmValueChanged(_ action: ActionVoid) -> Bool {
        return remove(.valueChanged(action))
    }
    
    /// Replacement for removeTarget(_:action:for: .primaryActionTriggered)
    ///
    /// - Parameter action: Action to be removed from receiver
    /// - Returns: Boolean indicating success removal
    @available(iOS 9.0, *)
    @discardableResult
    func rmPrimaryActionTriggered(_ action: ActionVoid) -> Bool {
        return remove(.primaryActionTriggered(action))
    }
    
    /// Replacement for removeTarget(_:action:for: .editingDidBegin)
    ///
    /// - Parameter action: Action to be removed from receiver
    /// - Returns: Boolean indicating success removal
    @discardableResult
    func rmEditingDidBegin(_ action: ActionVoid) -> Bool {
        return remove(.editingDidBegin(action))
    }
    
    /// Replacement for removeTarget(_:action:for: .editingChanged)
    ///
    /// - Parameter action: Action to be removed from receiver
    /// - Returns: Boolean indicating success removal
    @discardableResult
    func rmEditingChanged(_ action: ActionVoid) -> Bool {
        return remove(.editingChanged(action))
    }
    
    /// Replacement for removeTarget(_:action:for: .editingDidEnd)
    ///
    /// - Parameter action: Action to be removed from receiver
    /// - Returns: Boolean indicating success removal
    @discardableResult
    func rmEditingDidEnd(_ action: ActionVoid) -> Bool {
        return remove(.editingDidEnd(action))
    }
    
    /// Replacement for removeTarget(_:action:for: .editingDidEndOnExit)
    ///
    /// - Parameter action: Action to be removed from receiver
    /// - Returns: Boolean indicating success removal
    @discardableResult
    func rmEditingDidEndOnExit(_ action: ActionVoid) -> Bool {
        return remove(.editingDidEndOnExit(action))
    }
    
    
    /// Replacement for removeTarget(_:action:for: .allTouchEvents)
    ///
    /// - Parameter action: Action to be removed from receiver
    /// - Returns: Boolean indicating success removal
    @discardableResult
    func rmAllTouchEvents(_ action: ActionVoid) -> Bool {
        return remove(.allTouchEvents(action))
    }
    
    /// Replacement for removeTarget(_:action:for: .allEditingEvents)
    ///
    /// - Parameter action: Action to be removed from receiver
    /// - Returns: Boolean indicating success removal
    @discardableResult
    func rmAllEditingEvents(_ action: ActionVoid) -> Bool {
        return remove(.allEditingEvents(action))
    }
    
    /// Replacement for removeTarget(_:action:for: .applicationReserved)
    ///
    /// - Parameter action: Action to be removed from receiver
    /// - Returns: Boolean indicating success removal
    @discardableResult
    func rmApplicationReserved(_ action: ActionVoid) -> Bool {
        return remove(.applicationReserved(action))
    }
    
    /// Replacement for removeTarget(_:action:for: .systemReserved)
    ///
    /// - Parameter action: Action to be removed from receiver
    /// - Returns: Boolean indicating success removal
    @discardableResult
    func rmSystemReserved(_ action: ActionVoid) -> Bool {
        return remove(.systemReserved(action))
    }
    
    /// Replacement for removeTarget(_:action:for: .allEvents)
    ///
    /// - Parameter action: Action to be removed from receiver
    /// - Returns: Boolean indicating success removal
    @discardableResult
    func rmAllEvents(_ action: ActionVoid) -> Bool {
        return remove(.allEvents(action))
    }
}
