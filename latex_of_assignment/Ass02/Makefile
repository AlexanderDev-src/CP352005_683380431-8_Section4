# Build with XeLaTeX. Every PDF lands in build/.
MAIN    = main
LATEXMK = latexmk -xelatex -outdir=build

.PHONY: all pdf draft watch view chapter clean distclean

all: pdf

pdf:
	$(LATEXMK) $(MAIN).tex

# Working copy: shows \todo, \idea and \changed
draft:
	$(LATEXMK) -jobname=$(MAIN)-draft -pretex='\def\DRAFT{}' -usepretex $(MAIN).tex

watch:
	$(LATEXMK) -pvc $(MAIN).tex

view:
	xdg-open build/$(MAIN).pdf >/dev/null 2>&1 &

# make chapter name=limits title="Limits"
# Copies templates/chapter.tex to content/NN_limits/main.tex and links it into main.tex
chapter:
	@test -n "$(name)" || { echo 'usage: make chapter name=<slug> [title="..."]'; exit 1; }
	@./scripts/new-chapter.sh "$(name)" "$(title)" chapter

clean:
	latexmk -c -outdir=build $(MAIN).tex

distclean:
	rm -rf build _minted*

# Answer key: defines \ANSWERS before main.tex is read
.PHONY: teacher both
teacher:
	$(LATEXMK) -jobname=$(MAIN)-teacher -pretex='\def\ANSWERS{}' -usepretex $(MAIN).tex

# Student copy and answer key in one go
both: pdf teacher

# make review name=stats title="Descriptive statistics"
# Review sheet: goals, summary, worked example, MC + written practice, self-check
.PHONY: review
review:
	@test -n "$(name)" || { echo 'usage: make review name=<slug> [title="..."]'; exit 1; }
	@./scripts/new-chapter.sh "$(name)" "$(title)" review
