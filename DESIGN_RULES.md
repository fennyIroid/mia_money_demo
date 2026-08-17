# Mia Money — Design Rules

The visual and motion language of the app. These rules are as binding as
`CLAUDE.md`. If a screen breaks one of them, the screen is wrong.

---

## 1. The aesthetic: "Aurora Frost"

A deep ink canvas lit from behind by a slow aurora of **ember-amber** and
**glacier-blue**, read through **frosted glass** panels with generous, continuous
corners. Financial figures are set large in a characterful grotesque; Mia's own
voice appears in an italic serif.

Committed dark theme. No light mode, no theme switcher. The dark ground is what
makes the glass and the aurora work — a light variant would be a different
product, not a toggle.

**Never do:** flat solid backgrounds, purple-on-white gradients, Inter/Roboto/
system fonts, evenly-distributed rainbow palettes, stock card layouts, drop
shadows used as the only depth cue.

---

## 2. Typography

Three bundled families, each with exactly one job. All three ship in
`assets/fonts/` — no runtime font fetching.

| Role | Family | Used for |
| --- | --- | --- |
| Display | **Bricolage Grotesque** (`AppFonts.display`) | Headings, currency figures, anything structural |
| Body | **Epilogue** (`AppFonts.body`) | Body copy, labels, dense financial lists |
| Editorial | **Instrument Serif** (`AppFonts.editorial`) | Mia's voice, hero titles, quiet emphasis — usually italic |

Rules:

- Every text node is a `BaseText`. Never `Text` directly.
- Pass **raw** design values: `BaseText('…', fontSize: 16)`. `BaseText` runs
  `getFontSize` internally.
- Compose from `AppTypography` presets (`heroFigure`, `figureLarge`,
  `figureMedium`, `titleLarge/Medium/Small`, `bodyLarge/Medium/Small`, `label`,
  `overline`, `quote`, `editorialDisplay`) rather than inventing new styles.
- Big figures use negative tracking. `ValueTicker` handles this automatically.
- `overline` is always uppercase with wide tracking, and is the only all-caps
  style in the product.

---

## 3. Colour

Single source: `AppColors`. No hardcoded `Color(0x…)` in features.

- **Canvas:** `ink` → `abyss` → `graphite` → `slate` → `steel`
- **Type:** `frost` → `mist` → `muted` → `faint`
- **Ember (dominant accent):** `amberGlow`, `emberBright`, `ember`, `rust`,
  `emberDeep`
- **Glacier (counterweight):** `glacier`, `glacierMid`, `glacierDeep`, `lagoon`
- **Semantic:** `positive`, `negative`, `caution`, `info`, `violetHaze`
- **Glass:** `glassFillSoft/Fill/FillStrong`, `glassBorder(Soft)`, `glassHighlight`

Rules:

- One dominant accent per screen. Ember owns money and attention; glacier owns
  data, provenance and calm; violet owns permission and privacy.
- Opacity only through `withCustomOpacity(color, opacity)`. Never
  `.withOpacity()`.
- **Status is never carried by colour alone.** Every `StatusPill` pairs a hue
  with an icon and a word. This is an accessibility requirement, not a
  preference.
- Category and chart hues come from `AppColors.dataSpectrum` so the same
  category reads the same colour everywhere.

---

## 4. Surfaces & depth

Depth is built from four stacked layers, in this order:

1. **Aurora canvas** — `AuroraBackground`, a painter with orbiting light bodies
   projected in perspective, plus a deterministic grain field that kills the
   banding large blurred gradients otherwise show on OLED.
2. **Frosted glass** — `GlassPanel` (`BackdropFilter` + gradient fill + hairline
   border + lit top rim). Tones: `soft`, `standard`, `raised`, `ember`,
   `glacier`.
3. **Content** — figures, rows, charts.
4. **Chrome** — `MiaHeaderBar` and `MiaBottomBar` blur whatever scrolls beneath
   them; the page never simply stops at a hard edge.

Corner language (`AppRadii`): generous and continuous — `xs 10`, `sm 16`,
`md 22`, `lg 28`, `xl 34`, `xxl 42`, `pill`. Bento tiles use `xl`; hero tiles use
`xxl`. Nothing in the product has a sharp corner.

Every dimension, radius, padding and icon size goes through `getSize(...)`;
every font size through `getFontSize(...)`. No `.w` / `.h` / `.r` / `.sp` and no
raw pixel literals.

---

## 5. Layout: the bento system

The product is assembled from bento tiles, not screens of stacked rows.

- `BentoHeroTile` — one per screen, top: the single most important figure, its
  freshness, and a supporting visual.
- `BentoTile` — 2-up grids: haloed glyph, small label, headline figure, optional
  micro-chart in the lower-right corner.
- `GlassPanel` + `EvidenceRow` — the evidence/provenance drawer pattern.
- `MiaGroupedCard` + `MiaSettingsRow` — grouped settings with hairline dividers.

