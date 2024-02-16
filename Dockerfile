FROM rocker/shiny-verse:latest 
RUN apt-get update && apt-get install -y git 

RUN git clone https://github.com/rasharm1/wellsProject.git /srv/shiny-server/wells
RUN RScript packages.R /srv/shiny-server/wells/packages.R

EXPOSE 3838

CMD ["R", "-e", "shiny::runApp('/srv/shiny-server/wells', host = '0.0.0.0', port = 3838)"]