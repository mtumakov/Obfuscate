// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

@propertyWrapper
struct Obfuscate {
    private var value: String

    var wrappedValue: String {
        get { return String(data: Data(base64Encoded: value)!, encoding: .utf8)! }
        set { value = Data(newValue.utf8).base64EncodedString() }
    }

    init(wrappedValue: String) {
        self.value = Data(wrappedValue.utf8).base64EncodedString()
    }
}
