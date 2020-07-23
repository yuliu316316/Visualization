%colormap

map=zeros(256,3);

for i=1:256
    if (i-1)/255<=0.6
        map(i,1)=(i-1)/255;
        map(i,2)=0;
        map(i,3)=0;    
    elseif (i-1)/255<=0.9
        map(i,1)=(i-1)/255;
        map(i,2)=(i-1)/255-0.2;
        map(i,3)=(i-1)/255-0.4;
    else
        map(i,1)=(i-1)/255;
        map(i,2)=(i-1)/255;
        map(i,3)=(i-1)/255;
    end
end

save map map;