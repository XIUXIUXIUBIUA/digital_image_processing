function image = bilinear_inter(A,n)
    A = rgb2gray(A);
    shape = size(A);
    new_shape = round(shape*n);
    image = zeros(new_shape,'uint8');
    for i=1:new_shape(1)
        for j=1:new_shape(2)
           Qa_y = i/n;
           Qa_x = j/n;
           x_left = floor(Qa_x);%左边的点的x坐标
           x_right = ceil(Qa_x);
           y_up = floor(Qa_y);
           y_down = ceil(Qa_y);
           if(x_left < 1)
               x_left = 1;
           end
           if(x_left > new_shape(2))
               x_left = new_shape(2);
           end
           if(x_right < 1)
               x_right = 1;
           end
           if(x_right > new_shape(2))
               x_right = new_shape(2);
           end
           if(y_up < 1)
               y_up = 1;
           end
           if(y_up > new_shape(1))
               y_up = new_shape(1);
           end
           if(y_down < 1)
               y_down = 1;
           end
           if(y_down > new_shape(1))
               y_down = new_shape(1);
           end
           %fprintf("%d %d %d %d",x_left,x_right,y_up,y_down);
           V1 = A(y_up,x_left);
           V2 = A(y_up,x_right);
           V3 = A(y_down,x_left);
           V4 = A(y_down,x_right);
           delta_x = x_right - x_left;
           delta_y = y_down - y_up;
           V_r1 = ((V2-V1)/delta_x)*(Qa_x-x_left)+V1;
           V_r2 = ((V4-V3)/delta_x)*(Qa_x-x_left)+V3;
           V_Qa = ((V_r2-V_r1)/delta_y)*(Qa_y-y_up) + V_r1;
%          V_r1 = ((x_right-Qa_x)/(x_right-x_left))*V3 + ((Qa_x-x_left)/(x_right-x_left))*V4;
%          V_r2 = ((x_right-Qa_x)/(x_right-x_left))*V1 + ((Qa_x-x_left)/(x_right-x_left))*V2;
%          V_Qa = ((y_up-Qa_y)/(y_up-y_down))*V_r1+((Qa_y-y_down)/(y_up-y_down))* V_r2;
           image(i,j) = uint8(V_Qa);
           %fprintf(" %d \n",V_Qa);
        end 
    end
end