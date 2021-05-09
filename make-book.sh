echo "*** Producing HTML ***"
asciidoctor tutorial.adoc
echo "*** Producing DOCBOOK ***"
#asciidoctor -n -b docbook -d book tutorial.adoc -o krltemp.xml 
#sed -e s/language=\"groovy\"/language=\"java\"/ krltemp.xml > Gremlin-Graph-Guide.xml
#rm krltemp.xml
echo "*** Producing EPUB ***"
pandoc -f docbook -t epub -N --number-sections --chapters --toc --toc-depth=4 Gremlin-Graph-Guide.xml -o tutorial.epub
echo "*** Producing MOBI ***"
ebook-convert tutorial.epub tutorial.mobi
echo "*** Producing PDF ***"
asciidoctor-pdf tutorial.adoc