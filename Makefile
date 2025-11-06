# Makefile for Final Project
# Usage:
#   make          -> build final report
#   make clean    -> remove generated files

# Paths and filenames
REPORT_FILE = doc/final_report.Rmd
OUTPUT_DIR = output
OUTPUT_FILE = $(OUTPUT_DIR)/final_report.pdf

R_SCRIPTS = src/01_prep_data.R src/02_create_table.R src/03_create_figure.R

# Default goal
all: $(OUTPUT_FILE)

# Rule to generate final report
$(OUTPUT_FILE): $(REPORT_FILE) $(R_SCRIPTS)
	@echo "Rendering final report from $< ..."
	@mkdir -p $(OUTPUT_DIR)
	Rscript -e "rmarkdown::render('$<', output_format = 'pdf_document', output_dir = '$(OUTPUT_DIR)')"
	@echo "Report successfully generated at $(OUTPUT_FILE)"

# Clean up
clean:
	@echo "Cleaning up generated files..."
	rm -f $(OUTPUT_FILE)
