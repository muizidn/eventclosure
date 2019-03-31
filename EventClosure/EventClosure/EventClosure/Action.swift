//
//  Action.swift
//  EventClosure
//
//  Created by PondokIOS on 27/03/19.
//  Copyright © 2019 PondokIT. All rights reserved.
//

import UIKit

public typealias ActionVoid = Action<Void>
/// Target-Action helper.
public final class Action<I>: NSObject {
    private let _action: (I) -> Void
    private let _input: I
    private let identifier = UUID().uuidString
    
    /// Initialize an Action with closure and input
    ///
    /// - Parameters:
    ///   - action: A closure with input parameter of type I
    ///   - input: a parameter object of type I, must be reference type
    public init(action: @escaping (I) -> Void, input: I) {
        _action = action
        _input = input
        super.init()
    }
    
    
    /// Call associated action with paremeter input
    @objc
    public func performAction() {
        _action(_input)
    }
    
    public var selector: Selector {
        return #selector(performAction)
    }
    
    override public func isEqual(_ object: Any?) -> Bool {
        guard let action = object as? Action<I> else {
            return false
        }
        return action.identifier == identifier
    }
}
