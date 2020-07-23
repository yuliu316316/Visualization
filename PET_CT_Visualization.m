function R = PET_CT_Visualization(P,C,fusion)

imgp=im2double(P);
imgc=im2double(C);

%% Colorization
[m,n] = size(imgp);
imgp_c = zeros(m,n,3);

%use threshold directly 
imgp_c(:,:,1) = imgp;
for i=1:m
   for j=1:n
      if imgp(i,j)>0.9
           imgp_c(i,j,2)=imgp(i,j);
           imgp_c(i,j,3)=imgp(i,j);
      elseif imgp(i,j)>0.6
           imgp_c(i,j,2)=imgp(i,j)-0.2;
           imgp_c(i,j,3)=imgp(i,j)-0.4;
      end
   end      
end

% %use a pre-generated color map (the result is the same as above)
% load map;
% for i=1:m
%     for j=1:n
%         imgp_c(i,j,:)=map(round(imgp(i,j)*255)+1,:);
%     end
% end

% refinement by guided filtering
for i=1:3
    imgp_c(:,:,i) = guidedfilter(imgp, imgp_c(:,:,i), 3, 0.2^2);
end
%% Fusion
if fusion==1
    imgf = lp_fuse(imgp,imgc,4);
    F=uint8(imgf*255);
    %imwrite(F,'results/fused.bmp');
    imgf=im2double(F);
else
    imgf=imgc;
end
%% Blending
imgr_yuv=zeros(m,n,3);
imgp_c_yuv = ConvertRGBtoYUV(imgp_c);
imgr_yuv(:,:,1) = 0.5*imgf+0.5*imgp_c_yuv(:,:,1);
imgr_yuv(:,:,2:3) = imgp_c_yuv(:,:,2:3);
imgr = ConvertYUVtoRGB(imgr_yuv);

R=uint8(imgr*255);