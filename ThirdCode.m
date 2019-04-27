A = imread('cameraman.tif'); %reads file into a matrix
B = imfinfo('cameraman.tif'); %reads file info
w=B.Width;
h=B.Height;
sobel_f_x=[ -1 0 1
             -2 0 2
             -1 0 1];
sobel_f_y=[ -1  -2  -1
    0  0   0
    1  2  1];

prewitt_f_x=[ -1 0 1
             -1 0 1
             -1 0 1];
prewitt_f_y=[ -1  -1  -1
    0  0   0
    1  1  1];
I=zeros(w+2,h+2);

for i=2:w+1
    for j=2:h+1
    I(i,j)=A(i-1,j-1);    
    end;
end;
Conv1=I;
Conv2=I;

for i=2:w+1
    for j=2:h+1
        t1=0;
        t2=0;
        t3=0;
       t4=0;
   for x=-1:1
       
       for y=-1:1
        t1=t1+sobel_f_x(2+x,2+y)*I(i+x,j+y);   
        t2=t2+sobel_f_y(2+x,2+y)*I(i+x,j+y);   
        t3=t3+prewitt_f_x(2+x,2+y)*I(i+x,j+y);   
        t4=t4+prewitt_f_y(2+x,2+y)*I(i+x,j+y);   
       end;
   end;
   
   
   Conv1(i,j)=sqrt(t1*t1+t2*t2);
   Conv2(i,j)=sqrt(t3*t3+t4*t4);
   
    end;
end;

     subplot(2,2,1);
imshow(A);
title('Sobel');
subplot(2,2,2);
imshow(uint8(Conv1));
title('Sobel');

subplot(2,2,3);
imshow(A);
title('Prewit');
subplot(2,2,4);
imshow(uint8(Conv2));
title('Prewit');
 
 