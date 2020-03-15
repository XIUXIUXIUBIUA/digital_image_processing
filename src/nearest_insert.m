function image = nearest_insert(A,x)
    A = rgb2gray(A);
    shape = size(A);
    new_shape = round(shape*x);
    image = zeros(new_shape);
    for i=1:new_shape(1)
        for j=1:new_shape(2)
            index_x = round(i/x);
            index_y = round(j/x);
            if(index_x<1) 
                index_x = 1;
            end
            if(index_x > shape(1))
                index_x = shape(1);
            end
            if(index_y < 1)
                index_y = 1;
            end
            if(index_y > shape(2))
                index_y = shape(2);
            end
            image(i,j) = A(index_x,index_y);
        end
    end
    image = uint8(image);
end