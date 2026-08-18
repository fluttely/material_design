# Foundations

M3 foundations (https://m3.material.io/foundations) are the cross-cutting rules that
every style and component obeys. In this package they map to four areas:

| M3 foundation | Note | Package modules |
| :--- | :--- | :--- |
| Design tokens | [[Design Tokens]] | `tokens` (the contract itself) |
| Accessibility | [[Accessibility]] | `adaptive` (`M3Accessibility`), `color` (WCAG utils), `interaction` (focus ring) |
| Adaptive design / Layout | [[Adaptive Design]] | `adaptive`, `tokens` (breakpoints, margins, layout widths) |
| Interaction states | [[Interaction States]] | `interaction`, `tokens` (state layer opacities) |

Content design and other non-code foundations (writing style, iconography guidelines)
are out of scope for a token package and intentionally have no notes here.

Related: [[../Material Design 3|Vault home]] · [[../Roadmap|Roadmap]] ·
[[../maps/Coverage Map|Coverage Map]]
