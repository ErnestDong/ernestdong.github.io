main:
	hugo server

resume: src/resume.tex
	-xelatex -output-directory static/files src/resume
	-cd static; latexmk -c
