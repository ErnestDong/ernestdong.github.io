main:
	hugo server
resume: src/resume.tex
	-xelatex -output-directory static/files src/resume
	-cd static/files; rm resume.log resume.aux resume.out
pre: src/pre/main.tex
	-cd src/pre; latexmk main
	-cd src/pre; latexmk -c
	-mv src/pre/main.pdf static/files/pre.pdf
publish:
	-gsed -i "8 a [Presentation Notes](../../files/pre.pdf)" content/notes/theses.md
	-gsed -i "8 a ## Presentation" content/notes/theses.md
