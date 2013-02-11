function res = getAverage(inp)

%array = dataset(:, 2:6);
in = inp(:,2:6);

blocs = floor(size(in,1)/50);

res = zeros(((blocs+1)*7),4);

for i=1:blocs
    a = find( in( ((i-1)*50+1):i*50, 1) == 0 );
    if(isempty(a))
        a2 = zeros(1,4);
    else
        aa = in(a,2:5);
        a2 = [mean(aa(:,1)) mean(aa(:,2)) mean(aa(:,3)) mean(aa(:,4))];
    end
    res((i-1)*7+1,:) = a2;
    
    b = find( in( ((i-1)*50+1):i*50, 1) == 1 );
    if(isempty(b))
        b2 = zeros(1,4);
    else
        bb = in(b,2:5);
        b2 = [mean(bb(:,1)) mean(bb(:,2)) mean(bb(:,3)) mean(bb(:,4))];
    end
    res((i-1)*7+2,:)  = b2;
    
    c = find( in( ((i-1)*50+1):i*50, 1) == 2 );
    if(isempty(c))
        c2 = zeros(1,4);
    else
        cc = in(c,2:5);
        c2 = [mean(cc(:,1)) mean(cc(:,2)) mean(cc(:,3)) mean(cc(:,4))];
    end
    res((i-1)*7+3,:)  = c2;
    
    d = find( in( ((i-1)*50+1):i*50, 1) == 3 );
    if(isempty(d))
        d2 = zeros(1,4);
    else
        dd = in(d,2:5);
        d2 = [mean(dd(:,1)) mean(dd(:,2)) mean(dd(:,3)) mean(dd(:,4))];
    end
    res((i-1)*7+4,:)  = d2;
    
    e = find( in( ((i-1)*50+1):i*50, 1) == 4 );
    if(isempty(e))
        e2 = zeros(1,4);
    else
        ee = in(e,2:5);
        e2 = [mean(ee(:,1)) mean(ee(:,2)) mean(ee(:,3)) mean(ee(:,4))];
    end
    res((i-1)*7+5,:)  = e2;
    
    f = find( in( ((i-1)*50+1):i*50, 1) == 5 );
    if(isempty(f))
        f2 = zeros(1,4);
    else
        ff = in(f,2:5);
        f2 = [mean(ff(:,1)) mean(ff(:,2)) mean(ff(:,3)) mean(ff(:,4))];
    end
    res((i-1)*7+6,:)  = f2;
    
    g = find( in( ((i-1)*50+1):i*50, 1) == 6 );
    if(isempty(g))
        g2 = zeros(1,4);
    else
        gg = in(g,2:5);
        g2 = [mean(gg(:,1)) mean(gg(:,2)) mean(gg(:,3)) mean(gg(:,4))];
    end
    res(i*7,:)  = g2;
    
end
    aa = in(find( in( ((blocs-1)*50+1):size(in,1), 1) == 0 ),2:5);
    res(blocs*7+1,:) = [mean(aa(:,1)) mean(aa(:,2)) mean(aa(:,3)) mean(aa(:,4))];
    aa = [];
    
    aa = in(find( in( ((blocs-1)*50+1):size(in,1), 1) == 1 ),2:5);
    res(blocs*7+2,:) = [mean(aa(:,1)) mean(aa(:,2)) mean(aa(:,3)) mean(aa(:,4))];
    aa = [];
    
    aa = in(find( in( ((blocs-1)*50+1):size(in,1), 1) == 2 ),2:5);
    res(blocs*7+3,:) = [mean(aa(:,1)) mean(aa(:,2)) mean(aa(:,3)) mean(aa(:,4))];
    aa = [];
    
    aa = in(find( in( ((blocs-1)*50+1):size(in,1), 1) == 3 ),2:5);
    res(blocs*7+4,:) = [mean(aa(:,1)) mean(aa(:,2)) mean(aa(:,3)) mean(aa(:,4))];
    aa = [];
    
    aa = in(find( in( ((blocs-1)*50+1):size(in,1), 1) == 4 ),2:5);
    res(blocs*7+5,:) = [mean(aa(:,1)) mean(aa(:,2)) mean(aa(:,3)) mean(aa(:,4))];
    aa = [];
    
    
    aa = in(find( in( ((blocs-1)*50+1):size(in,1), 1) == 5 ),2:5);
    res(blocs*7+6,:) = [mean(aa(:,1)) mean(aa(:,2)) mean(aa(:,3)) mean(aa(:,4))];
    aa = [];
    
    aa = in(find( in( ((blocs-1)*50+1):size(in,1), 1) == 6 ),2:5);
    res(blocs*7+7,:) = [mean(aa(:,1)) mean(aa(:,2)) mean(aa(:,3)) mean(aa(:,4))];