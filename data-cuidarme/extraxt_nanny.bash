awk -F, '{print $4 $5 $6}'  nanny.160507.txt|sed s/Nombre://|sed s/Email:/,/
