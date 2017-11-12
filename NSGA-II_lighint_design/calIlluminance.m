%% 计算点的照度值计算,flag=1,以x正向方向的旋转角度为正为基准
function illuminance = calIlluminance(CoordC, CoordD, alpha, beta, flag)
%% 根据计算点，灯具坐标，灯具横向照明角度，灯具纵向照明角度，计算出theta角度，出射光线与灯轴夹角
theta1 = calTheta(CoordC,CoordD,alpha, beta,flag);

%% 根据theta计算I(光强数据)
Itheta = calITheta(theta1);

%% 计算灯具坐标与计算点之间的距离l
l2 = sqrt((CoordC(1)-CoordD(1))^2+(CoordC(2)-CoordD(2))^2+(CoordC(3)-CoordD(3))^2);
cosIn = CoordD(3)/l2;
%% 计算点的照度值
illuminance = Itheta*(cosIn^3)/CoordD(3)/CoordD(3);
