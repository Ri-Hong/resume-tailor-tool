# Resume tailoring instructions

This repository contains a master LaTeX resume and job-specific tailored resumes. These instructions are the Codex equivalent of `base.mdc` in `.cursor/rules/`. The Cursor rules remain in place for backward compatibility.

## Repository structure

- `master.tex` is the single source of truth for all experiences, projects, and skills.
- `resume_name.txt` is the optional global base name for generated resumes; if absent, use `resume`.
- `applications/{company}/{role}/` contains each job's exact `job_description.txt` and numbered resume versions.
- `applications/{company}/{role}/{version}/` contains the tailored `{resume_name}.tex` and, when generated, `{resume_name}.pdf`.

## Source-of-truth and job analysis

- Always read `master.tex` before tailoring a resume.
- Never invent experiences, projects, skills, companies, roles, achievements, metrics, or technologies. Only select, reorder, reword, condense, or remove content present in `master.tex`.
- Analyze the supplied job description to extract the company, role title, key skills/technologies, and primary focus areas.
- If the company or role cannot be inferred clearly, ask the user to provide them.
- Sanitize company and role directory names to lowercase, replacing spaces and special characters with hyphens (for example, `Google Cloud` becomes `google-cloud`).

## Files and versioning

- Check `applications/{company}/{role}/` before creating output. Use version `1` when it does not exist; otherwise use one greater than the highest existing numeric version.
- Determine the resume base name from an explicit user request first, then `resume_name.txt`, then default to `resume`.
- Sanitize an explicitly supplied name by replacing spaces with underscores and retaining only alphanumeric characters, underscores, and hyphens. If the user supplies a new name, save it as the single line in root `resume_name.txt` for future resumes.
- Create `applications/{company}/{role}/{version}/` as needed.
- Save the job description exactly as provided by the user, verbatim and unmodified, at `applications/{company}/{role}/job_description.txt`. Preserve formatting, line breaks, and content. Save it only if that role-level file does not already exist.
- Save the tailored source as `applications/{company}/{role}/{version}/{resume_name}.tex`; generated PDFs use the same base name.

## Tailoring and prioritization

- Select the most relevant content for the job and put the strongest matches first.
- Include about 3–4 relevant work experiences and 2–3 relevant projects when possible.
- Use no more than 2–3 bullets per experience and 1–2 bullets per project.
- Reword bullets to emphasize relevant, factual skills, job-description keywords, metrics, and impact.
- Condense aggressively: merge related achievements, remove filler, and remove less relevant content when necessary.
- Do not use placeholders such as `X` or `Y`.
- The final resume must compile to exactly one page on US Letter paper (8.5 × 11 inches). If it is too long, reduce bullets, merge and shorten descriptions, remove lower-priority experiences/projects, reduce spacing while keeping readability, and keep education minimal. If it is too short, add more relevant content from `master.tex` while remaining within one page.

## Layout and LaTeX integrity

- Preserve the existing header, education, contact format, and LaTeX macros. Do not break, rename, or redefine commands or environments such as `\\resumeSubheading`, `\\resumeItemListStart`, `\\resumeItemListEnd`, and `\\resumeItem`.

## Formatting and emphasis

- In experience and project bullets, selectively use `\\textbf{}` for important programming languages, frameworks, tools, methodologies, and other keywords that match the job requirements. Bold only 1–3 key terms per bullet when possible.
- In the skills section, bold only category headers such as `\\textbf{Languages:}`, `\\textbf{Technologies:}`, and `\\textbf{AI/ML:}`. Never bold individual skills, tools, languages, or frameworks in that section.
- Keep the result factual, natural, concise, professional, and ATS-friendly.

## Completion checks

Before finalizing, verify that:

- all included content comes from `master.tex`;
- the output path, sanitized name, and version are correct;
- the job description is verbatim when newly saved;
- LaTeX environments and braces are balanced;
- the document compiles cleanly and is exactly one page.

---

# Personal preferences (optional)

Add user-specific resume preferences below this separator. Keep the shared repository workflow above it.
