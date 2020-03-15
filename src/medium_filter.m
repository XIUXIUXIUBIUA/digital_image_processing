%function result = medium_filter(A,size_of_filter)
A = rgb2gray(imread("19.jpg"));
size_of_filter = [3,3];

[row_A,col_A] = size(A);
m = size_of_filter(1);
n = size_of_filter(2);
result = zeros(row_A,col_A);
for i=1:1:row_A
    for j=1:1:col_A
        bound= [i-(m-1)/2,i+(m-1)/2,j-(n-1)/2,j+(n-1)/2];
        bound(bound<1) = 1; %将边界值小于1的全都弄成1
        if(bound(2)>row_A)
            bound(2) = row_A;
        end
        if(bound(4)>col_A)
            bound(4) = col_A;
        end
        %边界值修正好了
        matrix = A(bound(1):bound(2),bound(3):bound(4));
        matrix = matrix(:)';%将矩阵化成行向量
        result(i,j) = median(matrix);
    end
end

result = uint8(result);
imshow(result);
figure;
imshow(A);

%end