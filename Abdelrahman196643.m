%%
%Reading the case images

img1=imread("Cases/Case1-Front1.bmp");
img2=imread("Cases/Case2-Front2.jpg");
img3=imread("Cases/Case2-Rear1.jpg");
img4=imread("Cases/Case2-Rear2.jpg");
img5=imread("Cases/Case 3-1.jpg");
img6=imread("Cases/Case 3-2.jpg");
img7=imread("Cases/Case 3-3.jpg");
img8=imread("Cases/Case 3-4.jpg");
img9=imread("Cases/Case 4-2.jpg");
img10=imread("Cases/Case 4-3.jpg");
img11=imread("Cases/1.jpg");
img12=imread("Cases/7.jpg");
img13=imread("Cases/10.JPG");

%%
%converting the images from RGB to gray scale

img1gray=rgb2gray(img1);
img2gray=rgb2gray(img2);
img3gray=rgb2gray(img3);
img4gray=rgb2gray(img4);
img5gray=rgb2gray(img5);
img6gray=rgb2gray(img6);
img7gray=rgb2gray(img7);
img8gray=rgb2gray(img8);
img9gray=rgb2gray(img9);
img10gray=rgb2gray(img10);
img11gray=rgb2gray(img11);
img12gray=rgb2gray(img12);
img13gray=rgb2gray(img13);

%%
%targetSize is the pixel numbers of the height and width of the cropped
%image

targetSize=[60 60];

%create a center crop window of the image to the targeted size (pixel)

centerimg1=centerCropWindow2d(size(img1gray), targetSize);
centerimg2=centerCropWindow2d(size(img2gray), targetSize);
centerimg3=centerCropWindow2d(size(img3gray), targetSize);
centerimg4=centerCropWindow2d(size(img4gray), targetSize);
centerimg5=centerCropWindow2d(size(img5gray), targetSize);
centerimg6=centerCropWindow2d(size(img6gray), targetSize);
centerimg7=centerCropWindow2d(size(img7gray), targetSize);
centerimg8=centerCropWindow2d(size(img8gray), targetSize);
centerimg9=centerCropWindow2d(size(img9gray), targetSize);
centerimg10=centerCropWindow2d(size(img10gray), targetSize);
centerimg11=centerCropWindow2d(size(img11gray), targetSize);
centerimg12=centerCropWindow2d(size(img12gray), targetSize);
centerimg13=centerCropWindow2d(size(img13gray), targetSize);

%%
%use the numbers from the centerCropWindow2d to crop the image
%the third parameter of the imcrop function is used to adjust the place of
%the cropping
%the parameter consists of [x-axis, y-axis, height, width]

img1Clean=imcrop(img1gray, centerimg1);
img2Clean=imcrop(img2gray, centerimg2, [1150 350 100 100]);
img3Clean=imcrop(img3gray, centerimg3, [160 250 30 30]);
img4Clean=imcrop(img4gray, centerimg4, [480 440 50 30]);
img5Clean=imcrop(img5gray, centerimg5, [900 350 80 80]);
img6Clean=imcrop(img6gray, centerimg6, [190 140 30 30]);
img7Clean=imcrop(img7gray, centerimg7, [290 130 30 30]);
img8Clean=imcrop(img8gray, centerimg8, [430 220 40 40]);
img9Clean=imcrop(img9gray, centerimg9, [1150 600 100 100]);
img10Clean=imcrop(img10gray, centerimg10, [440 950 60 60]);
img11Clean=imcrop(img11gray, centerimg11, [450 250 100 100]);
img12Clean=imcrop(img12gray, centerimg12, [470 830 100 100]);
img13Clean=imcrop(img13gray, centerimg13, [550 230 150 150]);

%%
%resizing the image for easier comparison between the image and the
%database

