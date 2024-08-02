//
//  ObfuscateMacro.swift
//
//
//  Created by Тумаков Михаил on 02.08.2024.
//

import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct ObfuscateMacro: Macro {
    public static func expansion(
        of node: AttributeSyntax,
        in context: MacroExpansionContext
    ) throws -> ExprSyntax {
        guard let argument = node.argument?.description.trimmingCharacters(in: .whitespacesAndNewlines) else {
            throw MacroExpansionError.message("Missing argument")
        }

        let obfuscatedValue = Data(argument.utf8).base64EncodedString()
        return ExprSyntax(stringLiteral: "\"\(obfuscatedValue)\"")
    }
}
