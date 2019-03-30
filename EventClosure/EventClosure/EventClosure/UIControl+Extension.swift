//
//  UIControl+Extension.swift
//  EventClosure
//
//  Created by PondokIOS on 27/03/19.
//  Copyright © 2019 PondokIT. All rights reserved.
//

import UIKit

fileprivate var ActionKey: UInt8 = 0

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
    public var actionsCount: Int {
        return _actionVoids.count
    }
    
    typealias VoidCallback = () -> Void
    
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

extension UIControl {
    @discardableResult
    func onTouchDown(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.touchDown(closure))
    }
    
    @discardableResult
    func onTouchDownRepeat(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.touchDownRepeat(closure))
    }
    
    @discardableResult
    func onTouchDragInside(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.touchDragInside(closure))
    }
    
    @discardableResult
    func onTouchDragOutside(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.touchDragOutside(closure))
    }
    
    @discardableResult
    func onTouchDragEnter(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.touchDragEnter(closure))
    }
    
    @discardableResult
    func onTouchDragExit(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.touchDragExit(closure))
    }
    
    @discardableResult
    func onTouchUpInside(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.touchUpInside(closure))
    }
    
    @discardableResult
    func onTouchUpOutside(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.touchUpOutside(closure))
    }
    
    @discardableResult
    func onTouchCancel(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.touchCancel(closure))
    }
    
    
    @discardableResult
    func onValueChanged(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.valueChanged(closure))
    }
    
    @available(iOS 9.0, *)
    @discardableResult
    func onPrimaryActionTriggered(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.primaryActionTriggered(closure))
    }
    
    @discardableResult
    func onEditingDidBegin(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.editingDidBegin(closure))
    }
    
    @discardableResult
    func onEditingChanged(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.editingChanged(closure))
    }
    
    @discardableResult
    func onEditingDidEnd(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.editingDidEnd(closure))
    }
    
    @discardableResult
    func onEditingDidEndOnExit(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.editingDidEndOnExit(closure))
    }
    
    
    @discardableResult
    func onAllTouchEvents(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.allTouchEvents(closure))
    }
    
    @discardableResult
    func onAllEditingEvents(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.allEditingEvents(closure))
    }
    
    @discardableResult
    func onApplicationReserved(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.applicationReserved(closure))
    }
    
    @discardableResult
    func onSystemReserved(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.systemReserved(closure))
    }
    
    @discardableResult
    func onAllEvents(_ closure: @escaping () -> Void) -> ActionVoid {
        return on(.allEvents(closure))
    }
}

extension UIControl {
    @discardableResult
    func rmTouchDown(_ action: ActionVoid) -> Bool {
        return remove(.touchDown(action))
    }
    
    @discardableResult
    func rmTouchDownRepeat(_ action: ActionVoid) -> Bool {
        return remove(.touchDownRepeat(action))
    }
    
    @discardableResult
    func rmTouchDragInside(_ action: ActionVoid) -> Bool {
        return remove(.touchDragInside(action))
    }
    
    @discardableResult
    func rmTouchDragOutside(_ action: ActionVoid) -> Bool {
        return remove(.touchDragOutside(action))
    }
    
    @discardableResult
    func rmTouchDragEnter(_ action: ActionVoid) -> Bool {
        return remove(.touchDragEnter(action))
    }
    
    @discardableResult
    func rmTouchDragExit(_ action: ActionVoid) -> Bool {
        return remove(.touchDragExit(action))
    }
    
    @discardableResult
    func rmTouchUpInside(_ action: ActionVoid) -> Bool {
        return remove(.touchUpInside(action))
    }
    
    @discardableResult
    func rmTouchUpOutside(_ action: ActionVoid) -> Bool {
        return remove(.touchUpOutside(action))
    }
    
    @discardableResult
    func rmTouchCancel(_ action: ActionVoid) -> Bool {
        return remove(.touchCancel(action))
    }
    
    
    @discardableResult
    func rmValueChanged(_ action: ActionVoid) -> Bool {
        return remove(.valueChanged(action))
    }
    
    @available(iOS 9.0, *)
    @discardableResult
    func rmPrimaryActionTriggered(_ action: ActionVoid) -> Bool {
        return remove(.primaryActionTriggered(action))
    }
    
    @discardableResult
    func rmEditingDidBegin(_ action: ActionVoid) -> Bool {
        return remove(.editingDidBegin(action))
    }
    
    @discardableResult
    func rmEditingChanged(_ action: ActionVoid) -> Bool {
        return remove(.editingChanged(action))
    }
    
    @discardableResult
    func rmEditingDidEnd(_ action: ActionVoid) -> Bool {
        return remove(.editingDidEnd(action))
    }
    
    @discardableResult
    func rmEditingDidEndOnExit(_ action: ActionVoid) -> Bool {
        return remove(.editingDidEndOnExit(action))
    }
    
    
    @discardableResult
    func rmAllTouchEvents(_ action: ActionVoid) -> Bool {
        return remove(.allTouchEvents(action))
    }
    
    @discardableResult
    func rmAllEditingEvents(_ action: ActionVoid) -> Bool {
        return remove(.allEditingEvents(action))
    }
    
    @discardableResult
    func rmApplicationReserved(_ action: ActionVoid) -> Bool {
        return remove(.applicationReserved(action))
    }
    
    @discardableResult
    func rmSystemReserved(_ action: ActionVoid) -> Bool {
        return remove(.systemReserved(action))
    }
    
    @discardableResult
    func rmAllEvents(_ action: ActionVoid) -> Bool {
        return remove(.allEvents(action))
    }
}