img1Clean=imresize(img1Clean, [64 64]);
img2Clean=imresize(img2Clean, [64 64]);
img3Clean=imresize(img3Clean, [64 64]);
img4Clean=imresize(img4Clean, [64 64]);
img5Clean=imresize(img5Clean, [64 64]);
img6Clean=imresize(img6Clean, [64 64]);
img7Clean=imresize(img7Clean, [64 64]);
img8Clean=imresize(img8Clean, [64 64]);
img9Clean=imresize(img9Clean, [64 64]);
img10Clean=imresize(img10Clean, [64 64]);
img11Clean=imresize(img11Clean, [64 64]);
img12Clean=imresize(img12Clean, [64 64]);
img13Clean=imresize(img13Clean, [64 64]);


%%
%using the images as database,as the original logos didnt work out very
%well with the fourier.
% imwrite(img1Clean, 'img1db.png');
% imwrite(img2Clean, 'img2db.png');
% imwrite(img3Clean, 'img3db.png');
% imwrite(img4Clean, 'img4db.png');
% imwrite(img5Clean, 'img5db.png');
% imwrite(img6Clean, 'img6db.png');
% imwrite(img7Clean, 'img7db.png');
% imwrite(img8Clean, 'img8db.png');
% imwrite(img9Clean, 'img9db.png');
% imwrite(img10Clean, 'img10db.png');
% imwrite(img11Clean, 'img11db.png');
% imwrite(img12Clean, 'img12db.png');
% imwrite(img13Clean, 'img13db.png');

%%
%read the images of the database that will be asigned to the array

db1=imread("Logos/img1db.png");
db2=imread("Logos/img2db.png");
db3=imread("Logos/img3db.png");
db4=imread("Logos/img4db.png");
db5=imread("Logos/img5db.png");
db6=imread("Logos/img6db.png");
db7=imread("Logos/img7db.png");
db8=imread("Logos/img8db.png");
db9=imread("Logos/img9db.png");
db10=imread("Logos/img10db.png");
db11=imread("Logos/img11db.png");
db12=imread("Logos/img12db.png");
db13=imread("Logos/img13db.png");

%%
%apply FFT on the database images
%getting the absolute values
%sorting the image in descending order
%dividing the image into 3 scales

fftdb1=fft2(double(db1));
db1Feature=abs(fftdb1(:));
db1F=sort(db1Feature, 'descend');
db1FF=db1F(1:3);

fftdb2=fft2(double(db2));
db2Feature=abs(fftdb2(:));
db2F=sort(db2Feature, 'descend');
db2FF=db2F(1:3);

fftdb3=fft2(double(db3));
db3Feature=abs(fftdb3(:));
db3F=sort(db3Feature, 'descend');
db3FF=db3F(1:3);


fftdb4=fft2(double(db4));
db4Feature=abs(fftdb4(:));
db4F=sort(db4Feature, 'descend');
db4FF=db4F(1:3);

fftdb5=fft2(double(db5));
db5Feature=abs(fftdb5(:));
db5F=sort(db5Feature, 'descend');
db5FF=db5F(1:3);


fftdb6=fft2(double(db6));
db6Feature=abs(fftdb6(:));
db6F=sort(db6Feature, 'descend');
db6FF=db6F(1:3);

fftdb7=fft2(double(db7));
db7Feature=abs(fftdb7(:));
db7F=sort(db7Feature, 'descend');
db7FF=db7F(1:3);


fftdb8=fft2(double(db8));
db8Feature=abs(fftdb8(:));
db8F=sort(db8Feature, 'descend');
db8FF=db8F(1:3);

fftdb9=fft2(double(db9));
db9Feature=abs(fftdb9(:));
db9F=sort(db9Feature, 'descend');
db9FF=db9F(1:3);


fftdb10=fft2(double(db10));
db10Feature=abs(fftdb10(:));
db10F=sort(db10Feature, 'descend');
db10FF=db10F(1:3);


