# Dockerfile for Mental Health and Lifestyle Analysis Project
FROM rocker/r-ver:4.3.0

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libfontconfig1-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    pandoc \
    make \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /project

# Copy renv files
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R

# Create renv directory and settings file
RUN mkdir -p renv && echo '{}' > renv/settings.json

# Install renv and restore packages
RUN R -e "install.packages('renv', repos = 'https://cloud.r-project.org/')"
RUN R -e "renv::restore()"

# Copy project files
COPY Makefile Makefile
COPY packages.R packages.R
COPY data/ data/
COPY src/ src/
COPY doc/ doc/

RUN mkdir -p output && chmod 777 output

CMD ["make", "all"]