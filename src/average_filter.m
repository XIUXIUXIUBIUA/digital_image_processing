function result = average_filter(input,filter)
    %�ռ����˲���
    %input Ϊ����ͼ�񣬱����ǻҶ�ͼ��
    %filter Ϊ�˲�������һ��m x n �ľ���   
    % �����˲�����С��ԭͼ����
    
    input = imread("Image_3_1.tif");
    filter = ones(7,7);
    [row_filter,col_filter] = size(filter);
    [row_input,col_input] = size(input);
    row_temp = row_input+row_filter-1;
    col_temp = col_input+col_filter-1;
    %ע��ָ��zeros�е�Ԫ��Ϊuint8���ͣ���Ȼ��ʾ������
    %Ϊ������Ŀ����ԣ����þ�����Ԫ��Ϊ�����ͣ������ȡ��
    result = zeros(row_input,col_input);
    temp = zeros(row_temp,col_temp);
    % temp�еķ����к���
    nozero_row = ((row_filter-1)/2+1):(((row_filter-1)/2+1)+row_input-1);
    nozero_col = ((col_filter-1)/2+1):(((col_filter-1)/2+1)+col_input-1);
    temp(nozero_row,nozero_col) = input;
    sum_filter = sum(filter(:));
    for i=1:row_input
        for j=1:col_input
            m = temp(i:i+row_filter-1,j:j+col_filter-1).*filter;
            result(i,j) = sum(m(:))/sum_filter;
        end
    end
    % ע�����ʹ��uint8(matrix)������ת����8λ���;���
    result = uint8(result);
    figure;
    subplot(1,2,1);
    imshow(input);
    title("ԭͼ��");
    subplot(1,2,2);
    imshow(result);
    title("ƽ���˲����ͼ��");

end