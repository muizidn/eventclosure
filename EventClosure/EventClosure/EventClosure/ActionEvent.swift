//
//  ActionEvent.swift
//  EventClosure
//
//  Created by PondokIOS on 27/03/19.
//  Copyright © 2019 PondokIT. All rights reserved.
//

import UIKit

enum ActionEvent<T> {
    case touchDown(T)
    
    case touchDownRepeat(T)
    
    case touchDragInside(T)
    
    case touchDragOutside(T)
    
    case touchDragEnter(T)
    
    case touchDragExit(T)
    
    case touchUpInside(T)
    
    case touchUpOutside(T)
    
    case touchCancel(T)
    

    case valueChanged(T)
    
    @available(iOS 9.0, *)
    case primaryActionTriggered(T)
    
    case editingDidBegin(T)
    
    case editingChanged(T)
    
    case editingDidEnd(T)
    
    case editingDidEndOnExit(T)
    
    
    case allTouchEvents(T)
    
    case allEditingEvents(T)
    
    case applicationReserved(T)
    
    case systemReserved(T)
    
    case allEvents(T)
}

extension ActionEvent {
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
