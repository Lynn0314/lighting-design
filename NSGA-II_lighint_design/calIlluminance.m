%% �������ն�ֵ����,flag=1,��x���������ת�Ƕ�Ϊ��Ϊ��׼
function illuminance = calIlluminance(CoordC, CoordD, alpha, beta, flag)
%% ���ݼ���㣬�ƾ����꣬�ƾߺ��������Ƕȣ��ƾ����������Ƕȣ������theta�Ƕȣ�������������н�
theta1 = calTheta(CoordC,CoordD,alpha, beta,flag);

%% ����theta����I(��ǿ����)
Itheta = calITheta(theta1);

%% ����ƾ�����������֮��ľ���l
l2 = sqrt((CoordC(1)-CoordD(1))^2+(CoordC(2)-CoordD(2))^2+(CoordC(3)-CoordD(3))^2);
cosIn = CoordD(3)/l2;
%% �������ն�ֵ
illuminance = Itheta*(cosIn^3)/CoordD(3)/CoordD(3);
