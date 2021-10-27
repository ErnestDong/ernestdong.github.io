main:
	hugo server

resume: src/resume.tex
	-xelatex -output-directory static src/resume
	-cd static; rm resume.log resume.aux resume.out
