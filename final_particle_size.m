clc
clear all
close all
image=imread('24-5-11.45.png');
t=particle_size(image);

function [pa]= particle_size(image)
   A=image;
 %A=imcrop(A,[397.51 0.51 1654.98 1253.98]);
 A=imcrop(A,[1690.5 654.5 205 240]);
A=im2bw(A,graythresh(A));
[N,M]=size(A);
 AA=bwareaopen(A,20);
 AA=bwmorph(AA,'majority',10);
  AA=modified_watershed(AA);
for i=1:1:M
    for j=1:1:N
        if AA(j,i)==1
            AA(j,i)=0;
            continue
        end
        if AA(j,i)==0
            AA(j,i)=1;
        end
    end
end
AA=bwareaopen(AA,50); 
 
A=AA;

shiftVal=0;
cutoff=mean(mean(A))+shiftVal;
g=zeros(N,M);
for ii=1:N
    for jj=1:M
        if(A(ii,jj)<cutoff)
            g(ii,jj)=1;
        end
    end
end

[labeled,a]=bwlabel(g,4);
points=regionprops(labeled,'Centroid','PixelList');
[B,~,NN]=bwboundaries(labeled,4,'noholes');
 hold on;
 for s=1:numel(points)
 boundary=B{s};
 if(s>a)
 plot(boundary(:,2), boundary(:,1), 'g','LineWidth',1);
 else
 plot(boundary(:,2), boundary(:,1), 'r','LineWidth',1);
 end
 hold on
 meanPos(s,:)=mean(boundary);
 text(meanPos(s,2),meanPos(s,1),num2str(s),'Color',[1 1 1]);
 end
 hold off
  sat='y';
  if(sat=='y')
  else
      close all;
  end

graindata=regionprops(labeled,'basic');

AB=struct2cell(graindata);
allAreas=cell2mat(AB(1,:));
o=0;
p=0;
r=0;

for m=1:length(allAreas)
    if allAreas(1,m)<(8.8359e+03)*0.09
        r = r+allAreas(1,m);
    end
    
    if allAreas(1,m)> 8.8359e+03*0.09
        o=o+allAreas(1,m);
    end
    p=p+allAreas(1,m);
end
t=(r*100)/p;
s=(o*100)/p;
pa=t;
end

function [DD] = modified_watershed(bw)
    bw2 = ~bwareaopen(~bw, 10);
    D = -bwdist(~bw);
    mask = imextendedmin(D,2);
       imshowpair(bw,mask,'blend')
    D2 = imimposemin(D,mask);
    Ld2 = watershed(D2);
    bw3 = bw;
    bw3(Ld2 == 0) = 0;
    DD=bw3;
end