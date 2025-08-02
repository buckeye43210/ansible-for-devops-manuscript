# Defining variables
# Defining variables
MD_FILES := frontmatter.txt \
            foreword.txt \
            preface.txt \
            introduction.txt \
            mainmatter.txt \
            chapter1.txt \
            chapter2.txt \
            chapter3.txt \
            chapter4.txt \
            chapter5.txt \
            chapter6.txt \
            chapter7.txt \
            chapter8.txt \
            chapter9.txt \
            chapter10.txt \
            chapter11.txt \
            chapter12.txt \
            chapter13.txt \
            chapter14.txt \
            chapter15.txt \
            afterword.txt \
            backmatter.txt \
            appendix-a.txt \
            appendix-b.txt
COVER_IMAGE := images/title_page.jpg
PDF_OUTPUT := ansible-for-devops.pdf
EPUB_OUTPUT := ansible-for-devops.epub
PANDOC := pandoc
PANDOC_FLAGS := --from=markdown --toc --toc-depth=2
LATEX_FLAGS := --pdf-engine=xelatex --template=eisvogel.tex
EPUB_FLAGS := --metadata title="Ansible for DevOps" --metadata author="Jeff Geerling" --epub-cover-image=$(COVER_IMAGE)

# Default target
all: pdf epub

# Generating PDF
pdf: $(PDF_OUTPUT)

$(PDF_OUTPUT): $(MD_FILES)
	$(PANDOC) $(PANDOC_FLAGS) $(LATEX_FLAGS) -o $@ $(MD_FILES)

# Generating EPUB
epub: $(EPUB_OUTPUT)

$(EPUB_OUTPUT): $(MD_FILES)
	$(PANDOC) $(PANDOC_FLAGS) $(EPUB_FLAGS) -o $@ $(MD_FILES)

# Cleaning up generated files
clean:
	rm -f $(PDF_OUTPUT) $(EPUB_OUTPUT)

.PHONY: all pdf epub clean
