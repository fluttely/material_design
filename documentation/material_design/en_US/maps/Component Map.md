# 🗺️ Component Map - Material Design 3 Component Map

> **Component Map** visualizes all connections between tokens, styles, components and implementations in the Material Design 3 system.

## 🎯 System Overview

This map shows how all elements connect from fundamental tokens to functional Flutter components.

## 🏗️ Complete System Architecture

```mermaid
graph TB
    subgraph "🏷️ TOKENS"
        RT[Reference Tokens<br/>M3RefPalette, M3RefOpacity]
        ST[System Tokens<br/>M3SysColor, M3SysColorDark]
        CT[Component Tokens<br/>M3CompButton, M3CompCard]
    end

    subgraph "🎨 STYLES"
        CS[Color System<br/>Roles & Palettes]
        TY[Typography<br/>15-style Scale]
        EL[Elevation<br/>6 Levels + Shadows]
        MO[Motion<br/>Durations & Curves]
        SH[Shape<br/>Radius Scale]
    end

    subgraph "🧩 COMPONENTS"
        BT[Buttons<br/>Elevated, Filled, Outlined, Text]
        CD[Cards<br/>Standard, Elevated, Interactive]
        NV[Navigation<br/>Bar, Rail, Drawer]
        IN[Inputs<br/>TextField, Checkbox, Switch]
        FB[Feedback<br/>Dialogs, Snackbars, Tooltips]
    end

    subgraph "⚙️ IMPLEMENTATION"
        FL[Flutter Integration<br/>MaterialApp, ThemeData]
        TH[Theme System<br/>M3Theme, Dynamic Colors]
        AD[Adaptive Design<br/>M3Adaptive, Responsive]
        AC[Accessibility<br/>M3Accessibility, WCAG]
    end

    subgraph "📱 SHOWCASE"
        DT[DesignTokensPage<br/>Spacing, Density, Breakpoints]
        ST2[Styles Pages<br/>Color, Typography, Elevation]
        CP[Component Pages<br/>Buttons, Cards, Navigation]
        EF[Enhanced Features<br/>Advanced Implementations]
    end

    %% Token Flow
    RT --> ST
    ST --> CT
    RT --> CS
    RT --> TY
    RT --> MO

    %% Style Integration
    CS --> BT
    CS --> CD
    CS --> NV
    TY --> BT
    TY --> CD
    EL --> CD
    EL --> BT
    SH --> BT
    SH --> CD
    MO --> BT
    MO --> NV

    %% Component Assembly
    CT --> BT
    CT --> CD
    BT --> NV
    CD --> IN

    %% Implementation Connection
    CS --> FL
    TY --> FL
    BT --> TH
    CD --> TH
    NV --> AD
    BT --> AC

    %% Showcase Integration
    RT --> DT
    ST --> DT
    CS --> ST2
    TY --> ST2
    EL --> ST2
    BT --> CP
    CD --> CP
    NV --> CP
    FL --> EF
    TH --> EF
    AD --> EF
```

## 🔄 Detailed Connection Flows

### 1. 🏷️ Token-to-Style Flow

#### Color Flow

```mermaid
graph LR
    A[M3RefPalette<br/>13-tone palettes] --> B[M3SysColor<br/>40+ color roles]
    B --> C[Theme ColorScheme<br/>Flutter integration]
    C --> D[Component Themes<br/>Button, Card styles]

    A1[Primary Palette] --> B1[primary<br/>primaryContainer]
    A2[Neutral Palette] --> B2[surface<br/>onSurface]
    A3[Error Palette] --> B3[error<br/>errorContainer]
```

#### Typography Flow

```mermaid
graph LR
    A[M3RefTypeface<br/>Font definitions] --> B[M3TextStyleToken<br/>15 text styles]
    B --> C[TextTheme<br/>Flutter integration]
    C --> D[Component Text<br/>Button labels, Card titles]

    A1[Roboto Family] --> B1[displayLarge: 57px]
    A2[Weight 500] --> B2[labelMedium: 12px]
    A3[Letter Spacing] --> B3[titleMedium: 0.15em]
```

