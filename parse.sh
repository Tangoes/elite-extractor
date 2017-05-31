#!/bin/bash
# -*- ENCODING: UTF-8 -*-

#Carpeta donde saldrán los torrents extraidos
OUT="/var/lib/deluge/torrents"

wget  http://www.elitetorrent.net/rss.php ; echo " " 
perl -pi -e "s[</pubDate>] [\n]g" rss.php 
perl -pi -e "s[/torrent/][/get-torrent/]g" rss.php ; cat rss.php | grep -oE 'http://www.elitetorrent.net/get-torrent/.*</link>' > archivo.txt
cut -c 1-45 archivo.txt > links.txt ; cut -c 47-100 archivo.txt > nombre.txt ; paste -d " " links.txt nombre.txt
echo " " ; ./ls_elite.py ; wget --waitretry=2 -i listaurl.txt 
echo " " ; echo "limpiando..." 
rm rss.* ; cat /dev/null > listaurl.txt ; cat /dev/null > archivo.txt ; cat /dev/null > links.txt ; cat /dev/null > nombre.txt
head -n 1 3* | grep -oE 'name.*:piece'; for FILE in 3* ; do mv $FILE $OUT/$FILE.torrent ; done
