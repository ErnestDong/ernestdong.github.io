main:
	@echo "you may need build 'hugo'"

hugo:
	-hugo
	-cd public; git commit -am "update"; git push
	-git commit -am "update"; git push

resume: src/resume.tex
	-pdflatex -output-directory static src/resume
	-cd static; rm resume.log resume.aux resume.out
