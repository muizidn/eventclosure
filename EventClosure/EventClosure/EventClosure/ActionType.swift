//
//  ActionType.swift
//  EventClosure
//
//  Created by PondokIOS on 27/03/19.
//  Copyright © 2019 PondokIT. All rights reserved.
//

import UIKit

/// Target-Action helper.
final class Action<I>: NSObject {
    private let _action: (I) -> Void
    private let _input: I
    private let identifier = UUID().uuidString
    init(action: @escaping (I) -> Void, input: I) {
        _action = action
        _input = input
        super.init()
    }
    
    @objc func action() {
        _action(_input)
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let action = object as? Action<I> else {
            return false
        }
        return action.identifier == identifier
    }
}
