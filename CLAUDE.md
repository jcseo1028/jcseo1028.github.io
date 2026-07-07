# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

This is `jcseo1028.github.io` — a personal Jekyll blog deployed via GitHub Pages, built by directly forking the **Minimal Mistakes** Jekyll theme (rather than consuming it as a `theme:`/`remote_theme:` gem dependency — both are blank in `_config.yml`). That means the repo root serves two purposes at once:

- **The personal site**: `_config.yml`, `_posts/`, `_pages/`, `_data/` at the repo root are the actual blog (Korean-language, `minimal_mistakes_skin: "dark"`, Disqus comments, Google gtag analytics).
- **The vendored theme source**: `_includes/`, `_layouts/`, `_sass/`, `assets/`, and `minimal-mistakes-jekyll.gemspec` are the Minimal Mistakes theme's own code, checked in directly so it can be edited in place.

`docs/` and `test/` are the upstream theme's own demo/test Jekyll sites (their own `_config.yml`, `Gemfile`, sample posts/pages), carried over from the original theme repo this was forked from. They are explicitly excluded from the personal site build (see `exclude:` in root `_config.yml`) and are not part of the deployed blog — don't confuse their content with the real site.

`_qDailyReport/`, `_stock/`, `_withGPT/` are personal notes/working files (xlsx, pdf, docx, txt, misc markdown) stored using the leading-underscore convention so Jekyll ignores them by default. They are not blog content and are not part of the site build.

## Commands

Ruby/Jekyll:
```
bundle install                # install Jekyll + theme gem dependencies
bundle exec jekyll serve      # build + serve the personal site at http://localhost:4000
bundle exec jekyll build      # build the personal site into _site/
```

There is no test suite or linter configured for this repo. `rake preview` (see `Rakefile`) builds/serves the theme's `test/` demo site with live-reload via `listen` — it is a theme-development helper inherited from upstream, not the way to preview the personal blog (use `bundle exec jekyll serve` for that).

JS asset pipeline (theme vendor JS only — rarely needed for blog content changes):
```
npm run build:js     # uglify+minify assets/js/*.js into assets/js/main.min.js, then stamp a version banner (banner.js)
npm run watch:js     # rebuild main.min.js on source changes
```

Deployment is handled by GitHub Pages' built-in Jekyll build on push to `main` — there is no custom GitHub Actions deploy workflow. `.travis.yml` targets `docs/` (the upstream theme's algolia-indexed docs site) and is unrelated to deploying this personal blog.

## Content conventions

- Posts live in `_posts/`, named `YYYY-MM-DD-<slug>.md`. Jekyll reads `_posts/` recursively, so the `2022/`, `2023/`, `2024/` subfolders of older posts are still picked up alongside the flat files used for 2025+.
- Most posts are daily diary entries (`Diary_YYYYMMDD.md` historically, `Diary.md` in newer posts) with a recurring front-matter shape:
  ```yaml
  layout: posts
  comments: true
  title : " YYYY.MM.DD <note> "
  categories: Diary
  tags: [ <tag> ]
  published: false
  ```
- The `defaults` block in root `_config.yml` applies `layout: single`, `author_profile: true`, `read_time: true`, `comments: true`, `share: true`, `related: true`, `show_date: true` to every post in `_posts/` — no need to repeat these in front matter unless overriding.
- Categories/tags archives are Liquid-based (`category_archive`/`tag_archive` type: `liquid`) at `/categories/` and `/tags/`, backed by `_pages/category-archive.md` and `_pages/tag-archive.md`.
