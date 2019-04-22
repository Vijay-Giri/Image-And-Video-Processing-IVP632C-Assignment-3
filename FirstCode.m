I=imread("cameraman.tif");
a=round(256*sqrt(2))+50;
J=ones(a,a);
J=-1*J;
subplot(1,3,1);
imshow(uint8(I));
title('Original Image');
for i=1:256
    for j=1:256
        x=(i-j)/sqrt(2)+200;
        y=((i+j-256)/sqrt(2)) +200;
     J(round(x),round(y))= I(i,j);
        
        
    end;
end;

subplot(1,3,2);
imshow(uint8(J));
title('Rotated Image (Without Interpolation)');
JJ=J;

for i=3:a-2
    for j=3:a-2
        
          if J(i,j)==-1  
        A=zeros(4,4);
        B=zeros(4,1);
        
        
        
        A(1,1)=i-1;
        A(1,2)=j-1;
        A(1,3)=A(1,1)*A(1,2);
        A(1,4)=1;
        
        
         A(2,1)=i-1;
        A(2,2)=j+1;
        A(2,3)=A(2,1)*A(2,2);
        A(2,4)=1;
        
        
         A(3,1)=i+1;
        A(3,2)=j-1;
        A(3,3)=A(3,1)*A(3,2);
        A(3,4)=1;
        
        
         A(4,1)=i+1;
        A(4,2)=j+1;
        A(4,3)=A(4,1)*A(4,2);
        A(4,4)=1;
        
        B(1)=J(i-1,j-1);
        if B(1)==-1
            sum=0;
            for x=-1:1
              for y=-1:1
                sum=sum+J(i-1+x,j-1+y);  
              end;
            end;
            B(1)=sum/9;
        end;
        B(2)=J(i-1,j+1);
        if B(2)==-1
            sum=0;
            for x=-1:1
              for y=-1:1
                sum=sum+J(i-1+x,j+1+y);  
              end;
            end;
            B(2)=sum/9;
        end;
        
        B(3)=J(i+1,j-1);
        if B(3)==-1
            sum=0;
            for x=-1:1
              for y=-1:1
                sum=sum+J(i+1+x,j-1+y);  
              end;
            end;
            B(3)=sum/9;
        end;
        
        B(4)=J(i+1,j+1);if B(4)==-1
            sum=0;
            for x=-1:1
              for y=-1:1
                sum=sum+J(i+1+x,j+1+y);  
              end;
            end;
            B(4)=sum/9;
        end;
        
        X=inv(A)*B;
        J(i,j)=X(1)*i+X(2)*j+X(3)*i*j+X(4);
    
        
        
    end;
    end;
end;
subplot(1,3,3);
imshow(uint8(J));
title('Rotated Image (After Interpolation)');
%J = imrotate(I,45,'bilinear');
%subplot(1,3,3);
%imshow(uint8(J));