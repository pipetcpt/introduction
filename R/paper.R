# setup ----

library(knitcitations) # install.packages('knitcitations')
library(tidyverse)
library(RefManageR)

read_csv('doi.csv')$doi %>% map(knitcitations::citep)
write.bibtex(file = 'papers.bib') 

# read ----

papers_raw <- ReadBib('papers.bib')
#capture.output(papers_raw, file = 'papers.Rmd')
capture.output(print(papers_raw, 
                     .opts = list(bib.style = "numeric", sorting = "ydnt")), 
               file = 'papers.txt')
write_lines(c('# PIPET Papers (2017-Present)', 
              readr::read_lines('papers.txt')), 'papers.Rmd')
rmarkdown::render('papers.Rmd', 'github_document')
system('cp papers.html docs/index.html')
browseURL('docs/index.html')


# papers_raw[year='2017']
