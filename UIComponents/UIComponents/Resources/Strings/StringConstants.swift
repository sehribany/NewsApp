// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  public enum WalkThrough {
    /// Stay ahead with real-time news updates, your gateway to global happenings.
    public static let descriptionText = L10n.tr("Modules", "WalkThrough.descriptionText", fallback: "Stay ahead with real-time news updates, your gateway to global happenings.")
    /// Welcome to the World of News!
    public static let firstTitle = L10n.tr("Modules", "WalkThrough.firstTitle", fallback: "Welcome to the World of News!")
    /// Modules.strings
    ///   UIComponents
    /// 
    ///   Created by Şehriban Yıldırım on 10.12.2023.
    public static let next = L10n.tr("Modules", "WalkThrough.Next", fallback: "Continue!")
    /// Explore the World at Your Fingertips.
    public static let secondTitle = L10n.tr("Modules", "WalkThrough.secondTitle", fallback: "Explore the World at Your Fingertips.")
    /// Explore!
    public static let start = L10n.tr("Modules", "WalkThrough.Start", fallback: "Explore!")
    /// Take the First Step into Information.
    public static let thirdTitle = L10n.tr("Modules", "WalkThrough.thirdTitle", fallback: "Take the First Step into Information.")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
