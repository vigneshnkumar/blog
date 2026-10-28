# Vignesh Kumar | Engineering Journal

Practical notes on software engineering, test automation, Java, DevOps, and AI.

**Live:** https://vigneshnkumar.github.io/blog/ · **Portfolio:** https://vigneshnkumar.github.io/

Built with [Jekyll](https://jekyllrb.com/) and the [Chirpy](https://github.com/cotes2020/jekyll-theme-chirpy) theme
(started from the official [chirpy-starter](https://github.com/cotes2020/chirpy-starter)). On every push to `main`,
GitHub Actions builds the site, checks it for broken links and deploys it to GitHub Pages. It's free and you don't
need to install anything to publish.

---

## Write and publish a post (Windows PowerShell)

All commands run from the repo folder:

```powershell
cd C:\Users\vigne\PortfolioCleanup\blog
```

### 1. Create a draft

```powershell
.\tools\new-post.ps1 "Understanding Jenkins Pipelines"
code .\_drafts\understanding-jenkins-pipelines.md
```

This copies [`_templates/post.md`](_templates/post.md) into `_drafts/` and fills in the title and date.
You can also copy the template by hand.

> If PowerShell blocks the script, allow local scripts once for your user:
> `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`

**Files in `_drafts/` are never published.** Commit and push drafts as often as you like to back them up.

### 2. Write in Markdown

Edit the front matter at the top:

```yaml
---
title: "Understanding Jenkins Pipelines"
date: 2026-11-02 09:00:00 -0500
categories: [DevOps, CI/CD]        # up to 2 levels: [Main, Sub]
tags: [jenkins, ci-cd, groovy]     # lowercase
description: One-sentence summary for the home page and search.
---
```

Then write the body in normal Markdown. Useful extras:

| Want | Write |
| --- | --- |
| Syntax-highlighted code | a fenced code block with a language name, e.g. `java`, `typescript`, `python`, `powershell`, `yaml` |
| Tip / warning box | a `>` quote followed by `{: .prompt-tip }` (or `prompt-info`, `prompt-warning`, `prompt-danger`) |
| Image | put it in `assets/img/posts/<post-slug>/` and write `![alt text](/assets/img/posts/<post-slug>/pic.png)` |
| Table of contents | automatic from `##` / `###` headings |

Image paths start with `/assets/...`. **Don't** add `/blog`; Chirpy adds it for you.

### 3. Publish

Move the draft into `_posts/`, naming it `YYYY-MM-DD-slug.md`, then push:

```powershell
Move-Item .\_drafts\understanding-jenkins-pipelines.md .\_posts\2026-11-02-understanding-jenkins-pipelines.md
git add -A
git commit -m "Post: Understanding Jenkins Pipelines"
git push
```

Watch the deploy under **Actions** on GitHub (about 1–2 minutes). The post appears at
`https://vigneshnkumar.github.io/blog/posts/understanding-jenkins-pipelines/`.

To fix a typo later, edit the file in `_posts/`, then commit and push again. To unpublish, move it back to `_drafts/`.

---

## Preview locally (optional)

You don't need this to publish. It lets you see drafts exactly as they'll look before you push.
Pick **one** option.

**Option A: Docker (no Ruby install).** Docker Desktop must be running.

```powershell
docker run --rm -it -p 4000:4000 -v "${PWD}:/srv/site" -v blog-gems:/usr/local/bundle -w /srv/site ruby:3.4 `
  bash -c "bundle install && bundle exec jekyll s -H 0.0.0.0 --drafts --force_polling"
```

Open http://localhost:4000/blog/ and press `Ctrl+C` to stop. The first run takes a minute while it downloads gems; later runs are fast.

**Option B: VS Code Dev Containers.** This is the official Chirpy route. Install the "Dev Containers" extension, run
*Dev Containers: Reopen in Container*, then run `bundle exec jekyll s --drafts` in the VS Code terminal.

**Option C: Native Ruby.** Install Ruby+Devkit 3.4 from https://rubyinstaller.org/ (see the
[Jekyll on Windows guide](https://jekyllrb.com/docs/installation/windows/)), then:

```powershell
bundle install
bundle exec jekyll s --drafts
```

Leave out `--drafts` to see exactly what production will show.

---

## Project layout

```
_posts/       published articles (YYYY-MM-DD-slug.md)
_drafts/      unpublished work (never deployed)
_templates/   post.md: starting point for new articles
_tabs/        sidebar pages (About, Categories, Tags, Archives)
_data/        contact.yml: sidebar social links
assets/img/   avatar and post images
_config.yml   site settings (title, URL, baseurl: /blog, author, theme)
tools/        new-post.ps1 helper
.github/workflows/pages-deploy.yml   build + link check + deploy
```

**Key settings in `_config.yml`:** `url: https://vigneshnkumar.github.io` and `baseurl: /blog`. Keep both as they are,
or links and CSS will break. Dark and light mode follow the reader's system setting, with a toggle in the sidebar.
To force one mode, set `theme_mode: light` or `theme_mode: dark`.

## Upgrading the theme

The theme comes in as a Ruby gem pinned in the `Gemfile` (`~> 7.6`), so minor updates arrive automatically on the next build.
For a major version, see the [Chirpy upgrade guide](https://github.com/cotes2020/jekyll-theme-chirpy/wiki/Upgrade-Guide).

## License

Site code from chirpy-starter is MIT (see `LICENSE`). Article content © Vignesh Kumar.
