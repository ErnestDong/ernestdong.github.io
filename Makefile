main:
	hugo server

resume: src/resume.tex
	-pdflatex -output-directory static src/resume
	-cd static; rm resume.log resume.aux resume.out
