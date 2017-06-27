# JATableViewRowAction

[![CI Status](http://img.shields.io/travis/assisjeferson/JATableViewRowAction.svg?style=flat)](https://travis-ci.org/assisjeferson/JATableViewRowAction)
[![Version](https://img.shields.io/cocoapods/v/JATableViewRowAction.svg?style=flat)](http://cocoapods.org/pods/JATableViewRowAction)
[![License](https://img.shields.io/cocoapods/l/JATableViewRowAction.svg?style=flat)](http://cocoapods.org/pods/JATableViewRowAction)
[![Platform](https://img.shields.io/cocoapods/p/JATableViewRowAction.svg?style=flat)](http://cocoapods.org/pods/JATableViewRowAction)

A lib inspired in [BGTableViewRowActionWithImage](https://github.com/benguild/BGTableViewRowActionWithImage)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

* iOS 8.0+
* Xcode 8+
* Swift 3

## Installation

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects.
JATableViewRowAction is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

pod "JATableViewRowAction"
```

Then run the following command:

```ruby
$ pod install
```

# Usage

```ruby

// In your imports:
import JATableViewRowAction

// In your code:
JATableViewRowAction.rowAction(style: UITableViewRowActionStyle,
                               title: String,
                          titleColor: UIColor,
                               image: UIImage,
                     backgroundColor: UIColor,
                               frame: CGSize,
                                font: UIFont?,
                             handler: @escaping ((UITableViewRowAction, IndexPath) -> Swift.Void)

```


## Author

assisjeferson, assis.jeferson@hotmail.com

## License

JATableViewRowAction is available under the MIT license. See the LICENSE file for more info.
