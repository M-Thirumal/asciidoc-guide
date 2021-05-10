fileName=tutorial
echo "*** Producing HTML ***"
asciidoctor $fileName.adoc
echo "*** Producing DOCBOOK ***"
asciidoctor -n -b docbook -d book $fileName.adoc -o krltemp.xml 
sed -e s/language=\"groovy\"/language=\"java\"/ krltemp.xml > $fileName.xml
rm krltemp.xml
echo "*** Producing EPUB ***"
pandoc -f docbook -t epub $fileName.xml -o $fileName.epub
echo "*** Producing MOBI ***"
ebook-convert $fileName.epub $fileName.mobi
echo "*** Producing PDF ***"
asciidoctor-pdf $fileName.adoc