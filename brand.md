# NewScience — Brand & Design System

The verification infrastructure for autonomous science. The brand must read as
**serious scientific tooling** — credible, precise, trustworthy. Restraint over
decoration; when in doubt, remove an element rather than add one.

**The look:** large, tight Inter display; pure-white surfaces with hairline
borders; monospace eyebrow labels; one near-black used for inversions. All tokens
below live in [`token.css`](token.css).

---

## Voice & tone

- Plain, specific, active voice. Short declaratives. No hype, no hedging.
- We say "verifies," "re-runs," "signs," "scores" — concrete verbs over abstractions.
- Real copy only — never lorem ipsum or placeholder text in anything shown finished.
- Claims are precise: "a physical run behind every claim, or it doesn't count."

---

## Logo / wordmark

- Wordmark is **"NewScience"** set in Inter `--w-semibold` (600), mixed case,
  letter-spacing `-0.01em`, ~20px. No uppercase wide-tracking, no serif.
- Always renders in `--ink` on light surfaces.

---

## Color

| Token | Hex | Use |
|---|---|---|
| `--ink` | `#0d1a30` | Primary text **and** the single dark inversion color |
| `--ink-soft` | `#2a4068` | Body copy, secondary text |
| `--ink-muted` | `#5a6b86` | Eyebrows, labels, captions, footer meta |
| `--paper` / `--surface` | `#ffffff` | All backgrounds and cards (elevated = same white) |
| `--surface-inv` | `#0d1a30` | Inverted surface — nav CTA, dark buttons |
| `--line` | `rgba(13,26,48,0.14)` | Hairline borders & dividers (structure, not fills) |
| `--cobalt` | `#1c4196` | Index numbers, gradient core, hover-gradient core |
| `--cobalt-light` | `#6f9be8` | Secondary blue in hover gradients / inverted surfaces |

**Rules**
- **One color system.** Every surface is white; depth and grouping come from
  `--line` hairlines, never from grey fills or drop shadows.
- **Dark inversion = CTAs only.** The nav CTA and primary buttons flip to the
  `--surface-inv` ink. Don't introduce a second dark tone.
- **Platform card hover = fixed blue/white gradient**, not the dark inversion.
  Each card carries a distinct `--card-grad` (a pale base + soft cobalt radial in
  a different position per card), revealed via a fading `::before`. Text stays
  dark — the gradient is light enough to keep WCAG AA. Same blue family as the
  hero, but static (no animation).
- **No dark sections.** The statement band and footer are white with borders, not
  dark panels.
- Contrast must meet **WCAG AA** minimum. Watch dark text sitting over the
  brighter parts of the hero gradient.

---

## Typography

Two families only: **Inter** (display + body) and **Red Hat Mono** (labels).
Never a serif. **Never italic** — emphasis is carried by weight and size, not slant.

- **Display** (`h1`–`h4`, statement, closing, section heads): Inter `--w-medium`
  (500), large, with **negative tracking** (`-0.02em` to `-0.03em`) and tight
  line-height (`0.98`–`1.05`). Bigger and more confident than typical — see the
  fluid `--fs-*` scale in `token.css`.
- **Body**: Inter `--w-light` (300), 16px, line-height `1.65`–`1.8`. `<strong>`
  bumps to 500 in `--ink`.
- **Labels / eyebrows / nav / buttons**: Red Hat Mono, uppercase, wide tracking
  (`--tracking-label` 0.28em; eyebrow 0.3em). Small (11–12px), `--ink-muted`.

| Role | Size token |
|---|---|
| Hero h1 | `--fs-display-1` |
| Closing h2 | `--fs-display-2` |
| Section heads | `--fs-display-3` |
| Statement | `--fs-statement` |
| Two-column h2 | `--fs-h2` |
| Audience name | `--fs-name` |
| Card title | `--fs-h3` |
| Outcome title | `--fs-h4` |
| Body | `--fs-body` |
| Card / caption | `--fs-small` |
| Eyebrow / label | `--fs-eyebrow` / `--fs-label` |

---

## Surfaces & depth

- Base → elevated → floating is expressed with **borders and the inversion**, not
  shadows. Cards are white blocks separated by 1px `--line` gaps inside a bordered
  grid (the `.systems` pattern).
- Buttons use `--radius-sm` (2px). Primary/CTA = filled `--ink`; ghost = 1px
  border on transparent.

---

## The gradient system

- A grainy cobalt gradient appears **only** on the hero and closing (CTA)
  sections. It is the brand's one expressive moment — keep it; don't spread it to
  content sections.
- It is an **animated** system (`.ns-bg`, inlined in `index.html` from
  `files/ns-hero-gradient.css`): four scenes of drifting blue blobs over a pale
  base (`linear-gradient(115deg,#e8eaec→#d6dde6)`) that crossfade on a 24s loop,
  with one `feTurbulence` grain overlay. Drop the `.ns-bg` block in as the first
  child of any section that is `position: relative; overflow: hidden`, with the
  content in a `z-index: 2` container. Respects `prefers-reduced-motion` (freezes
  on one static scene). `--gradient-hero` in `token.css` is the static fallback
  recipe, not the live system.

---

## Motion

- Animate **`transform`, `opacity`, and hover surface/color only**. Never
  `transition-all`. Over-animation reads as AI-generated — cut the accessory when
  unsure.
- Durations: links/buttons `--dur-fast` (0.2s); card-hover inversion `--dur-mid`
  (0.3s); nav-on-scroll `--dur-nav` (0.35s); scroll-reveal `--dur-reveal` (0.9s).
- Scroll-reveal is JS-gated (`.js-animations`) so content is never stuck hidden
  if JS fails.

---

## Accessibility (part of "professional")

- Visible `:focus-visible` on every interactive element.
- WCAG AA contrast minimum.
- `prefers-reduced-motion: reduce` disables reveals and transitions.
- Mobile-first; verify at a narrow width, not just desktop.