fftdb11=fft2(double(db11));
db11Feature=abs(fftdb11(:));
db11F=sort(db11Feature, 'descend');
db11FF=db11F(1:3);


fftdb12=fft2(double(db12));
db12Feature=abs(fftdb12(:));
db12F=sort(db12Feature, 'descend');
db12FF=db12F(1:3);


fftdb13=fft2(double(db13));
db13Feature=abs(fftdb13(:));
db13F=sort(db13Feature, 'descend');
db13FF=db13F(1:3);

%%
%assign the images to the array, this wil act as a database.

features=[db1FF, db2FF, db3FF, db4FF, db5FF, db6FF, db7FF, db8FF, db9FF, db10FF, db11FF, db12FF, db13FF];

%%
%apply FFT on the case images
%getting the absolute values
%sorting the image in descending order
%dividing the image into 3 scales

fftimg1=fft2(double(img1Clean));
img1Feature=abs(fftimg1(:));
img1F=sort(img1Feature, 'descend');
img1FF=img1F(1:3);


fftimg2=fft2(double(img2Clean));
img2Feature=abs(fftimg2(:));
img2F=sort(img2Feature, 'descend');
img2FF=img2F(1:3);


fftimg3=fft2(double(img3Clean));
img3Feature=abs(fftimg3(:));
img3F=sort(img3Feature, 'descend');
img3FF=img3F(1:3);

fftimg4=fft2(double(img4Clean));
img4Feature=abs(fftimg4(:));
img4F=sort(img4Feature, 'descend');
img4FF=img4F(1:3);


fftimg5=fft2(double(img5Clean));
img5Feature=abs(fftimg5(:));
img5F=sort(img5Feature, 'descend');
img5FF=img5F(1:3);

fftimg6=fft2(double(img6Clean));
img6Feature=abs(fftimg6(:));
img6F=sort(img6Feature, 'descend');
img6FF=img6F(1:3);

fftimg7=fft2(double(img7Clean));
img7Feature=abs(fftimg7(:));
img7F=sort(img7Feature, 'descend');
img7FF=img7F(1:3);

fftimg8=fft2(double(img8Clean));
img8Feature=abs(fftimg8(:));
img8F=sort(img8Feature, 'descend');
img8FF=img8F(1:3);

fftimg9=fft2(double(img9Clean));
img9Feature=abs(fftimg9(:));
img9F=sort(img9Feature, 'descend');
img9FF=img9F(1:3);

fftimg10=fft2(double(img10Clean));
img10Feature=abs(fftimg10(:));
img10F=sort(img10Feature, 'descend');
img10FF=img10F(1:3);

fftimg11=fft2(double(img11Clean));
img11Feature=abs(fftimg11(:));
img11F=sort(img11Feature, 'descend');
img11FF=img11F(1:3);

fftimg12=fft2(double(img12Clean));
img12Feature=abs(fftimg12(:));
img12F=sort(img12Feature, 'descend');
img12FF=img12F(1:3);

fftimg13=fft2(double(img13Clean));
img13Feature=abs(fftimg13(:));
img13F=sort(img13Feature, 'descend');
img13FF=img13F(1:3);

%%
%for loop that loops on the size of the database array and applies the
%fourier on the images, subtracting them, looking for the minimum of the
%subtraction which means the heighest simmilarity.
%the if statement for when there is a match, it gets looked up and
%described.

for i=1:13
    nearesy(i)=sqrt((img1FF(1)-features(1,i))^2+(img1FF(2)-features(2,i))^2+(img1FF(3)-features(3,i))^2);
end
nearesy
[MinResult, Index]=min(nearesy);
figure, imshow(img1);
if Index==1
    v1='Opel';
elseif Index==2 || Index==11 || Index==6
    v1='Kia';
elseif Index==3 || Index==4 || Index==10 || Index==9
    v1='Hyundai';
elseif Index==5
    v1='BMW';
elseif Index==7
    v1='Chevrolet';
