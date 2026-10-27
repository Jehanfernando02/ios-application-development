//
//  SharedComponents.swift
//  MovieGenrePrac
//
//  Created by Jehan Fernando on 2026-10-20.
//

import SwiftUI

// MARK: - Genre Badge
struct GenreBadgeView: View {
    let genre: Genre
    let size: CGFloat
    let iconSize: CGFloat

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: size * 0.25)
                .fill(genre.color.opacity(0.15))
                .frame(width:size, height: size)
            
            Image(systemName: genre.icon)
                .font(.system(size: iconSize))
                .foregroundColor(genre.color)
        }
    }
}

// MARK: - Rating View
struct RatingView: View {
    let rating: Double
    var showOutOfTen: Bool = false

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)

            Text(String(format: "%.1f", rating))
                .fontWeight(.bold)

            if showOutOfTen {
                Text("/ 10")
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
        }
    }
}

// MARK: - Meta Info Tile
struct MetaInfoTileView: View {
    let icon: String
    let label: String
    let value: String

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .foregroundColor(.secondary)

            VStack(alignment: .leading, spacing: 1) {
                Text(label)
                    .font(.caption)
                    .foregroundColor(.secondary)

                Text(value)
                    .font(.subheadline)
                    .fontWeight(.medium)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Previews
#Preview("Genre Badge") {
    GenreBadgeView(genre: .drama, size: 64, iconSize: 28)
}

#Preview("Rating") {
    RatingView(rating: 9.0, showOutOfTen: true)
}

#Preview("Meta Info") {
    MetaInfoTileView(icon: "calendar", label: "Year", value: "2008")
        .padding()
}


/*
### 📖 Theory: why are these separate views?

All three components solve small presentation problems.

- `GenreBadgeView` receives a genre and sizes, then draws a badge.
- `RatingView` receives a rating and an optional display preference.
- `MetaInfoTileView` receives an icon, label and value.

They don't fetch or own movie-list data. They display values supplied by their parent.

For example:

```swift
RatingView(rating: movie.rating, showOutOfTen: true)
```

The parent passes a rating into the reusable component. The component decides how to render it.

This is **composition**: building larger interfaces from smaller views.

### 📖 Theory: what does `CGFloat` mean?

```swift
let size: CGFloat
```

`CGFloat` is a floating-point type commonly used for graphics and layout measurements in Apple UI frameworks. It allows values such as `64` or `28.5`.

### 📖 Theory: what is `ZStack`?

`ZStack` overlays views on top of each other. In the genre badge, a rounded rectangle forms the background and the symbol appears above it.

```swift
RoundedRectangle(cornerRadius: size * 0.25)
```

The corner radius is calculated as a quarter of the supplied size. That means a larger badge automatically receives a larger corner radius.

```swift
.fill(genre.color.opacity(0.15))
```

This uses the genre's colour at 15% opacity to create a subtle background.

### 📖 Theory: why `String(format: "%.1f", rating)`?

This formats a decimal to one digit after the decimal point. A rating such as `9.0` appears as `9.0` instead of `9`.

The format specifier `%.1f` means one decimal place. The underlying rating remains a `Double`; only its displayed representation is formatted.

### 📖 Theory: default arguments

```swift
var showOutOfTen: Bool = false
```

If the caller omits `showOutOfTen`, the component defaults to `false`. The rating row can therefore use a compact display, while the detail screen can request the full `/ 10` label.
 
 */
