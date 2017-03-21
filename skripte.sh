#Skripte za mijenjanje dijela imena u poddirektorija u cilom direktoriju
for f in *%20*; do mv $f "${f//%20/.}"; done

#Naredba za gasenje diska
lsblk #ovo je za provjeru diska
sudo hdparm -S 25 /dev/sda #ova naredba gasi disk za 2min i 6 sekundi

#Pronalazak duplih filova
fdupes -r .
