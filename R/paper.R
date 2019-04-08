# setup 

library(knitcitations) # install.packages('knitcitations')
library(tidyverse)
read_csv('doi.csv')$doi %>% map(knitcitations::citep)

# export

write.bibtex(file = 'papers.bib')
papers_raw <- read.bibtex('papers.bib')
browseURL('papers.txt')

# 

papers_raw

papers_raw$title

papers_text <- tibble(paper = papers_raw) %>% 
  mutate(paper = sub('\\textendash', '~', paper)) %>% 
  print()

capture.output(papers_raw, file = 'papers.txt')