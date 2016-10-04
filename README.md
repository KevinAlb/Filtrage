# Filtrage

https://www.irit.fr/~Christophe.Collet/M2IGAI/


#Débruitage

	1) Debruitage

x --> image : Lena, Shop LOgan (phantom)
b --> générer du bruit Gaussien pour RSB donné (0 dB... 40 dB)
y = x + b
x(estimé)-> filtre linéaire   -->|Calculer MSE, PSNR
	 -> filtre bilatéral  -->|faire varier un peu leur paramètres

	2) Flou

--> petite image : 7x7, flou 3x3 -->| y = x * h
				 -->| y = Hx
				 -->| y = H * x
--> Shop LOgan -->| y = h * x + b
	       -->|x(estimé) -->| filtre inverse (1,2,3)	  } -->|Calculer MSE, PSNR
			     -->| Wiener (maison, Matlab) } -->|faire varier un peu leur paramètres