elseif Index==8
    v1='Speranza';
elseif Index==12
    v1='Toyota';
elseif Index==13
    v1='Skoda';
end
title(v1);

%%
%for loop that loops on the size of the database array and applies the
%fourier on the images, subtracting them, looking for the minimum of the
%subtraction which means the heighest simmilarity.
%the if statement for when there is a match, it gets looked up and
%described.

for i=1:13
    nearesy(i)=sqrt((img2FF(1)-features(1,i))^2+(img2FF(2)-features(2,i))^2+(img2FF(3)-features(3,i))^2);
end
nearesy
[MinResult, Index]=min(nearesy);
figure, imshow(img2);
if Index==1
    v2='Opel';
elseif Index==2 || Index==11 || Index==6
    v2='Kia';
elseif Index==3 || Index==4 || Index==10 || Index==9
    v2='Hyundai';
elseif Index==5
    v2='BMW';
elseif Index==7
    v2='Chevrolet';
elseif Index==8
    v2='Speranza';
elseif Index==12
    v2='Toyota';
elseif Index==13
    v2='Skoda';
end
title(v2);

%%
%for loop that loops on the size of the database array and applies the
%fourier on the images, subtracting them, looking for the minimum of the
%subtraction which means the heighest simmilarity.
%the if statement for when there is a match, it gets looked up and
%described.

for i=1:13
    nearesy(i)=sqrt((img3FF(1)-features(1,i))^2+(img3FF(2)-features(2,i))^2+(img3FF(3)-features(3,i))^2);
end
nearesy
[MinResult, Index]=min(nearesy);
figure, imshow(img3);
if Index==1
    v3='Opel';
elseif Index==2 || Index==11 || Index==6
    v3='Kia';
elseif Index==3 || Index==4 || Index==10 || Index==9
    v3='Hyundai';
elseif Index==5
    v3='BMW';
elseif Index==7
    v3='Chevrolet';
elseif Index==8
    v3='Speranza';
elseif Index==12
    v3='Toyota';
elseif Index==13
    v3='Skoda';
end
title(v3);

%%
%for loop that loops on the size of the database array and applies the
%fourier on the images, subtracting them, looking for the minimum of the
%subtraction which means the heighest simmilarity.
%the if statement for when there is a match, it gets looked up and
%described.

for i=1:13
    nearesy(i)=sqrt((img4FF(1)-features(1,i))^2+(img4FF(2)-features(2,i))^2+(img4FF(3)-features(3,i))^2);
end
nearesy
[MinResult, Index]=min(nearesy);
figure, imshow(img4);
if Index==1
    v4='Opel';
elseif Index==2 || Index==11 || Index==6
    v4='Kia';
elseif Index==3 || Index==4 || Index==10 || Index==9
    v4='Hyundai';
elseif Index==5
    v4='BMW';
elseif Index==7
    v4='Chevrolet';
elseif Index==8
    v4='Speranza';
elseif Index==12
    v4='Toyota';
elseif Index==13
    v4='Skoda';
end
title(v4);

%%
%for loop that loops on the size of the database array and applies the
%fourier on the images, subtracting them, looking for the minimum of the
%subtraction which means the heighest simmilarity.
%the if statement for when there is a match, it gets looked up and
%described.

for i=1:13
    nearesy(i)=sqrt((img5FF(1)-features(1,i))^2+(img5FF(2)-features(2,i))^2+(img5FF(3)-features(3,i))^2);
end
nearesy
[MinResult, Index]=min(nearesy);
figure, imshow(img5);
if Index==1
    v5='Opel';
elseif Index==2 || Index==11 || Index==6
    v5='Kia';
elseif Index==3 || Index==4 || Index==10 || Index==9
    v5='Hyundai';
elseif Index==5
    v5='BMW';
elseif Index==7
    v5='Chevrolet';
elseif Index==8
    v5='Speranza';
