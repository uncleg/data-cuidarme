awk -F, '{print $4 $5 $6}'  nanny.160507.txt|sed s/Nombre://|sed s/Email:/,/|sed s/Pais:/,/|sed 's/\[u//'|sed 's/\]//'|sed "s/'//"|sed "s/'//"|sed 's/\[u//'|sed 's/\]//'|sed "s/'//"

