.POSIX:
.PHONY: all
all: main.pdf
main.pdf: main.md frontmatter.md
	pandoc \
		frontmatter.md main.md \
		-o main.pdf \
		--data-dir=. \
		--template=eisvogel \
		--pdf-engine=xelatex \
		--listings \
		--lua-filter=./filters/image-size.lua