Screen padding is `20`. Tile gap is `10`. Section gap is `28`.

---

## 6. Motion

All timing and easing comes from `AppMotion`. Nothing eases linearly; everything
decelerates into place.

| Token | Duration | Use |
| --- | --- | --- |
| `instant` | 90ms | State flips |
| `tap` | 140ms | Press feedback |
| `quick` | 220ms | Chips, segmented controls |
| `normal` | 340ms | Page chrome, tab pill |
| `slow` | 520ms | Entrance reveals |
| `cinematic` | 900ms | Figure count-ups, chart draws |
| `breathe` / `ambient` | 6s / 14s | Float and aurora loops |

Curves: `standard` (Apple's default), `enter`, `exit`, `spring` (overshoot for
confirmations), `drift` (symmetric, for ambient loops).

Rules:

- **One orchestrated page load beats scattered micro-interactions.** Wrap screen
  content in `Reveal(index: n)` so children rise, fade and unblur in sequence
  (70ms stagger).
- Every tappable surface uses `Pressable`: scale to 0.965, dim slightly, spring
  back, light haptic. Consistent everywhere, no exceptions.
- Figures never snap in — `ValueTicker` counts them up and animates between
  values. Charts draw themselves (`Sparkline`, `BarSpark`, `ArcGauge`,
  `ProgressRing`, `ProportionBar`).
- Navigation uses Cupertino push transitions; full-screen replacements fade;
  Ask Mia rises from the bottom.
- Nothing on screen is ever perfectly static — `Floating` gives hero art and the
  Ask Mia orb a slow drift.

### The 3D mark

`MiaOrb` is the product's signature: an armillary of three tilted rings orbiting
a molten core, drawn with a real perspective projection. Ring segments and their
satellites are depth-sorted per frame, so nearer geometry occludes what is behind
it, and satellites grow, brighten and blur as they swing toward the viewer. It
appears on the splash, in onboarding, on the paywall, as the Ask Mia presence and
as the floating Ask Mia button. `LoopDiagram` uses the same perspective idea for
the seven-stage product loop.

### Stateless animation

`CLAUDE.md` forbids `StatefulWidget`. Continuous animation is therefore driven by
`flutter_animate` (`.animate(onPlay: (c) => c.repeat())`) and one-shots by
`TweenAnimationBuilder`. Feature code never writes an `AnimationController`.

---

## 7. Every state is designed

`MiaStateKind` covers loading, skeleton, empty, caught-up, queued, partial data,
offline, timeout, permission denied, duplicate, stale data, reconnect, cancelled,
failure and recovering. Use `MiaStateView` for full-surface states,
`MiaNoticeStrip` for inline caveats, `SkeletonBlock` / `SkeletonTileList` for
loading — skeletons mirror the shape of what they replace so the layout never
jumps.

"You are caught up" is a designed destination, not an empty list.

---

## 8. Evidence is a visual element

The brief's core promise — Mia never invents a number — is expressed visually:

- `CalculationMetaPanel` on every material figure: version, window, as-of,
  records used, exclusions, missing data, assumptions, completeness bar.
- `SourceBadge` / `ValueSource` colouring shows whether a value came from the
  provider, Mia's mapping, an AI suggestion or the user.
- `ClassificationLayersPanel` stacks the three transaction layers so it is
  obvious the provider's evidence still exists underneath a correction.
- `FreshnessChip` never says "live" unless the source timestamp supports it.

---

## 9. Copy

- Sentence case everywhere except `overline`.
- Australian English: *organise*, *recognise*, *personalised*.
- Plain and specific. "Two identical $239 debits", not "Potential duplicate
  detected".
- Boundaries are stated in the product's own words: comparison only, eligibility
  not assessed, written warranty only, nothing is collected before consent.
- No hype, no streaks, no points, no fake urgency.

---

## 10. Localisation

UI chrome lives in `lib/l10n/app_en.arb` and is read through `context.l10n`.
Content that in production would come from the backend (transaction
descriptions, review reasons, help articles, Ask Mia answers) lives in the dummy
data layer, because that is the layer a real API replaces.

---

## Quick checklist before shipping a screen

- [ ] `BaseText` only, sized from `AppTypography`
- [ ] Colours from `AppColors`, opacity via `withCustomOpacity`
- [ ] Sizes via `getSize` / `getFontSize`, gaps via `verticalSpace` / `horizontalSpace`
- [ ] Built on `MiaScaffold` + `AuroraBackground` with a chosen `AuroraMood`
- [ ] Content wrapped in staggered `Reveal`s
- [ ] Every tap target is a `Pressable` (or a widget that already wraps one)
- [ ] Loading, empty and failure states designed, not improvised
- [ ] Material figures carry their provenance
- [ ] Status shown with icon + word, never colour alone
- [ ] Sub-widgets extracted into `widgets/` classes — no `_buildX()` in views
