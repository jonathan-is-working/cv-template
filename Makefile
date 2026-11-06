.PHONY: all fr en watch-fr watch-en check previews clean help

# Default target
all: en fr ## Compile all CVs into output/ (EN & FR)

en: output/cv-en.pdf ## Compile English resume to output/cv-en.pdf

fr: output/cv-fr.pdf ## Compile French resume to output/cv-fr.pdf

output/cv-en.pdf: src/cv-en.typ src/template.typ src/assets/avatar.svg
	@mkdir -p output
	@echo "==> Compiling English CV to output/cv-en.pdf..."
	typst compile src/cv-en.typ output/cv-en.pdf
	@echo "✓ output/cv-en.pdf ready."

output/cv-fr.pdf: src/cv-fr.typ src/template.typ src/assets/avatar.svg
	@mkdir -p output
	@echo "==> Compiling French CV to output/cv-fr.pdf..."
	typst compile src/cv-fr.typ output/cv-fr.pdf
	@echo "✓ output/cv-fr.pdf ready."

watch-en: ## Live watch mode for English CV
	@mkdir -p output
	typst watch src/cv-en.typ output/cv-en.pdf

watch-fr: ## Live watch mode for French CV
	@mkdir -p output
	typst watch src/cv-fr.typ output/cv-fr.pdf

check: all ## Verify that all CVs strictly fit on 1 page and are ATS readable
	@echo "==> Checking page counts (must be strictly 1 page)..."
	@EN_PAGES=$$(pdfinfo output/cv-en.pdf | grep "Pages:" | awk '{print $$2}'); \
	FR_PAGES=$$(pdfinfo output/cv-fr.pdf | grep "Pages:" | awk '{print $$2}'); \
	if [ "$$EN_PAGES" -ne 1 ]; then \
		echo "✗ Error: output/cv-en.pdf has $$EN_PAGES pages (expected 1)"; exit 1; \
	fi; \
	if [ "$$FR_PAGES" -ne 1 ]; then \
		echo "✗ Error: output/cv-fr.pdf has $$FR_PAGES pages (expected 1)"; exit 1; \
	fi; \
	echo "✓ Page count check passed: strictly 1 page for EN and FR."
	@echo "==> Checking text extraction (ATS test)..."
	@pdftotext output/cv-en.pdf - | grep -q "EDUCATION" && echo "✓ EN text extraction OK"
	@pdftotext output/cv-fr.pdf - | grep -q "FORMATION" && echo "✓ FR text extraction OK"

previews: all ## Regenerate README preview images in assets/
	@echo "==> Generating preview PNGs..."
	@pdftoppm -png -r 150 output/cv-en.pdf assets/preview-en
	@mv -f assets/preview-en-1.png assets/preview-en.png
	@pdftoppm -png -r 150 output/cv-fr.pdf assets/preview-fr
	@mv -f assets/preview-fr-1.png assets/preview-fr.png
	@echo "✓ Previews generated in assets/."

clean: ## Remove compiled PDFs from output/
	rm -f output/*.pdf
	rm -f assets/preview-*-*.png
	@echo "✓ Clean complete."

help: ## Show this help message
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2}'
