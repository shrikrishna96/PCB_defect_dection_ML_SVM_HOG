a=imread('orginal pic1.jpg');
a=imresize(a,[250 250]);
b=imread('alldefects_01.jpg');
b=imresize(b,[250 250]);
z= imsubtract(a,b)
imshow(z)
