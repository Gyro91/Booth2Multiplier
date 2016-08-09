clear;close all; clc;
N=6;
M=4;
Z=N+M;
k=0;
fclose('all');
if exist('test.txt', 'file')
    delete('test.txt');
end

file_id = fopen('test.txt', 'at');

for i=-(2^(N-1)):1:2^(N-1)-1
   
    for j=-(2^(M-1)):1:2^(M-1)-1
        multiplicand = dec2twos(i, N);
        multiplier = dec2twos(j, M);
        result = dec2twos(i*j, N+M);
        
        fprintf(file_id, '        when %d => y_in <= "%s"; x_in <= "%s"; z_correct<="%s";', k,  multiplier,multiplicand, result);  
        fprintf(file_id, '\n');
        k = k + 1;
    end
end
fclose(file_id);