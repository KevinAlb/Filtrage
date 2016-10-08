function  myscript()

pkg load image;

a = [ 51 21 14; 
      9 9 19; 
      9 22 27];
b = [ 20 20 21;
      21 15 20;
      20 20 22];
c = [ 5 20 21;
      4 15 20;
      5 20 22];
d = [ 5 20 21;
      4 20 20;
      5 20 22;];      
     
%Script médian     

if ( mymedian(a,3) == 19 && mymedian(b,3) == 20 &&
 mymedian(c,3) == 20 && mymedian(d,3) == 20) 
  fprintf("Test médian : OK\n");
else
  fprintf ("Test médian : KO\n");
  fprintf("%d au lieu de 19\n",mymedian(a,3));
  fprintf("%d au lieu de 20\n",mymedian(b,3));  
end 
  

if ( myknn(a,3,4) == 12.75 && myknn(b,3,4) == 20 &&
  myknn(c,3,4) == 20.25 && myknn(d,3,4) == 20.25)
  fprintf("Test knn : OK\n");
else
  fprintf("Test knn : KO\n");
end  

if ( mysigma(a,3,13) == 94/6 && mysigma(b,3,5) == 20 && 
  mysigma(c,3,5) == 20 && mysigma(d,3,5) == 20.6)
  fprintf("Test sigma : OK\n");
else
  fprintf("Test sigma : KO\n");
end

if ( mysnn(a,3) == 16.5 && mysnn(b,3) == 20 && 
  mysnn(c,3) == 20.75 && mysnn(d,3) == 20.75)
  fprintf("Test SNN : OK\n");
else  
  fprintf("Test SNN : KO\n");
  fprintf("%d au lieu de 16.5\n",mysnn(a,3));
end 

if (myminmax(a,3) == 9 && myminmax(b,3) == 20 && 
  myminmax(c,3) == 15 && myminmax(d,3) == 20)
  fprintf("Test MinMax : OK\n");
else
  fprintf("Test MinMax : KO\n");
  fprintf("%d au lieu de 9\n",myminmax(a,3));
  fprintf("%d au lieu de 20\n", myminmax(b,3));
end 


%%%%%%%%%%%%%%%%  Test sur une image Lena 256x256   %%%%%%%%%%%%%%%%%%%% 
fprintf("\n\n\t Test sur car.jpg \n\n");

car = imread('lena.jpg');
car = myrgb2gray(car);
subplot(4,5,1);
colormap(gray(256));
imagesc(car); 
title("Image originale");

carGauss = myimnoise(car,'gaussian',0,0.05);
subplot(4,5,2);
imagesc(carGauss);
title("Image bruité par bruit gaussien");

carSAP = myimnoise(car,'salt & pepper',0.05);
subplot(4,5,3);
imagesc(carSAP);
title("Image bruité par bruit poivre et sel");


%%%%%%%%%%%%%%%%%%    FILTRE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tic();
filtreMean = mymean(carGauss,3);
subplot(4,5,4);
imagesc(filtreMean);
title("Filtre moyen sur bruit gaussien");
displayTime("mean");


filtreMean = mymean(carSAP,3);
subplot(4,5,5);
imagesc(filtreMean);
title("Filtre moyen sur bruit p&s");

tic();
filtreGauss = mygaussian(carGauss,1,3);
subplot(4,5,6);
imagesc(filtreGauss);
title("Filtre de Gauss sur bruit gaussien");
displayTime("gaussien");

filtreGauss = mygaussian(carSAP,1,3);
subplot(4,5,7);
imagesc(filtreGauss);
title("Filtre de Gauss sur bruit s&p");

tic();
filtreMedian = mymedian(carGauss,3);
subplot(4,5,8);
imagesc(filtreMedian);
title("Filtre Median sur bruit Gaussien");
displayTime("median");

filtreMedian = mymedian(carSAP,3);
subplot(4,5,9);
imagesc(filtreMedian);
title("Filtre Médian sur bruit p&s");

tic();
filtreKNN = myknn(carGauss,3,4);
subplot(4,5,10);
imagesc(filtreKNN);
title("Filtre KNN sur bruit Gaussien");
displayTime("KNN");

filtreKNN = myknn(carSAP,3,4);
subplot(4,5,11);
imagesc(filtreKNN);
title("Filtre KNN sur bruit p&s");

tic();
filtreSigma = mysigma(carGauss,3,1);
subplot(4,5,12);
imagesc(filtreSigma);
title("Filtre Sigma sur bruit Gaussien");
displayTime("Sigma");

filtreSigma = mysigma(carSAP,3,1);
subplot(4,5,13);
imagesc(filtreSigma);
title("Filtre Sigma sur bruit p&s");

tic();
filtreSNN = mysnn(carGauss,3);
subplot(4,5,14);
imagesc(filtreSNN);
title("Filtre SNN sur bruit gaussien");
displayTime("SNN");

filtreSNN = mysnn(carSAP,3);
subplot(4,5,15);
imagesc(filtreSNN);
title("Filtre SNN sur bruit s&p");

tic();
filtreMinMax = myminmax(carGauss,3);
subplot(4,5,16);
imagesc(filtreMinMax);
title("Filtre MinMax sur bruit gaussien");
displayTime("MinMax");

filtreMinMax = myminmax(carSAP,3);
subplot(4,5,17);
imagesc(filtreMinMax);
title("Filtre MinMax sur bruit s&p");


endfunction


function displayTime(type,id)

  fprintf("Filtre %s execute en %d secondes\n",type,toc());
endfunction