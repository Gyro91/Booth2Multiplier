function [ y ] = dec2twos( x, n )

if (x < 0)
    mod_x = -x;
    y = dec2bin(2^n - mod_x, n);
else
    y = dec2bin(x, n);
end;

end