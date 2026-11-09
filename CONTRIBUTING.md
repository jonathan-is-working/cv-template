# Contributing to Minimalist Typst CV Template

Thank you for considering contributing to this template! 🎉

## How Can You Contribute?

- **Reporting Bugs**: Check existing issues first. If not found, open a [Bug Report](.github/ISSUE_TEMPLATE/bug_report.md).
- **Suggesting Enhancements**: Open a [Feature Request](.github/ISSUE_TEMPLATE/feature_request.md).
- **Submitting Pull Requests**: Improvements to typography, documentation, ATS compatibility, or new modular features are welcome.

## Development Workflow

1. **Fork and clone the repository**
2. **Make your changes**:
   - Keep styling and layout in `template.typ`.
   - Ensure the template maintains a strict **single-page** format when populated with reasonable standard length.
   - Keep instructional guidelines in `content-fr.typ` and `content-en.typ` clear and actionable.
3. **Verify locally**:
   ```sh
   make check
   ```
4. **Regenerate preview images if modifying visual layout**:
   ```sh
   make previews
   ```
5. **Submit your Pull Request** with a descriptive title and summary of changes.

## Guidelines

- **Simplicity first**: Avoid unnecessary visual clutter. The goal is clean ATS-friendly minimalism.
- **Cross-platform**: Rely only on standard fonts bundled with Typst (e.g. *New Computer Modern*).
- **Language symmetry**: Any structural modification to the French template should be reflected in the English version.

By contributing, you agree that your contributions are licensed under the project's terms (MIT OR Apache-2.0).
