# PeCNO website integration changes

This patch is designed to add PeCNO as an additional project without overwriting the current homepage, because the live site may have evolved since the original starter ZIP.

## 1. Add the project page

Copy the complete directory:

`projects/pecno/`

into the website repository.

## 2. Append bibliography entries

Append the contents of:

`references_pecno_append.bib`

onto the existing root `references.bib`.

## 3. Add PeCNO to the homepage project grid

Add the following project card inside the existing `.project-grid`. A natural position is immediately after HyperFlux and before ABBDA:

```markdown
::: {.project-card}
### [Physics-Enforced Continuous Neural Operator](projects/pecno/index.qmd)

A continuous neural-field surrogate for AGN jet simulations combining hard physics projection, adaptive conformal uncertainty calibration and controlled generative recovery of smaller spatial scales.

**Themes:** Scientific ML · Neural fields · Uncertainty quantification · Physics enforcement
:::
```

If the site currently calls the project simply **PeCNO**, use:

```markdown
### [PeCNO](projects/pecno/index.qmd)
```

instead; the destination is unchanged.

## 4. Add the project to `projects.qmd`

Add:

```markdown
## Physics-Enforced Continuous Neural Operator (PeCNO)

[Read the full case study →](projects/pecno/index.qmd)

A continuous surrogate for idealised AGN jet simulations that maps space, time and Eddington ratio to hydrodynamic fields, enforces selected physical constraints after prediction, diagnoses conformal-calibration failure under parameter and temporal shift, and recalibrates uncertainty online using adaptive conformal inference.
```

A sensible ordering is:

1. HyperFlux
2. Physics-Enforced Continuous Neural Operator (PeCNO)
3. ABBDA
4. Adaptive Scientific Campaigns

## 5. Add to latest writing

Under `## Latest writing` on the homepage, add:

```markdown
- [PeCNO: Physics-Enforced Continuous Neural Operator](projects/pecno/index.qmd)
```

## 6. No navigation-bar change is required

The current site links to a general `Projects` page from the navigation bar, so PeCNO can be exposed through the homepage and project index without adding another top-level nav item.

## 7. Validate locally

From the repository root:

```bash
quarto preview
```

Check:

- all eight PeCNO figures render;
- the architecture figure is used as the page/social preview image;
- bibliography citations resolve;
- equations render correctly;
- the homepage card points to `projects/pecno/index.qmd`;
- `projects.qmd` includes PeCNO;
- ABBDA and HyperFlux links remain unchanged.

Then build the production site with:

```bash
quarto render
```
