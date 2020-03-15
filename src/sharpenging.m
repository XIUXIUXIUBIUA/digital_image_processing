%function result = sharpenging(A,operator)
A = imread("Image_3_1.tif");
%微分算子有2个选择，1表示拉普拉斯算子，2表示Soble算子
operator = 2;

if(operator==2)
    filter = [-1,-2,-1;0,0,0;1,2,1];
else
    filter = [1,1,1;1,-8,1;1,1,1];
end

[row_filter,col_filter] = size(filter);
[row_input,col_input] = size(A);
row_temp = row_input+row_filter-1;
col_temp = col_input+col_filter-1;
%注意指定zeros中的元素为uint8类型，不然显示不出来
%为了运算的可能性，先让矩阵中元素为浮点型，最后再取整
result = zeros(row_input,col_input);
temp = zeros(row_temp,col_temp);
% temp中的非零行和列
nozero_row = ((row_filter-1)/2+1):(((row_filter-1)/2+1)+row_input-1);
nozero_col = ((col_filter-1)/2+1):(((col_filter-1)/2+1)+col_input-1);
temp(nozero_row,nozero_col) = A;
sum_filter = sum(filter(:));
for i=1:row_input
    for j=1:col_input
        m = temp(i:i+row_filter-1,j:j+col_filter-1).*filter;
        result(i,j) = sum(m(:));
    end
end
% 注意最后使用uint8(matrix)将矩阵转换成8位整型矩阵
result = uint8(double(A)-result);
figure;
subplot(1,2,1);
imshow(A);
title("原图像");
subplot(1,2,2);
imshow(result);
title("平滑滤波后的图像");
%end