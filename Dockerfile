FROM r-base
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y r-cran-rjava && \
    R CMD javareconf -e && \
    wget https://s3.amazonaws.com/par-connector-tutorial/par-connector-tutorial-R-x86_64-pc-linux-gnu.tar.gz && \
    Rscript -e "dir.create(Sys.getenv('R_LIBS_USER'), recursive=TRUE);install.packages(c('rJava', 'gtools', 'codetools', 'stringr'), Sys.getenv('R_LIBS_USER'), repo='http://cran.case.edu');install.packages('par-connector-tutorial-R-x86_64-pc-linux-gnu.tar.gz', Sys.getenv('R_LIBS_USER'), repos = NULL)"