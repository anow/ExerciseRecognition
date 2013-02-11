%% Constructs a long from 4 bytes
function result = fourBytesToLong(input)
   result = bitor(bitsll(input(1),24), bitsll(input(2),16));
   result = bitor(result, bitsll(input(3),8));
   result = bitor(result, input(4));

   temp = dec2bin(result,32);
   result = sbin2dec(temp);
end