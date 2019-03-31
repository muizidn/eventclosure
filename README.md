# Event Closure

Make your event #selector to be a closure. Beautiful!

[![Build Status](https://travis-ci.org/muizidn/eventclosure.svg?branch=master)](https://travis-ci.org/muizidn/eventclosure)
[![codecov](https://codecov.io/gh/muizidn/eventclosure/branch/master/graph/badge.svg)](https://codecov.io/gh/muizidn/eventclosure)
![GitHub top language](https://img.shields.io/github/languages/top/muizidn/eventclosure.svg?color=orange)
![Cocoapods](https://img.shields.io/cocoapods/v/EventClosure.svg?color=red)

### Avoid
```swift
control.addTarget(self, action: #selector(fetchGithubUsers), for: .touchUpInside)
```

### Do
```swift
control.onTouchUpInside { fetchGithubUsers() }
```

### Get Your Own Control
```swift
let showConfirmAction = control.onTouchUpInside {
    showConfirmationAlert("Close connection?") { 
        connection.close()
    }
}
```

### To Invoke It
```swift
showConfirmAction.performAction()
```
But its not recommended

### Or To Remove It Later
```swift
control.rmOnTouchUpInside(
  showConfirmationAction
)
```

## CocoaPod
```ruby
pod "EventClosure"
```