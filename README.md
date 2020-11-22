# SwiftPhoneNumber

A simple library to handle phone numbers! Compatible with all platforms where Swift run (see Compatibility section for more information)

## Usage

SwiftPhoneNumber allow you to build **only valid** numbers:
```swift
import SwiftPhoneNumber

do {
    let phoneNumber = try PhoneNumber(number: "0102030405")
    // OR
    let phoneNumber = try PhoneNumber(number: "0102030405", from: [.fra, .usa, ...])
}
catch {

}
```
Once you have it, do whatever you want with it.

SwiftPhoneNumber can also provide a formatter for `UITextField`:

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

SwiftPhoneNumber countries support is still incomplete:

| Country       | Added version  |
|------------|-------------------|
| France (+DOM-TOM)        | 0.1|
| USA + (Commonwealth)           | 0.1|

It is a goal to have as much countries supported as possible. Feel free to add support for one (see Customization section on how to do it).

## Customization

### PhoneCountry
You can easily add a Country to SwiftPhoneNumber (or even maybe for your own need): 

- Add a file into `Data/Country` folder
- Create an extension on `PhoneCountry`, and add a `static let`  country instance. See the class documentation for more information
- Create an extension `PhoneNumberFormatter` add a new formatter for the new country.
- Add  country: formatter relationship in `Data/Dictionary+Formatter`
- And... that's it!

### PhoneNumberFormatter

`PhoneNumberFormatter` is used to format a `PhoneCountry`. To create your own, you just have to make a new instance and pass 2 formats: one for international formatting and one for national formatting. If both are the same you can just pass one argument.

```swift
let franceFormatter = PhoneNumberFormatter([.code, .subscriber(1), .literal(" "), .subscriberGrouped(by: 2, separator: " ")])
```
With a french number "0102030405" it would give "01 02 03 04 05". While working writing a formatter this way is kind of long and hard to read so you can also use `StringInterpolation` to get the same job done:

```swift
// Available interpolations are:
// - .code to international/nationalcode
// - a Int number that will take Int characters from subscriber number 
let franceFormatter = PhoneNumberFormatter("\(.code)\(1) \(2) \(2) \(2) \(2)")
```

### TextFieldPhoneNumberDelegate

Something is wrong with our `TextFieldPhoneNumberDelegate`? Or maybe you want something more? Under the hood `TextFieldPhoneNumberDelegate` is just a `TextFieldFormatterDelegate` with a `InputFormatter` to define formatting rules:

- How to clean the use input
- How to convert it into a `PhoneNumber`
- How to format the result (delegated to `PhoneNumberFormatter`)

So just define your own if you need to.


## License
This project is released under the MIT License. Please see the LICENSE file for details.
