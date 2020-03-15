function result = histogram_equalization(A)
    [hist_,hist_pro] = image_hist(A);
    shape = size(A);
    result = zeros(shape,'uint8');
    maxx = max(max(A));
    minn = min(min(A));
    L = maxx - minn;
    for i=1:shape(1)
        for j=1:shape(2)
            pix = L*sum(hist_pro(1:A(i,j)+1));
            %pix = 255 - uint8(A(i,j));
            result(i,j) = pix;
        end
    end
end