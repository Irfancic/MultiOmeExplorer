FROM openanalytics/r-base


# system libraries of general use
RUN apt-get update && apt-get install -y \
    sudo \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev \
    libssl1.1

# basic shiny functionality
RUN R -e "install.packages(c('shiny', 'rmarkdown'), repos='https://cloud.r-project.org/')"

# install dependencies of the multiome app
RUN R -e "install.packages('pacman')"
RUN R -e "install.packages(c('visNetwork', 'ggiraph', 'cowplot', 'igraph'))"
RUN R -e "install.packages(c('tibble', 'dplyr', 'ggplot2'), repos='https://cloud.r-project.org/')"

# copy the app to the image
RUN mkdir /root/app
COPY app /root/app

COPY Rprofile.site /usr/lib/R/etc/

EXPOSE 3838

CMD ["R", "-e", "shiny::runApp('/root/app')"]
