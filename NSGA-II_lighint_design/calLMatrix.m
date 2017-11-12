%% 计算计算点亮度矩阵
%% 输入参数：横向照明角度，纵向照明角度，灯具间距，安装高度，侧向中间距
function L = calLMatrix(alpha, beta,l,h,w,CPoints)

%% 亮度矩阵和计算点的数目一致 9*100
L= zeros(1,900);
%% 影响计算区域内计算点亮度的灯具数目（一列）
numOfLamps = fix(100/l)+5;% 决定一个计算点亮度需要四盏灯

%% 两排灯具的坐标值
DlPoints = ones(3, numOfLamps);
DrPoints = ones(3, numOfLamps);
% 横坐标和距离中线距离相等
DlPoints(1, :) =  w .* DlPoints(1,:); % X轴正向
DrPoints(1, :) =  -w .* DrPoints(1,:); % X轴负方向
%纵坐标沿y轴正向均匀分布，间距为l
DlPoints(2,:) = 0:l:(numOfLamps-1)*l;
DrPoints(2,:) = 0:l:(numOfLamps-1)*l;
% 高度即为安装高度 h
DlPoints(3, :) =  h .* DlPoints(3,:);
DrPoints(3, :) =  h .* DrPoints(3,:);
DlPoints

%% 针对每一个计算点进行计算
layer = 0;
a = '灯具号：';
for points = 1:100
    %% 灯具Y坐标，以及计算点的坐标，寻找第一个有影响的灯具y所在的index值
    index = findDindex(DlPoints(2,:),CPoints(2,9*points));
    %index
    for c9 = 1:9 %% 每9个计算点具有相同的Y值，具有相同的灯具影响
        indexCal = (points-1)*9+c9;
        %indexCal
        CoorC = CPoints(:,indexCal);
        %CoorC
        for lampsIndex = index:(index+3)
            %% 两个灯对计算点的亮度
            CoorD1 = DlPoints(:,lampsIndex);
            %CoorD1
            [tanGamma,beta1] = calQAngle(CoorC, CoorD1);
            q = calSimplifiedQ(tanGamma,beta1);
            q
            deltaL = calIlluminance(CoorC,CoorD1,alpha,beta,1)*q
            L(indexCal) = L(indexCal)+ deltaL;
            fprintf('%s, %s %f \n','left',a,deltaL)
            
            CoorD2 = DrPoints(:,lampsIndex);
            [tanGamma,beta2] = calQAngle(CoorC, CoorD2);
            q = calSimplifiedQ(tanGamma,beta2);
            deltaR = calIlluminance(CoorC,CoorD2,alpha,beta,0)*q;
            L(indexCal) =L(indexCal)+ deltaR;
            fprintf('%s, %s %f \n','right',a,deltaR)
            
        end
        fprintf('%d %s %f \n',indexCal,'总亮度为：',L(indexCal))
         
    end
    layer = layer + 1
    points
end
