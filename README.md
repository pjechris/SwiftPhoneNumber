# SwiftPhoneNumber

![SPM](https://img.shields.io/static/v1?label=Swift%20PM&message=%E2%9C%93&color=24C28A&labelColor=444444)
[![Twitter Follow](https://img.shields.io/twitter/follow/pjechris.svg?label=Follow%20me)](https://twitter.com/pjechris)
[![Donate using Liberapay](https://img.shields.io/liberapay/patrons/pjechris.svg?logo=liberapay)](https://liberapay.com/pjechris/donate)

A simple domain-oriented library to handle phone numbers! Compatible with all platforms where Swift run (see Compatibility section for more information).

Goal of the library is to be as simple to use as possible AND easy to add new functionalities such as Countries.

*Contribution to complete missing countries is appreciated.*

## Usage

SwiftPhoneNumber allow you to build **only valid** numbers:
```swift
import SwiftPhoneNumber

do {
    let phoneNumber = try PhoneNumber(number: "+33102030405")
    // OR
    let phoneNumber = try PhoneNumber(number: "+33102030405", for: [.fra, .usa, ...])
}
catch {

}
```
Once you have it, do whatever you want with it.

SwiftPhoneNumber also provide a formatter for `UITextField`:

```swift
import SwiftPhoneNumber
import SwiftPhoneNumber_UIKit

class ViewController: UIViewController {
    @IBOutlet var textField: UITextField!

    let delegate = TextFieldPhoneNumberDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()

        textField.delegate = delegate
    }
}
```
You can then get current input object directly from the delegate:

```swift

// nil if no input, an error if number is not valid otherwise a `PhoneNumber` object
delegate.value

```

> try it out running our example SwiftPhoneNumberExample

## Installation

SwiftPhoneNumber can be installed throughout Swift Package Manager:

```swift

let package = Package(
    name: "YourAwesomeProject",
    products: [],
    dependencies: [
        // remember to change version number to use latest available
        .package(url: "https://github.com/pjechris/SwiftPhoneNumber", from: "0.0"),
    ],
    targets: [
        name: "YourTarget",
        dependencies: [
            "SwiftPhoneNumber",
            .product("SwiftPhoneNumber-UIKit", package: "SwiftPhoneNumber") // <- add this only if you want to have UITextField support
        ]
    ]
```

## Compatibility

SwiftPhoneNumber should be able to run on any platform where Swift. That being said it has only been tested on iOS. If you find an incompatibility issue, pleas fill a bug.

## Supported countries

See [Countries](Countries.md)

## Participing

### New country
To add a new country:

- Add it to `Country.swift`. You'll have to provide info such name, flag emoji, iso codes.
- Define phone metadata and a formatter (or reuse one existing)
- Add those new data into `Country+Data`

### PhoneNumberFormatter

`PhoneNumberFormatter` is used to format a country. To create your own, you just have to make a new instance and pass 2 format style:
- one for international formatting
- one for national formatting.

If both are the same you can just pass one argument.

```swift
// Available interpolations are:
// - .code to international/nationalcode
// - a Int number that will take Int characters from subscriber number
let franceFormatter = PhoneNumberFormatter("\(.code)\(1) \(2) \(2) \(2) \(2)")
```

With a french number "0102030405" it would give "01 02 03 04 05"

### TextFieldPhoneNumberDelegate

Something is wrong with our `TextFieldPhoneNumberDelegate`? Or maybe you want something more? Under the hood `TextFieldPhoneNumberDelegate` is just a `TextFieldFormatterDelegate` with a `InputFormatter` to define formatting rules:

- How to clean the user input
- How to convert it into a `PhoneNumber`
- How to format the result (delegated to `PhoneNumberFormatter`)

So just define your own if you need to.


## License
This project is released under the MIT License. Please see the LICENSE file for details.
