# portfolio-worklog

A small public worklog: short project notes that feed the microblog section of my portfolio site. Everything in this repository is public. Entries are written in English.

## Structure

```
<project-name>/            kebab-case folder, one per project
  index.md                 project description
  YYYY-MM-DD-slug.md       worklog entries
  assets/                  images for this project only
_templates/                Obsidian templates (not published)
_drafts/                   local drafts (not published, not tracked)
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
| `title` | Entry title |

## Underscore rule

The site's content loader ignores any folder or file whose name starts with `_`.

## Attachments

- Keep them inside the `assets/` folder of the same project.
- Images: up to ~300 KB each.
- Video: no files, link to YouTube instead.
- Use standard Markdown links with relative paths, not Obsidian wikilinks.
