# Resume Management System

A LaTeX-based resume system that helps you maintain a master resume and automatically generate tailored versions for each job application.

## 📁 Repository Structure

```
resumes/
├── master.tex              # Master resume with ALL experiences and projects
├── resume_name.txt         # Global resume name (optional, defaults to "resume")
├── applications/           # Job-specific resumes
│   └── {company}/          # Company directory (auto-created)
│       └── {role}/         # Role directory (auto-created)
│           ├── job_description.txt   # Job description (shared across versions)
│           └── {version}/  # Version directory (auto-created, starts at 1)
│               ├── {resume_name}.tex     # Tailored resume LaTeX file
│               └── {resume_name}.pdf    # Compiled PDF (if generated)
├── cleanup.sh             # Script to remove LaTeX auxiliary files
```

**Example:**

```
resumes/
├── resume_name.txt         # Contains: "John_Doe"
└── applications/
    └── aws/
        └── backend-engineer-intern/
            ├── job_description.txt   # Shared across all versions
            ├── 1/
            │   ├── John_Doe.tex
            │   └── John_Doe.pdf
            └── 2/
                ├── John_Doe.tex
                └── John_Doe.pdf
```

## 🔧 Setup

### Installing LaTeX for VS Code

To compile and preview LaTeX resumes in VS Code, you'll need to install LaTeX and configure the LaTeX Workshop extension. Follow the detailed instructions at:

**https://mathjiajia.github.io/vscode-and-latex/**

Once installed, you can compile `.tex` files directly in VS Code using `Ctrl + Alt + B` (Windows) or `Option + Cmd + B` (macOS). You can also press the green play button on any opened LaTeX file.

## Set Resume Name (First Time Only)

Before creating your first resume, set your desired resume filename by editing `resume_name.txt` in the root directory:

```bash
echo "John_Doe" > resume_name.txt
```

Or manually edit the file and add your desired name. This name will be used for all generated resume files. For example, if the file contains `John_Doe`, all generated resumes will be called `John_Doe.pdf`. . If you don't set this, files will default to "resume".

## 📋 Master Resume (`master.tex`)

The `master.tex` file is your **single source of truth**. It contains:

- All your work experiences (even if not all fit on one page)
- All your projects
- All your skills
- Education and contact information

**Important:** When adding new experiences or projects, always add them to `master.tex` first. The AI will then select from the master when tailoring for specific jobs.

## 🎯 Workflow

1. **Maintain Master Resume**: Keep `master.tex` updated with all your experiences
2. **Paste Job Description**: Copy the full job posting and paste it into Cursor
3. **AI Tailors Resume**: Cursor automatically:
   - Extracts company and role (or asks if unclear)
   - Determines the next version number
   - Determines resume name from root `resume_name.txt` (or defaults to "resume" if file doesn't exist)
   - Creates the directory structure `applications/{company}/{role}/{version}/`
   - Saves the job description to `applications/{company}/{role}/job_description.txt` (only if it doesn't already exist)
   - Generates a tailored resume with the name from `resume_name.txt`
4. **Compile & Submit**: Generate PDF and submit your application

**Multiple Versions:** If you want multiple tailored resumes for the same role (e.g., emphasizing different skills), simply paste the job description again. Cursor will automatically create the next version number.

**Custom Resume Names (Global):** Edit `resume_name.txt` in the root directory to set your desired resume filename. This name will be used for all generated resume files across all applications. You can change it anytime by editing the file.

## 🛠️ Utilities

### Cleanup Script

When compiling the LaTeX, it will generate auxiliary file. This script removes them:

```bash
./cleanup.sh
```

This removes `.aux`, `.log`, `.out`, `.synctex.gz` files while keeping `.tex` and `.pdf` files.

## 📝 Best Practices

1. **Always update master.tex first**: When you have a new experience or project, add it to `master.tex` before tailoring resumes
2. **Keep job descriptions**: The `job_description.txt` file is automatically saved for your reference
3. **Version control**: Commit your master resume and job-specific resumes to track changes
4. **Manual edits**: You can always edit the resume `.tex` file directly, or edit root `resume_name.txt` to change the filename globally

## ❓ FAQ

**Q: Can I have multiple versions of the master resume?**  
A: No, keep one `master.tex` with everything. The system is designed to select from a single source of truth.

**Q: What if a job directory already exists?**  
A: Cursor will automatically create a new version. For example, if `applications/google/software-engineer/1/` exists, it will create `applications/google/software-engineer/2/`. This allows you to have multiple tailored resumes for the same role.

## 📄 License

This resume template is adapted from Jake Gutierrez's LaTeX resume template.