### 2. 🎨 Style-to-Component Flow

#### Button Construction

```mermaid
graph TD
    A[Button Component] --> B[Color System]
    A --> C[Typography]
    A --> D[Elevation]
    A --> E[Shape]
    A --> F[Motion]

    B --> B1[primaryContainer<br/>background]
    B --> B2[onPrimaryContainer<br/>text/icon]
    B --> B3[stateLayer<br/>interactions]

    C --> C1[labelLarge<br/>button text]

    D --> D1[level1<br/>resting state]
    D --> D2[level3<br/>hover state]

    E --> E1[medium<br/>12dp radius]

    F --> F1[short4<br/>200ms transitions]
    F --> F2[standard<br/>easing curve]
```

#### Card Construction

```mermaid
graph TD
    A[Card Component] --> B[Color System]
    A --> C[Typography]
    A --> D[Elevation]
    A --> E[Shape]

    B --> B1[surfaceContainer<br/>background]
    B --> B2[onSurface<br/>content text]

    C --> C1[titleMedium<br/>card titles]
    C --> C2[bodyMedium<br/>descriptions]

    D --> D1[level1<br/>default elevation]
    D --> D2[shadows<br/>from elevation]
    D --> D3[surfaceTint<br/>elevation tinting]

    E --> E1[medium<br/>12dp corners]
```

### 3. 🧩 Component Ecosystem

#### Navigation System

```mermaid
graph TD
    A[Navigation System] --> B[NavigationBar<br/>Mobile]
    A --> C[NavigationRail<br/>Tablet]
    A --> D[NavigationDrawer<br/>Desktop]

    B --> B1[M3BreakpointToken.compact<br/>0-599dp]
    C --> C1[M3BreakpointToken.medium<br/>600-839dp]
    D --> D1[M3BreakpointToken.expanded<br/>840dp+]

    B --> B2[Height: 80dp<br/>Icons: 24dp]
    C --> C2[Width: 80dp<br/>Rail items: 72dp]
    D --> D2[Width: 360dp<br/>List items: 56dp]

    B --> B3[Surface + 3dp<br/>State layers]
    C --> C3[Surface + 0dp<br/>Selected indicator]
    D --> D3[Surface + 1dp<br/>Modal overlay]
```

#### Input Components

```mermaid
graph TD
    A[Input System] --> B[TextField]
    A --> C[Selection Controls]
    A --> D[Action Chips]

    B --> B1[Outlined<br/>4dp corners]
    B --> B2[Filled<br/>4dp top corners]
    B --> B3[Standard<br/>no container]

    C --> C1[Checkbox<br/>2dp corners]
    C --> C2[Switch<br/>full radius]
    C --> C3[Radio<br/>circular]

    D --> D1[Assist Chips<br/>8dp radius]
    D --> D2[Filter Chips<br/>8dp radius]
    D --> D3[Input Chips<br/>8dp radius]
```

## 📱 Showcase Implementation Connections

### [[../examples/Design Tokens Page|DesignTokensPage]] Connections

```dart
// Spacing demonstration connects to:
M3SpacingToken.space16 ← M3RefSpacing.base * 4 ← 4dp grid system

// Density demonstration connects to:
M3VisualDensityToken.standard ← Platform detection ← Adaptive behavior

// Breakpoint demonstration connects to:
M3BreakpointToken.medium ← MediaQuery.size.width ← Responsive layout
```

### [[../examples/Enhanced Features Page|EnhancedFeaturesPage]] Connections

```dart
// Advanced typography connects to:
M3TextStyleToken.responsiveDisplay(context) ← M3BreakpointToken ← Screen adaptation

// Interactive elevation connects to:
M3SurfaceTint.surfaceAt(context, elevation) ← M3RefPalette ← Surface tinting

// Motion patterns connect to:
M3MotionUtils.fadeIn(duration, curve) ← M3RefDuration ← Animation timing
```

### Adaptive Layout Connections

