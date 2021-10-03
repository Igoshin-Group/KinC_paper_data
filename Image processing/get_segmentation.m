function sig=get_segmentation_new()
bkg_dir="../Data/PtapA-mCherry-KinA-GFP/bkg/";
gfp_dir="../Data/PtapA-mCherry-KinA-GFP/gfp/";
ana_dir="../Data/PtapA-mCherry-KinA-GFP/segmentation/";

files=dir(gfp_dir+"*.tif");
files={files.name};
for i = 1:length(files)
filename=files{i}
Io2=imread(bkg_dir+filename);
itap2=imread(gfp_dir+filename);
Io2=rgb2gray(Io2);
Io2=imresize(Io2,[512,672]);
itap2=rgb2gray(itap2);
itap2=imresize(itap2,[512,672]);
h = fspecial('log',5,0.28);
io2 = imfilter(Io2,h,'replicate');
bw= im2bw(io2,graythresh(io2));
bw=imfill(bw,'holes');
bw = bwconvhull(bw,'objects');
conn= bwconncomp(bw,4);
cc=conn.PixelIdxList;
c={};
for i =1:length(cc)
   mask=zeros(size(bw));
   mask(cc{i})=1;
   stats = regionprops('table',mask,'MajorAxisLength','MinorAxisLength');
   stats=table2array(stats)  ;

   if (length(cc{i})>50 && length(cc{i})<180 && max(stats)/min(stats)>2)
       s=std(double(itap2(cc{i})));
       if s<30
       c{end+1}=cc{i};
       end
   end
end
conn.PixelIdxList=c;
conn.NumObjects=length(c)
L=labelmatrix(conn);
label=label2rgb(L,'jet','k','shuffle');
imwrite(label,ana_dir+filename);
end
end
