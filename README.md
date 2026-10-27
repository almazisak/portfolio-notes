# portfolio-notes

A small public worklog: short project notes that feed the microblog section of my portfolio site. Everything in this repository is public. Entries are written in English.

## Structure

```
<project-name>/            kebab-case folder, one per project
  index.md                 project description
  YYYY-MM-DD-slug.md       posts (the slug is optional: YYYY-MM-DD.md also works)
  assets/                  images for this project only
_templates/                Obsidian templates (not published)
```

## Frontmatter

Project (`index.md`):

| Field | Description |
| --- | --- |
| `title` | Project name |
| `status` | `exploring`, `in progress` or `shipped` |
| `cover` | Relative path to a cover image, e.g. `./assets/cover.jpg` |
| `summary` | One-line description |
| `case` | Optional link to a full case study |

Entry (`YYYY-MM-DD-slug.md`):

| Field | Description |
| --- | --- |
| `date` | `YYYY-MM-DD` |
| `title` | Optional. Heading of the post; leave empty for a short post without one |

## How posts are shown

On the site each project is a feed: all of its posts, newest first, with the full text visible. Long posts are collapsed behind a "Read more" button. The date of a post links to its own page.

## Underscore rule

The site's content loader ignores any folder or file whose name starts with `_`.

## Attachments

- Keep them inside the `assets/` folder of the same project.
- Images: up to ~300 KB each.
- Video: no files, link to YouTube instead.
- Use standard Markdown links with relative paths, not Obsidian wikilinks.
