#! /usr/bin/python
alto = raw_input("Número máximo de torrent a descargar>")
bajo = raw_input("Número mínimo de torrent a descargar>")
n = int(bajo)
alto1 = int(alto)
while n <= alto1: 
	
	lurl = open("listaurl.txt",'a')
        lurl.write("http://www.elitetorrent.net/get-torrent/")
        lurl.write( str(n))
        lurl.write("")
        lurl.write("\n")
 	lurl.close()
	n = n + 1
