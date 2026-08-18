# m3_talk

The slide deck for *Como criar bons prompts para contextos técnicos complexos* —
22 slides, ~30 minutes. Built with `material_design`, the package it uses as its
laboratory, so every measurement on screen comes from an M3 token.

Not part of the published package: `.pubignore` keeps it out of the archive.

## Running it

```sh
flutter run -d chrome
```

| Key | |
| :--- | :--- |
| `→` `space` `PageDown` | next slide |
| `←` `PageUp` | previous |
| `Home` / `End` | jump to the ends |
| `T` | light / dark |
| `P` | presenter mode (speaker notes + Q&A cards) |

**Two screens:** open the app in two browser windows, press `P` on the laptop
one, share the other. They follow each other over `BroadcastChannel`.

## Layout

| Path | |
| :--- | :--- |
| `lib/slides.dart` | the deck — content only |
| `lib/notes.dart` | speaker notes and Q&A, one entry per slide |
| `lib/presenter.dart` | the second screen |
| `lib/main.dart` | app shell: keys, transitions, footer |
| `lib/slide_kit.dart` | barrel over `lib/kit/` — the furniture slides are written with |
| `lib/deck_sync*.dart` | window-to-window sync (`BroadcastChannel` on web, no-op elsewhere) |

Each of the seven pattern slides states one rule three times — Java/Spring,
React Native, Flutter — through `StackRow`. That row is the point: a rule nobody
can picture in their own repository is a rule nobody writes on Monday.

## Tests

```sh
flutter test
```

Renders every slide and every presenter page, and checks the two things that
only fail in front of the room: a slide whose entrance never settles (blank
rectangle) and a slide too tall for 1080p (last line under the footer).
