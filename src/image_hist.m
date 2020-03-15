function [hist_,hist_pro] = image_hist(A)
    dia = size(size(A));
    if(dia(2) == 3)
        A = rgb2gray(A);
    end
    [row,col] = size(A);
    hist_ = zeros(1,256);%����ֵ��0��255
    for i=1:row
        for j=1:col
            pix = A(i,j) + 1;% ��Ϊ0�޷���Ϊ���������Լ�������
            hist_(pix) = hist_(pix) + 1;
        end
    end
    hist_pro = hist_/(row*col);
    x_range = 0:255;
    subplot(2,1,1);
    bar(x_range,hist_);
    title("ֱ��ͼ");
    subplot(2,1,2);
    bar(x_range,hist_pro);
    title("��һ��ֱ��ͼ");
    
end
