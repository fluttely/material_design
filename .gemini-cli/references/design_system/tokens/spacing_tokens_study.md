# Architectural Decision Record: Spacing Tokens

## Introduction

A well-defined spacing token system is fundamental to creating visually consistent and maintainable user interfaces. It establishes a predictable rhythm and scale for layout, preventing the use of arbitrary "magic numbers" for padding, margins, and gaps.

This document analyzes two primary approaches for implementing spacing tokens in our design system library:
1.  **The Class-Based (Static) Approach:** Using a class with explicit, named properties.
2.  **The Map-Based (Dynamic) Approach:** Using a `Map` to associate token names with values.

The goal is to determine which approach best serves the library's objectives of robustness, predictability, and ease of use.

---

## Analysis of the Class-Based Approach

### Description

This approach defines a class where each spacing value is an explicit property. The scale is fixed at compile time.

**Conceptual Code:**
```dart
class SpacingTokens {
  const SpacingTokens({
    required this.small,
    required this.medium,
    required this.large,
    // ... and so on for the entire scale
  });

  final double small;   // e.g., 8.0
  final double medium;  // e.g., 16.0
  final double large;   // e.g., 24.0
}
```

### Pros

-   **Maximum Type Safety:** The compiler guarantees that a token exists. A call to `tokens.extraLarge` will fail at compile time if it's not defined, not at runtime.
-   **Excellent API Discoverability:** Developers can use code completion (`tokens.`) to easily see all available spacing tokens. This makes the API self-documenting and easy to learn.
-   **Explicit Contract:** The class definition serves as a rigid contract. It clearly communicates the entire available spacing scale to the consumer of the library.
-   **Performance:** Direct property access is marginally more performant than a map lookup, though this is rarely a significant factor.

### Cons

-   **Less Dynamic:** The spacing scale is fixed. Adding, removing, or renaming a token requires modifying the class definition and recompiling the library and all its consumers.
-   **More Boilerplate:** The class definition can be more verbose than populating a map, especially for a large token scale.

---

## Analysis of the Map-Based Approach

### Description

This approach uses a `Map` to store the spacing scale, typically with an `enum` serving as the key to provide a degree of type safety.

**Conceptual Code:**
```dart
enum SpacingToken {
  small,
  medium,
  large,
}

// The theme would hold this map:
final Map<SpacingToken, double> spacingTokens = {
  SpacingToken.small: 8.0,
  SpacingToken.medium: 16.0,
  SpacingToken.large: 24.0,
};
```

### Pros

-   **Highly Dynamic:** The scale can be easily modified at runtime. It can be loaded from a JSON file, fetched from a server, or generated dynamically, which is powerful for theming engines.
-   **Easy Iteration:** It's trivial to iterate over all the tokens in the map (e.g., to display them in a design system viewer).
-   **Concise Definition:** For large scales, defining the map can be less verbose than a full class constructor and property list.

### Cons

-   **Reduced Safety:** While using an `enum` as a key is safer than a `String`, there is no compile-time guarantee that the map contains an entry for every `enum` value. A lookup for a missing key will result in a `null` value and likely a runtime error (`Null check used on a null value`).
-   **Less Discoverable API:** Developers cannot use code completion to see the available tokens. They must refer to the `SpacingToken` enum definition itself, which is a disconnected experience.
-   **Implicit Contract:** The contract is less rigid. The existence of a token can only be verified at runtime.

---

## Comparative Analysis in Context

For a general-purpose theming engine, the dynamism of the **Map-Based Approach** is a significant advantage. It allows end-users to define entirely custom token sets without forking the library.

However, for our specific use case—a helper library for Material Design—the context is different. Material Design is prescriptive. It defines a clear, intentional, and finite set of guidelines. The goal of our library is not to enable infinite flexibility, but to make it easier to implement a *consistent* and *correct* Material Design system.

In this context, the "total freedom" of a Map becomes more of a **risk than a benefit**. It introduces the possibility of runtime errors and inconsistencies (e.g., a developer accidentally using a token that hasn't been defined in the theme's map). The rigid, compile-time contract of the **Class-Based Approach** aligns much more closely with the prescriptive nature of Material Design. It transforms the design system's rules into compiler-enforced rules, which is a powerful feature for building robust applications.

---

## Final Recommendation and Justification

**Recommendation: Adopt the Class-Based (Static) Approach.**

**Justification:**

The primary goal of this library is to promote consistency, predictability, and developer confidence when implementing a Material Design system. The **Class-Based Approach** directly serves this goal by providing:

1.  **Compile-Time Safety:** It eliminates an entire class of potential runtime errors related to missing tokens. This is the single most important factor for a library intended to be a stable foundation.
2.  **Superior Developer Experience:** The discoverability offered by code completion (`tokens.medium`) is a significant usability win. It makes the design system easier to learn, use, and apply correctly.
3.  **Alignment with a Prescriptive System:** By providing an explicit and rigid contract, the class-based approach mirrors the prescriptive philosophy of Material Design itself. It guides developers toward using the system as intended, rather than providing a loose framework that allows for easy deviation and error.

While the Map-based approach offers dynamism, this flexibility is not a primary requirement for this library and comes at the cost of safety and developer experience. Therefore, the robust, self-documenting, and safe nature of the class-based approach makes it the superior choice for the `material_toolkit` library.
