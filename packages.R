# packages.R - R Dependencies Installation Script

# List all required packages for running the Rmd and R scripts
required_packages <- c(
    "rmarkdown", 
    "knitr",     # R Markdown core
    "tidyverse", # Including ggplot2, dplyr, tidyr, readr...
    "here"       
)

# Function to check and install packages
for (pkg in required_packages) {
    if (!requireNamespace(pkg, quietly = TRUE)) {
        install.packages(pkg, dependencies = TRUE, repos = "https://cloud.r-project.org/")
    }
}

# HTML report
print("All R dependencies (rmarkdown, tidyverse, here) checked and installed.")