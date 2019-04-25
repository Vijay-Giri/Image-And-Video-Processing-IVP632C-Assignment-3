I=imread('lenaTest1.jpg');
N=16;
m=4;
%L=input(' ');
%R=input(' ');
L=150;
R=200;
subplot(1,3,1);
imshow(uint8(I));
title('Original Image');
%m=4;
for k=1:2
    if k==1
        m=4;
    end;
    if k==2
        m=8;
    end;
J=zeros(512,512);
for i=1:512
    for j=1:512
       x1=i;
       y1=j;
       x2=i+N;
       y2=j+N;
        for x=x1:x2
            for y=y1:y2
        if x>=1 && x<=512 && y>=1 && y<=512
             if   I(x,y)<=R && I(x,y)>=L
                
                 a=-1;
                 if x-1>0
                 a=I(x-1,y);
                 end;
                 b=-1;
                 if x-1>0 && y-1>0
                 b=I(x-1,y-1);
                 end;
                 c=-1;
                 if y-1>0
                 c=I(x,y-1);
                 end;
                 d=-1;
                 if  x+1<513
                 d=I(x+1,y);
                 end;
                 e=-1;
                 if y+1<=512
                 e=I(x,y+1);
                 end;
                 f=-1;
                 if x-1>0 && y+1<=512
                 f=I(x-1,y+1);
                 end;
                 g=-1;
                 if x+1<=512 && y-1>0
                 g=I(x+1,y-1);
                 end;
                 h=-1;
                 if x+1<=512 && y+1<=512
                 h=I(x+1,y+1);
                 end;
                 
                 
                 if  a>=L && a<=R
                     J(x-1,y)=1;
                     J(x,y)=1;
                 end;
                 
                 
                 if b>=L && b<=R && m==8
                     J(x-1,y-1)=1;
                     j(x,y)=1;
                 end;
                 
                if c>=L &&  c<=R
                     J(x,y-1)=1;
                     j(x,y)=1;
                 end;
                 
                 if d>=L && d<=R 
                     J(x+1,y)=1;
                     j(x,y)=1;
                 end;
                 
                 if e>=L && e<=R 
                     J(x,y+1)=1;
                     j(x,y)=1;
                 end;
                 
                 if f>=L && f<=R && m==8
                     J(x-1,y+1)=1;
                     j(x,y)=1;
                 end;
                 
                 if g>=L && g<=R && m==8
                     J(x+1,y-1)=1;
                     j(x,y)=1;
                 end;
                 
                 if h>=L && h<=R && m==8
                     J(x+1,y+1)=1;
                     j(x,y)=1;
                 end;
                 
             end;
                
                
                
                
                
            end;
        end;
        end;
        
        
        j=j+N;
        
        
    end;
    i=i+N;
end;
J=J*255;
p=k+1;
subplot(1,3,p);
imshow(uint8(J));
if k==1
    title('m = 4');
end;
if k==2
    title('m = 8');
end;
end;