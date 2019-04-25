I=imread("cameraman.tif");
s=zeros(1,256);
f=zeros(1,256);


for i=1:256
   for j=1:256
  f(I(i,j)+1)=f(I(i,j)+1)+1;   
   end;
end;
L=256;
c=zeros(256);
c(1)=f(1);

  for i=2:256
      c(i)=c(i-1)+f(i);
  end;
  c=double(c);
  
  for i=1:256
     s(i)=round((c(i)*(L-1))/(256*256)); 
  end;
  
  
J=I;
for i=1:256
    for j=1:256
        J(i,j)=s(I(i,j)+1);
    end;
end;

subplot(2,2,2);
J=uint8(J);
imhist(I);
title('Histogram of Original Image');
subplot(2,2,4);
imhist(J);
title('Histogram of Equalized Image');
subplot(2,2,1);
imshow(I);
title('Original Image');
subplot(2,2,3);
imshow(J);
title('Equalized Image');