elseif Index==12
    v5='Toyota';
elseif Index==13
    v5='Skoda';
end
title(v5);

%%
%for loop that loops on the size of the database array and applies the
%fourier on the images, subtracting them, looking for the minimum of the
%subtraction which means the heighest simmilarity.
%the if statement for when there is a match, it gets looked up and
%described.

for i=1:13
    nearesy(i)=sqrt((img6FF(1)-features(1,i))^2+(img6FF(2)-features(2,i))^2+(img6FF(3)-features(3,i))^2);
end
nearesy
[MinResult, Index]=min(nearesy);
figure, imshow(img6);
if Index==1
    v6='Opel';
elseif Index==2 || Index==11 || Index==6
    v6='Kia';
elseif Index==3 || Index==4 || Index==10 || Index==9
    v6='Hyundai';
elseif Index==5
    v6='BMW';
elseif Index==7
    v6='Chevrolet';
elseif Index==8
    v6='Speranza';
elseif Index==12
    v6='Toyota';
elseif Index==13
    v6='Skoda';
end
title(v6);

%%
%for loop that loops on the size of the database array and applies the
%fourier on the images, subtracting them, looking for the minimum of the
%subtraction which means the heighest simmilarity.
%the if statement for when there is a match, it gets looked up and
%described.

for i=1:13
    nearesy(i)=sqrt((img7FF(1)-features(1,i))^2+(img7FF(2)-features(2,i))^2+(img7FF(3)-features(3,i))^2);
end
nearesy
[MinResult, Index]=min(nearesy);
figure, imshow(img7);
if Index==1
    v7='Opel';
elseif Index==2 || Index==11 || Index==6
    v7='Kia';
elseif Index==3 || Index==4 || Index==10 || Index==9
    v7='Hyundai';
elseif Index==5
    v7='BMW';
elseif Index==7
    v7='Chevrolet';
elseif Index==8
    v7='Speranza';
elseif Index==12
    v7='Toyota';
elseif Index==13
    v7='Skoda';
end
title(v7);

%%
%for loop that loops on the size of the database array and applies the
%fourier on the images, subtracting them, looking for the minimum of the
%subtraction which means the heighest simmilarity.
%the if statement for when there is a match, it gets looked up and
%described.

for i=1:13
    nearesy(i)=sqrt((img8FF(1)-features(1,i))^2+(img8FF(2)-features(2,i))^2+(img8FF(3)-features(3,i))^2);
end
nearesy
[MinResult, Index]=min(nearesy);
figure, imshow(img8);
if Index==1
    v8='Opel';
elseif Index==2 || Index==11 || Index==6
    v8='Kia';
elseif Index==3 || Index==4 || Index==10 || Index==9
    v8='Hyundai';
elseif Index==5
    v8='BMW';
elseif Index==7
    v8='Chevrolet';
elseif Index==8
    v8='Speranza';
elseif Index==12
    v8='Toyota';
elseif Index==13
    v8='Skoda';
end
title(v8);

%%
%for loop that loops on the size of the database array and applies the
%fourier on the images, subtracting them, looking for the minimum of the
%subtraction which means the heighest simmilarity.
%the if statement for when there is a match, it gets looked up and
%described.

for i=1:13
    nearesy(i)=sqrt((img9FF(1)-features(1,i))^2+(img9FF(2)-features(2,i))^2+(img9FF(3)-features(3,i))^2);
end
nearesy
[MinResult, Index]=min(nearesy);
figure, imshow(img9);
if Index==1
    v9='Opel';
elseif Index==2 || Index==11 || Index==6
    v9='Kia';
elseif Index==3 || Index==4 || Index==10 || Index==9
    v9='Hyundai';
elseif Index==5
    v9='BMW';
elseif Index==7
    v9='Chevrolet';
elseif Index==8
    v9='Speranza';
elseif Index==12
    v9='Toyota';
