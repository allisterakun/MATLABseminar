clc; clear; close all;

load fisheriris

Flowers = cell(150, 1);

for i = 1:150      
    Flowers{i} = Flower(meas(i,1),meas(i,2),meas(i,3),meas(i,4),char(strtrim(species(i))));
end

SLength_25 = Flowers{25}.getSLength();
ifCorrect = (SLength_25 == meas(25,4));

Flowers{25}.report();