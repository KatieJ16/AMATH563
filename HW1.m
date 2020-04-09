fid = fopen('train-images-idx3-ubyte.gz', 'r', 'b');
header = fread(fid, 1, 'int32');
% count = fread(fid, 1, 'int32');

h = 28;
w = 28;

h
w
readDigits = 6000;

imgs = zeros([h w readDigits]);

for i=1:readDigits
    for y=1:h
        imgs(y,:,i) = fread(fid, w, 'uint8');
    end
end

fclose(fid);
% Read digit labels
fid = fopen('train-labels-idx1-ubyte.gz', 'r', 'b');
header = fread(fid, 1, 'int32');
count = fread(fid, 1, 'int32');


labels = fread(fid, readDigits, 'uint8');
fclose(fid);

data = reshape(imgs, [readDigits, h*w]);
labels_new = zeros([readDigits 10]);
for i = 1:readDigits
    if labels(i) == 0
        lables_new(i, 10) = 1;
    else
        lables_new(i, labels(i)) = 1;
    end
end