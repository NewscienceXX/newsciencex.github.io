# NewScience — Landing Page

A **static** marketing site. No build step, no server-side code, no framework.
Just serve these files as static assets.

## Files

| File | Purpose |
|---|---|
| `index.html` | The page. **All CSS and JS are inline.** This is the entry point. |
| `flow-canvas.html` | "Agentic Discovery Swarm" visual (embedded by `index.html` via an `<iframe>`) |
| `repro-engine.html` | "Reproducibility Engine" visual (iframe) |
| `biowiki-tree.html` | "BioWiki Knowledge Graph" visual (iframe) |
| `autonomous-economy.html` | "Autonomous Economy" visual (iframe) |
| `token.css` | Design tokens — **reference only**, not loaded at runtime |
| `brand.md` | Brand/design-system notes — **reference only** |
| `serve.mjs` | Tiny zero-dependency static server for local preview |

## Host it

Upload the whole folder to any static host and point the domain at `index.html`:

- **Netlify / Vercel / Cloudflare Pages** — drag-and-drop or connect a repo; no build command, publish directory = this folder.
- **S3 + CloudFront**, **nginx**, **Apache**, GitHub Pages, etc. — serve the folder root.

> **Important:** keep all the `.html` files **together at the same origin** (same
> domain). `index.html` embeds the four visual files as same-origin iframes and
> sizes / drives their animations with same-origin JavaScript. If they're served
> from a different domain, the visuals won't size or animate correctly.

## Local preview

```bash
node serve.mjs          # → http://localhost:3000
# or, without Node:
python3 -m http.server  # → http://localhost:8000
```

## Runtime dependencies

- **Google Fonts** (Inter + Red Hat Mono), loaded from `fonts.googleapis.com`.
  Needs outbound internet, or self-host the fonts if your domain must be offline/CSP-locked.
- Nothing else — no JS libraries, no API calls.

## Before going live (TODOs for content/links)

These are intentionally placeholders right now:

- **Footer links** (`Learn`, `Docs`, `Privacy Policy`, `Contact`) point to `#` — wire to real pages.
- The hero **"See how it works"** button links to `how-it-works.html`, which isn't built yet.
- The **"Request access" / "Join us"** form has **no backend** — on submit it just shows
  an inline "thank you". Hook the form's submit handler (search `joinForm` in `index.html`)
  up to your email/CRM endpoint.
- No `favicon.ico` is included (browsers will log a harmless 404) — add one if you like.

## Editing

Everything for the main page lives in `index.html` (markup + `<style>` + `<script>`).
Each visual is self-contained in its own `.html`. Colors/typography follow the tokens
documented in `token.css` / `brand.md`.