```dart
// M3AdaptiveScaffold connects to:
M3ScreenSize ← M3BreakpointToken ← MediaQuery
NavigationDestination ← Component tokens ← Visual consistency

// Responsive values connect to:
M3Adaptive.responsiveValue<T>() ← Context ← Screen size classes
```

## 🛠️ Implementation Integration Map

### Theme System Integration

```mermaid
graph LR
    A[MaterialApp] --> B[ThemeData]
    B --> C[ColorScheme]
    B --> D[TextTheme]
    B --> E[Component Themes]

    C --> C1[M3SysColor.toColorScheme]
    D --> D1[M3TextStyleToken.material3TextTheme]

    E --> E1[ElevatedButtonTheme]
    E --> E2[CardTheme]
    E --> E3[AppBarTheme]
    E --> E4[NavigationBarTheme]

    E1 --> F1[M3CompButton tokens]
    E2 --> F2[M3CompCard tokens]
    E3 --> F3[M3CompAppBar tokens]
```

### Accessibility Integration

```mermaid
graph TD
    A[M3Accessibility] --> B[Color Contrast]
    A --> C[Touch Targets]
    A --> D[Screen Reader]
    A --> E[Keyboard Navigation]

    B --> B1[WCAG AA: 4.5:1<br/>Normal text]
    B --> B2[WCAG AAA: 7:1<br/>Enhanced contrast]

    C --> C1[Minimum: 48x48dp<br/>All interactive elements]
    C --> C2[Recommended: 56x56dp<br/>Primary actions]

    D --> D1[Semantic labels<br/>Content description]
    D --> D2[Live regions<br/>Dynamic updates]

    E --> E1[Focus indicators<br/>Visible focus states]
    E --> E2[Tab order<br/>Logical navigation]
```

## 📊 Component Usage Statistics

### Most Used Components (from Showcase)

```mermaid
pie title Component Usage in Showcase
    "Buttons" : 30
    "Text/Typography" : 25
    "Cards/Containers" : 20
    "Navigation" : 10
    "Inputs" : 8
    "Feedback" : 4
    "Other" : 3
```

### Token Application Distribution

```mermaid
pie title Token Types Applied to Components
    "System Tokens" : 45
    "Legacy Tokens" : 30
    "Component Tokens" : 15
    "Reference Tokens" : 10
```

## 🔗 Cross-Reference Network

### Foundation-Style-Component Links

**[[../foundations/Design Tokens|Design Tokens]]** →

- **[[../styles/Color System|Color System]]** → **Button colors**
- **[[../styles/Typography|Typography]]** → **Text styles**
- **[[../styles/Elevation|Elevation]]** → **Card shadows**

**[[../foundations/Accessibility|Accessibility]]** →

- **Button touch targets** → **48dp minimum**
- **Color contrast** → **4.5:1 ratio**
- **Focus indicators** → **Visible outlines**

**[[../foundations/Adaptive Design|Adaptive Design]]** →

- **Navigation patterns** → **Bar/Rail/Drawer**
- **Layout behavior** → **Responsive grids**
- **Input methods** → **Touch/Mouse sizing**

### Implementation-Component Links

**[[../implementation/Flutter Integration|Flutter Integration]]** →

- **MaterialApp setup** → **ThemeData configuration**
- **Widget integration** → **Component tokens**
- **Theme builder** → **M3Theme utility**

**[[../implementation/Theme System|Theme System]]** →

- **Light/Dark themes** → **Color system**
- **Dynamic colors** → **Material You**
- **Component themes** → **Token application**

## 🏷️ Tags

#component-map #material-design-3 #system-architecture #token-flow #style-integration #implementation-guide

## 🔍 See Also

- **[[../Material Design 3|🏠 Material Design 3 Home]]**
- **[[Token Map|🏷️ Token Map]]**
- **[[Implementation Map|⚙️ Implementation Map]]**
- **[[../foundations/Foundations|🏗️ Foundations]]**
- **[[../styles/Styles|🎨 Styles]]**

---

**📝 Last Updated:** Complete map with all connections between tokens, styles, components and implementations
