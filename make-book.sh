echo "*** Producing HTML ***"
asciidoctor tutorial.adoc
echo "*** Producing DOCBOOK ***"
asciidoctor -n -b docbook -d book tutorial.adoc -o krltemp.xml 
sed -e s/language=\"groovy\"/language=\"java\"/ krltemp.xml > tutorial.xml
rm krltemp.xml
echo "*** Producing EPUB ***"
pandoc -f docbook -t epub tutorial.xml -o tutorial.epub
echo "*** Producing MOBI ***"
ebook-convert tutorial.epub tutorial.mobi
echo "*** Producing PDF ***"
asciidoctor-pdf tutorial.adoc