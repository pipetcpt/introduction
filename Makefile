paper:
	Rscript R/paper.R 

readme:
	cat introduction.md papers.md >> README.md

rmd:
	Rscript -e "rmarkdown::render('index.Rmd')"

