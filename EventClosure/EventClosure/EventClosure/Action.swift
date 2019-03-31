//
//  Action.swift
//  EventClosure
//
//  Created by PondokIOS on 27/03/19.
//  Copyright © 2019 PondokIT. All rights reserved.
//

import UIKit

/// Typealias for Action<Void>
public typealias ActionVoid = Action<Void>


/// An Action class act as storage of closure
/// Type parameter I represent input
public final class Action<I>: NSObject {
    private let _action: (I) -> Void
    private let _input: I
    private let identifier = UUID().uuidString
    
    /// Initialize an Action with closure and input
    ///
    /// - Parameters:
    ///   - action: A closure with input parameter of type I
    ///   - input: a parameter object of type I
    public init(action: @escaping (I) -> Void, input: I) {
        _action = action
        _input = input
        super.init()
    }
    
    
    /// Call associated action with paremeter input
    /// The parameter input is supplied at receiver initialization
    @objc
    public func performAction() {
        _action(_input)
    }
    
    /// Selector for performAction
    public var selector: Selector {
        return #selector(performAction)
    }
    
    /// Test equality between two instance of Action
    override public func isEqual(_ object: Any?) -> Bool {
        guard let action = object as? Action<I> else {
            return false
        }
        return action.identifier == identifier
    }
}
