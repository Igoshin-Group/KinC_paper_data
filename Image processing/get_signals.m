 function get_signals()
 bkg_dir="../Data/PtapA-mCherry-KinA-GFP/segmentation/";
 gfp_dir="../Data/PtapA-mCherry-KinA-GFP/gfp/";
 ana_dir="../Data/PtapA-mCherry-KinA-GFP/signal/";
files=dir(bkg_dir+"*.tif");
files={files.name};
lens=[];
for i = 1:length(files)
filename=files{i};
Io2=imread(bkg_dir+filename);
itap2=imread(gfp_dir+filename);
itap2=imresize(itap2,[512,672]);
background=get_bgnoise(filename);
io2=rgb2gray(Io2);
itap2=rgb2gray(itap2)-background;
itap2=max(itap2,0);
bw= im2bw(io2,graythresh(io2));
conn= bwconncomp(bw,4);
c=conn.PixelIdxList;
sig.signal=[];
sig.area=[];
for i =1:length(c)
sig.signal(i)=max(sum(itap2(c{i}))/(length(c{i})),0);
sig.area(i)=length(c{i});
sig.std(i)=std(double(itap2(c{i})));
end
save(ana_dir+filename(1:end-4)+'.mat','sig');
end

 end
