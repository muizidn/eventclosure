//
//  ActionEvent.swift
// Closure
//
//  Created by PondokIOS on 27/03/19.
//  Copyright © 2019 PondokIT. All rights reserved.
//

import UIKit

/// An Enum representing Action's
enum ActionEvent<T> {
    /// Represent UIControl.Event.touchDown
    case touchDown(T)
    
    /// Represent UIControl.Event.touchDownRepeat
    case touchDownRepeat(T)
    
    /// Represent UIControl.Event.touchDragInside
    case touchDragInside(T)
    
    /// Represent UIControl.Event.touchDragOutside
    case touchDragOutside(T)
    
    /// Represent UIControl.Event.touchDragEnter
    case touchDragEnter(T)
    
    /// Represent UIControl.Event.touchDragExit
    case touchDragExit(T)
    
    /// Represent UIControl.Event.touchUpInside
    case touchUpInside(T)
    
    /// Represent UIControl.Event.touchUpOutside
    case touchUpOutside(T)
    
    /// Represent UIControl.Event.touchCancel
    case touchCancel(T)
    
    
    /// Represent UIControl.Event.valueChanged
    case valueChanged(T)
    
    @available(iOS 9.0, *)
    /// Represent UIControl.Event.primaryActionTriggered
    case primaryActionTriggered(T)
    
    /// Represent UIControl.Event.editingDidBegin
    case editingDidBegin(T)
    
    /// Represent UIControl.Event.editingChanged
    case editingChanged(T)
    
    /// Represent UIControl.Event.editingDidEnd
    case editingDidEnd(T)
    
    /// Represent UIControl.Event.editingDidEndOnExit
    case editingDidEndOnExit(T)
    
    
    /// Represent UIControl.Event.allTouchEvents
    case allTouchEvents(T)
    
    /// Represent UIControl.Event.allEditingEvents
    case allEditingEvents(T)
    
    /// Represent UIControl.Event.applicationReserved
    case applicationReserved(T)
    
    /// Represent UIControl.Event.systemReserved
    case systemReserved(T)
    
    /// Represent UIControl.Event.allEvents
    case allEvents(T)
}

extension ActionEvent {
    /// UIControl.Event type represented by ActionEvent
    var type: UIControl.Event {
        switch self {
        case .touchDown: return UIControl.Event.touchDown
            
        case .touchDownRepeat: return UIControl.Event.touchDownRepeat
            
        case .touchDragInside: return UIControl.Event.touchDragInside
            
        case .touchDragOutside: return UIControl.Event.touchDragOutside
            
        case .touchDragEnter: return UIControl.Event.touchDragEnter
            
        case .touchDragExit: return UIControl.Event.touchDragExit
            
        case .touchUpInside: return UIControl.Event.touchUpInside
            
        case .touchUpOutside: return UIControl.Event.touchUpOutside
            
        case .touchCancel: return UIControl.Event.touchCancel
            
            
        case .valueChanged: return UIControl.Event.valueChanged
            
        case .primaryActionTriggered: return UIControl.Event.primaryActionTriggered
            
            
        case .editingDidBegin: return UIControl.Event.editingDidBegin
            
        case .editingChanged: return UIControl.Event.editingChanged
            
        case .editingDidEnd: return UIControl.Event.editingDidEnd
            
        case .editingDidEndOnExit: return UIControl.Event.editingDidEndOnExit
            
            
        case .allTouchEvents: return UIControl.Event.allTouchEvents
            
        case .allEditingEvents: return UIControl.Event.allEditingEvents
            
        case .applicationReserved: return UIControl.Event.applicationReserved
            
        case .systemReserved: return UIControl.Event.systemReserved
            
        case .allEvents: return UIControl.Event.allEvents
        }
    }
}

extension ActionEvent {
    /// Associated value of ActionEvent's instance
    var value: T {
        switch self {
        case .touchDown(let value),
             
             .touchDownRepeat(let value),
             
             .touchDragInside(let value),
             
             .touchDragOutside(let value),
             
             .touchDragEnter(let value),
             
             .touchDragExit(let value),
             
             .touchUpInside(let value),
             
             .touchUpOutside(let value),
             
             .touchCancel(let value),
             
             
             .valueChanged(let value),
             
            .primaryActionTriggered(let value),
            
            
            .editingDidBegin(let value),
            
            .editingChanged(let value),
            
            .editingDidEnd(let value),
            
            .editingDidEndOnExit(let value),
            
            
            .allTouchEvents(let value),
            
            .allEditingEvents(let value),
            
            .applicationReserved(let value),
            
            .systemReserved(let value),
            
            .allEvents(let value):
            
            return value
        }
    }
}
