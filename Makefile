main:
	hugo server

resume: src/resume.tex
	-xelatex -output-directory static src/resume
	-cd static; latexmk -c