elseif Index==13
    v9='Skoda';
end
title(v9);

%%
%for loop that loops on the size of the database array and applies the
%fourier on the images, subtracting them, looking for the minimum of the
%subtraction which means the heighest simmilarity.
%the if statement for when there is a match, it gets looked up and
%described.

for i=1:13
    nearesy(i)=sqrt((img10FF(1)-features(1,i))^2+(img10FF(2)-features(2,i))^2+(img10FF(3)-features(3,i))^2);
end
nearesy
[MinResult, Index]=min(nearesy);
figure, imshow(img10);
if Index==1
    v10='Opel';
elseif Index==2 || Index==11 || Index==6
    v10='Kia';
elseif Index==3 || Index==4 || Index==10 || Index==9
    v10='Hyundai';
elseif Index==5
    v10='BMW';
elseif Index==7
    v10='Chevrolet';
elseif Index==8
    v10='Speranza';
elseif Index==12
    v10='Toyota';
elseif Index==13
    v10='Skoda';
end
title(v10);

%%
%for loop that loops on the size of the database array and applies the
%fourier on the images, subtracting them, looking for the minimum of the
%subtraction which means the heighest simmilarity.
%the if statement for when there is a match, it gets looked up and
%described.

for i=1:13
    nearesy(i)=sqrt((img11FF(1)-features(1,i))^2+(img11FF(2)-features(2,i))^2+(img11FF(3)-features(3,i))^2);
end
nearesy
[MinResult, Index]=min(nearesy);
figure, imshow(img11);
if Index==1
    v11='Opel';
elseif Index==2 || Index==11 || Index==6
    v11='Kia';
elseif Index==3 || Index==4 || Index==10 || Index==9
    v11='Hyundai';
elseif Index==5
    v11='BMW';
elseif Index==7
    v11='Chevrolet';
elseif Index==8
    v11='Speranza';
elseif Index==12
    v11='Toyota';
elseif Index==13
    v11='Skoda';
end
title(v11);

%%
%for loop that loops on the size of the database array and applies the
%fourier on the images, subtracting them, looking for the minimum of the
%subtraction which means the heighest simmilarity.
%the if statement for when there is a match, it gets looked up and
%described.

for i=1:13
    nearesy(i)=sqrt((img12FF(1)-features(1,i))^2+(img12FF(2)-features(2,i))^2+(img12FF(3)-features(3,i))^2);
end
nearesy
[MinResult, Index]=min(nearesy);
figure, imshow(img12);
if Index==1
    v12='Opel';
elseif Index==2 || Index==11 || Index==6
    v12='Kia';
elseif Index==3 || Index==4 || Index==10 || Index==9
    v12='Hyundai';
elseif Index==5
    v12='BMW';
elseif Index==7
    v12='Chevrolet';
elseif Index==8
    v12='Speranza';
elseif Index==12
    v12='Toyota';
elseif Index==13
    v12='Skoda';
end
title(v12);

%%
%for loop that loops on the size of the database array and applies the
%fourier on the images, subtracting them, looking for the minimum of the
%subtraction which means the heighest simmilarity.
%the if statement for when there is a match, it gets looked up and
%described.

for i=1:13
    nearesy(i)=sqrt((img13FF(1)-features(1,i))^2+(img13FF(2)-features(2,i))^2+(img13FF(3)-features(3,i))^2);
end
nearesy
[MinResult, Index]=min(nearesy);
figure, imshow(img13);
if Index==1
    v13='Opel';
elseif Index==2 || Index==11 || Index==6
    v13='Kia';
elseif Index==3 || Index==4 || Index==10 || Index==9
    v13='Hyundai';
elseif Index==5
    v13='BMW';
elseif Index==7
    v13='Chevrolet';
elseif Index==8
    v13='Speranza';
elseif Index==12
    v13='Toyota';
elseif Index==13
    v13='Skoda';
end
title(v13);