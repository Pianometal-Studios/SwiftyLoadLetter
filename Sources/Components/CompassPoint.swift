//
//  CompassPoint.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 5/25/26.
//  Apache License 2.0
//
// ----------------------------------------------------------
//                               N
//                              ⬆️
//                            ╱ │ ╲
//                          ╱   │   ╲
//                        ╱     │     ╲
//                      ╱       │       ╲
//                    ╱         │         ╲
//                  ╱           │           ╲
//                ╱             │             ╲
//       W ⬅️━━━━━━━━━━━━━━━━━━━┼━━━━━━━━━━━━━━━━━━━➡️ E
//                ╲             │             ╱
//                  ╲           │           ╱
//                    ╲         │         ╱
//                      ╲       │       ╱
//                        ╲     │     ╱
//                          ╲   │   ╱
//                            ╲ │ ╱
//                              ⬇️
//                               S
//
//              Now... where the func are my keys?! 😩
//
// ----------------------------------------------------------

public import SwiftUI

/// An enumeration representing the four cardinal directions on a compass.
///
/// Each case provides properties for its abbreviation, icon, name, opposite direction, and
/// bearing, and ``init(_:)`` finds the nearest point to any bearing.
@frozen public enum CompassPoint:
    String,
    Staticable,
    Searchable,
    Iconable,
    Listable {
    
    case north
    case south
    case east
    case west
    
    /// Creates the compass point nearest to a bearing.
    ///
    /// Each point covers the 90° centered on it, so north covers 315° up to 45°, east covers
    /// 45° up to 135°, and so on. A boundary belongs to the point clockwise of it.
    ///
    /// ## Example
    /// ```swift
    /// CompassPoint(100)  // .east
    /// CompassPoint(-90)  // .west
    /// CompassPoint(370)  // .north
    /// ```
    ///
    /// - Parameter direction: A bearing in degrees clockwise from north. Values outside
    ///   `0..<360`, including negative values, wrap around, and a non-finite value returns
    ///   `.north`.
    ///
    /// - Important: A negative `CLLocationDirection` means the heading is invalid, yet it wraps
    ///   like any other value. Check for one before calling this.
    public init(_ direction: Double) {
        let normalized = direction.truncatingRemainder(dividingBy: 360)
        let degrees = normalized < 0 ? normalized + 360 : normalized
        switch degrees {
        case 45 ..< 135:  self = .east
        case 135 ..< 225: self = .south
        case 225 ..< 315: self = .west
        default:          self = .north
        }
    }
    
    /// - Returns: Single-letter abbreviation for the given compass point.
    public var abbreviation: String {
        switch self {
        case .north: "N"
        case .south: "S"
        case .east:  "E"
        case .west:  "W"
        }
    }
    
    /// - Returns: The compass point's bearing as an `Angle`.
    public var angle: Angle {
        .degrees(locationDirection)
    }
    
    public var icon: String {
        switch self {
        case .north: "arrow.up"
        case .south: "arrow.down"
        case .east:  "arrow.right"
        case .west:  "arrow.left"
        }
    }
    
    /// - Returns: The compass point's bearing in degrees clockwise from north, the same
    ///   convention as `CLLocationDirection`.
    public var locationDirection: Double {
        switch self {
        case .north: 0
        case .east:  90
        case .south: 180
        case .west:  270
        }
    }
    
    public var name: String {
        switch self {
        case .north: "North"
        case .south: "South"
        case .east:  "East"
        case .west:  "West"
        }
    }
    
    /// - Returns: The opposite compass direction.
    public var opposite: Self {
        switch self {
        case .north: .south
        case .south: .north
        case .east:  .west
        case .west:  .east
        }
    }
    
    /// - Returns: The compass point's bearing in radians clockwise from north.
    public var radians: Double {
        locationDirection.radians
    }
    
    public static let navigationTitle = "Compass Points"
}

// MARK: - Preview

#if DEBUG
#Preview {
    NavigationStack {
        List(CompassPoint.allCases) { compassPoint in
            Section {
                LabeledContent("Abbreviation", value: compassPoint.abbreviation)
                LabeledContent("Opposite", value: compassPoint.opposite.name)
                LabeledContent("Bearing", value: compassPoint.locationDirection.formatted() + "°")
            } header: {
                Label(compassPoint.name, systemImage: compassPoint.icon)
                    .symbolVariant(.circle.fill)
                    .symbolRenderingMode(.hierarchical)
            }
        }
        .navigationTitle(CompassPoint.navigationTitle)
        .navigationSubtitle(subtitle: "Compass properties and details")
    }
}
#endif
