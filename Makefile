# Makefile for Final Project
# Usage:
# 	make 		 -> build final report (with dependency check)
# 	make clean	 -> remove generated files
# 	make install -> restore the renv package environment

# Paths and filenames
REPORT_FILE = doc/final_report.Rmd
OUTPUT_DIR = output
OUTPUT_FILE = $(OUTPUT_DIR)/final_report.html

R_SCRIPTS = src/01_prep_data.R src/02_create_table.R src/03_create_figure.R

# The main target: first install packages, then generate the report
all: install $(OUTPUT_FILE)

# Rule to restore the renv package environment (Final Project 6 requirement)
install: renv.lock
	@echo "Restoring R package environment using renv..."
	# Installs renv if it's not available globally
	Rscript -e "if (!requireNamespace('renv', quietly = TRUE)) install.packages('renv', dependencies = TRUE)"
	# Restores the environment based on renv.lock
	Rscript -e "renv::restore()"
	@echo "R package environment restored via renv."

# Rule to generate final report
$(OUTPUT_FILE): $(REPORT_FILE) $(R_SCRIPTS)
	@echo "Rendering final report from $< ..."
	@mkdir -p $(OUTPUT_DIR)
	# Execute rendering using Rscript
	Rscript -e "rmarkdown::render('$<', output_format = 'html_document', output_dir = '$(OUTPUT_DIR)')"
	@echo "Report successfully generated at $(OUTPUT_FILE)"

# Clean up
clean:
	@echo "Cleaning up generated files and renv state..."
	rm -f $(OUTPUT_FILE)
	# Remove processed data and figures
	rm -f data/processed_data.rds
	rm -f $(OUTPUT_DIR)/*.png
	# Optional: Clean up renv's local cache
	Rscript -e "if (requireNamespace('renv', quietly = TRUE)) renv::clean(actions = 'cache')"

# Phony targets do not correspond to actual files
.PHONY: all install clean