# ABBDA website integration changes

This patch deliberately does **not** overwrite your current homepage because it has been edited since the original starter ZIP.

## 1. Add the project page

Copy:

`projects/abbda/index.qmd`

and its `figures/` directory into the website repository.

## 2. Append bibliography entries

Append the contents of `references_abbda_append.bib` to the site's existing root `references.bib`.

## 3. Update the homepage ABBDA card

In the current `index.qmd`, change the ABBDA heading from plain text to:

```markdown
### [ABBDA](projects/abbda/index.qmd)
```

Keep the current summary text:

> Efficient monitoring and change detection in massive data streams when observing everything is prohibitively expensive.

Remove the old:

```html
<div class="status">Portfolio case study in preparation.</div>
```

## 4. Update `projects.qmd`

Replace the ABBDA placeholder with:

```markdown
## ABBDA

[Read the full case study →](projects/abbda/index.qmd)

Adaptive sensing for quickest change detection under hard observation budgets. ABBDA learns how to allocate a fixed number of observations across massive data streams while preserving coverage, detecting persistent change and identifying its source.
```

## 5. Optional latest-writing link

Under `## Latest writing` on the homepage, add:

```markdown
- [ABBDA: Learning Where to Look](projects/abbda/index.qmd)
```

## 6. Validate

From the repository root:

```bash
quarto preview
```

Check the ABBDA page at the local preview URL, verify figure rendering, then run:

```bash
quarto render
```
