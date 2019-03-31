//
//  UIControl.Event+Extension.swift
//  EventClosureTests
//
//  Created by PondokIOS on 30/03/19.
//  Copyright © 2019 PondokIT. All rights reserved.
//

import UIKit
@testable import EventClosure

extension UIControl.Event {
    private var _onEvent: ((UIControl) -> (@escaping () -> Void) -> ActionVoid) {
        switch self {
        case .touchDown: return UIControl.onTouchDown
        case .touchDownRepeat: return UIControl.onTouchDownRepeat
        case .touchDragInside: return UIControl.onTouchDragInside
        case .touchDragOutside: return UIControl.onTouchDragOutside
        case .touchDragEnter: return UIControl.onTouchDragEnter
        case .touchDragExit: return UIControl.onTouchDragExit
        case .touchUpInside: return UIControl.onTouchUpInside
        case .touchUpOutside: return UIControl.onTouchUpOutside
        case .touchCancel: return UIControl.onTouchCancel
            
        case .valueChanged: return UIControl.onValueChanged
        case .primaryActionTriggered: return UIControl.onPrimaryActionTriggered
            
        case .editingDidBegin: return UIControl.onEditingDidBegin
        case .editingChanged: return UIControl.onEditingChanged
        case .editingDidEnd: return UIControl.onEditingDidEnd
        case .editingDidEndOnExit: return UIControl.onEditingDidEndOnExit
            
        case .allTouchEvents: return UIControl.onAllTouchEvents
        case .allEditingEvents: return UIControl.onAllEditingEvents
        case .applicationReserved: return UIControl.onApplicationReserved
        case .systemReserved: return UIControl.onSystemReserved
        case .allEvents: return UIControl.onAllEvents
        default: return UIControl.onAllEvents
        }
    }
    
    private var _removeEvent: ((UIControl) -> (ActionVoid) -> Bool) {
        switch self {
        case .touchDown: return UIControl.rmTouchDown
        case .touchDownRepeat: return UIControl.rmTouchDownRepeat
        case .touchDragInside: return UIControl.rmTouchDragInside
        case .touchDragOutside: return UIControl.rmTouchDragOutside
        case .touchDragEnter: return UIControl.rmTouchDragEnter
        case .touchDragExit: return UIControl.rmTouchDragExit
        case .touchUpInside: return UIControl.rmTouchUpInside
        case .touchUpOutside: return UIControl.rmTouchUpOutside
        case .touchCancel: return UIControl.rmTouchCancel
            
        case .valueChanged: return UIControl.rmValueChanged
        case .primaryActionTriggered: return UIControl.rmPrimaryActionTriggered
            
        case .editingDidBegin: return UIControl.rmEditingDidBegin
        case .editingChanged: return UIControl.rmEditingChanged
        case .editingDidEnd: return UIControl.rmEditingDidEnd
        case .editingDidEndOnExit: return UIControl.rmEditingDidEndOnExit
            
        case .allTouchEvents: return UIControl.rmAllTouchEvents
        case .allEditingEvents: return UIControl.rmAllEditingEvents
        case .applicationReserved: return UIControl.rmApplicationReserved
        case .systemReserved: return UIControl.rmSystemReserved
        case .allEvents: return UIControl.rmAllEvents
        default: return UIControl.rmAllEvents
        }
    }
}

extension UIControl.Event {
    @discardableResult
    func onEvent(control: UIControl, completion: @escaping () -> Void) -> ActionVoid {
        return _onEvent(control)({ completion() })
    }
    
    @discardableResult
    func removeEvent(control: UIControl, action: ActionVoid) -> Bool {
        return _removeEvent(control)(action)
    }
}
