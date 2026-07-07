# Publishing a new blog post — 5-minute checklist

The blog is plain static HTML. There is **no build step and no code to run**.
Every post is one self-contained file in `/blog/`. All styling lives in one
shared stylesheet (`/css/blog.css`), so posts stay short and always match the
brand.

## Steps

1. **Copy the template.**
   Duplicate `blog/_template.html` and rename it to your slug, e.g.
   `blog/how-to-price-a-new-project.html`
   (lowercase, words-separated-by-dashes, ends in `.html`).

2. **Fill in the blanks.** Open the new file and replace every
   `<!-- FILL: ... -->` marker. There are only a handful:
   - **title** (≤ 60 characters) — used in the `<title>`, OG/Twitter, and JSON-LD.
   - **meta description** (≤ 155 characters).
   - **slug** — must exactly match the filename (appears in canonical, og:url, JSON-LD).
   - **category** (e.g. Recovery, Sales, ERP), **date** (e.g. `July 8, 2026`
     for display and `2026-07-08` for JSON-LD/sitemap), **read time**.
   - **the article body** — write inside `<div class="prose">`:
     one `<h1>` (already in place), `<h2>` for sections, `<h3>` for sub-points,
     `<p>`, `<ul>/<li>`, `<blockquote>`, `<strong>`.
   Put your **target keyword in the H1 and the first paragraph**, naturally.
   **Never invent statistics.**

3. **Remove the noindex line.** Delete
   `<meta name="robots" content="noindex">` near the top — it exists only so the
   blank template never gets indexed.

4. **Add it to the blog index.** Open `blog/index.html`, find the
   `POST CARDS — newest first` comment, and paste the **CARD snippet** (it's at
   the bottom of `_template.html`) right below it, newest at the top. Edit the
   slug, category, date, title and excerpt.

5. **Add it to the sitemap.** Open `sitemap.xml` and paste the **SITEMAP
   snippet** (also at the bottom of `_template.html`) before `</urlset>`.
   Set the correct slug and `lastmod` date.

6. **Commit and push.** After it deploys, do the one Search Console step below
   so Google picks it up quickly.

## After publishing — tell Google (optional but fast)

1. Go to **search.google.com/search-console** → select the `nexunova.com` property.
2. Left menu → **Sitemaps** → the existing `sitemap.xml` is already listed →
   click the ⋮ / row and **Resubmit** (or just re-enter `sitemap.xml` → Submit).
3. Optional: paste the new post's full URL into the top **URL inspection** bar →
   **Request indexing**.

## Notes

- **Images:** by default posts share the site card (`/assets/og-cover.jpg`) for
  social previews — no image work needed. To use a custom preview, drop a
  1200×630 image in `/assets/` and point the three `og:image` / `twitter:image`
  tags at it.
- **Styling all posts at once:** edit `/css/blog.css` and bump the `?v=1` in the
  `<link ... blog.css?v=1>` on each page so browsers fetch the new version.
- **Do not** change the header/footer markup per post — keep it identical so the
  nav stays consistent everywhere.
