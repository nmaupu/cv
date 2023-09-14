# Installation

- Install MikTex (MacOS) or texlive (Debian)

- Install `sty` and `cls` files from hipstercv directory:
  - Create a directory `<path>/tex/latex`
  - Add this directory into MikTex root directories

Under debian, use the following
```
apt update
apt install texlive \
  texlive-lang-french \
  texlive-lang-english \
  texlive-fonts-extra \
  texlive-latex-extra
mkdir -p ~/texmf/tex/latex
cp -a hipstercv ~/texmf/tex/latex
texhash ~/texmf
```

- Compilation is done using the Makefile:
```
$ make all \
    -e EMAIL=your@mail.com \
    -e MOBILE="+33 6 12 34 56 78" \
    -e ADDRESS1="1, rue du Camarade" \
    -e ADDRESS2="75000 Paris, France"
```
