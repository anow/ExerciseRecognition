function reduced = getMeanSecQuat(input)

% divide input data depending on the their source (device number)
in1 = zeros(1,4);
in2 = zeros(1,4);
in3 = zeros(1,4);
in4 = zeros(1,4);
in5 = zeros(1,4);
in6 = zeros(1,4);

[in1 dummy] = getM(input,1);
[in2 dummy] = getM(input,2 );
[in3 dummy] = getM(input,3 );
[in4 dummy] = getM(input,4 );
[in5 dummy] = getM(input,5 );
[in6 dummy] = getM(input,6 );

reduced = [in1(1,:) in2(1,:), in3(1,:), in4(1,:), in5(1,:),in6(1,:)];
