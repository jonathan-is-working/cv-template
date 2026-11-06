# Output Directory

This directory holds compiled PDF files generated during the build process.  
All `.pdf` files in this directory are **ignored by Git** (`.gitignore`) to ensure your personal details are never published to GitHub.

### Build Commands

```sh
# Using Make:
make           # Generates output/cv-en.pdf and output/cv-fr.pdf
make en        # Generates output/cv-en.pdf
make fr        # Generates output/cv-fr.pdf

# Using Typst CLI:
typst compile src/cv-en.typ output/cv-en.pdf
typst compile src/cv-fr.typ output/cv-fr.pdf
```
