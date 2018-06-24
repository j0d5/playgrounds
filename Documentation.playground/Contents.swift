//: Playground - noun: a place where people can play

/// # Playground to show the various kinds of documentation.

import UIKit

/// Lorem ipsum dolor sit amet.
///
/// - Parameter bar: Consectetur adipisicing elit.
///
/// - Returns: Sed do eiusmod tempor.
/// - SeeAlso: `AnyObject`
func foo(bar: AnyObject) -> AnyObject { return bar}

/**
 # Lists
 
 You can apply *italic*, **bold**, or `code` inline styles.
 
 ## Unordered Lists
 
 - Lists are great,
 - but perhaps don't nest
 - Sub-list formatting
 
 - isn't the best.
 
 ## Ordered Lists
 
 1. Ordered lists, too
 2. for things that are sorted;
 3. Arabic numerals
 4. are the only kind supported.
 */


/// This is an enum which tries to describe various types of tea.
///
/// - green: A tea that consists of green tea leafs
/// - black: A tea that consists of black tea leafs
/// - fruit: A tea that consists of various fruits and leafs
enum TeaType: CustomStringConvertible {
    case green
    case black
    case fruit
    
    /// Returns the type as string
    var description: String {
        switch self {
        case .green:
            return "Green"
        case .black:
            return "Black"
        case .fruit:
            return "Fruit"
        }
    }
}

/// Class description
class Tea {
    
    private var type: TeaType?
    private var brewTime: Double?
    
    /// Initializer for class tea.
    ///
    /// It takes two arguments which define the tea's type and time to brew.
    ///
    /// - Throws: Nothing yet
    /// - Parameters:
    ///   - type: The type of tea
    ///   - time: The time the tea needs to brew
    /// - SeeAlso: Class `Tea`
    ///
    /// Safety Information:
    /// - Precondition: The precondition for this method
    /// - Postcondition: The postcondition for this method
    /// - Requires: Requirements for this method
    /// - Invariant: Invariants
    /// - Complexity: Complex things
    /// - Important: Important things
    /// - Warning: Warnings
    /// Metadata:
    /// - Author: Me
    /// - Authors: None
    /// - Copyright: None
    /// - Date: Today
    /// - Since: now
    /// - Version: 1.0
    ///
    /// General Notes:
    /// - Attention: Watch out
    /// - Bug: No bugs
    /// - Experiment: None
    /// - Note: -
    /// - Remark: None
    /// - ToDo: None
    init(type: TeaType, time: Double) {
        self.type = type
        self.brewTime = time
    }
    
    // TODO: Write down everything else
    
    // FIXME: Fix something
}

// MARK: CustomStringConvertible
extension Tea: CustomStringConvertible {
    
    var description: String {
        switch self {
        default:
            return "Missing"
        }
    }
    
}

