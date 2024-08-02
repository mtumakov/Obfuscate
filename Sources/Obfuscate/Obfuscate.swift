import Foundation
import SwiftSyntaxMacros

@propertyWrapper
public struct Obfuscate {
    private var value: String

    public var wrappedValue: String {
        get { return String(data: Data(base64Encoded: value)!, encoding: .utf8)! }
        set { value = Data(newValue.utf8).base64EncodedString() }
    }

    public init(wrappedValue: String) {
        self.value = Data(wrappedValue.utf8).base64EncodedString()
    }
}

// Define macro
@attached(macro: ObfuscateMacro.self)
public macro Obfuscate() = #externalMacro(module: "ObfuscateMacros", type: "ObfuscateMacro")
