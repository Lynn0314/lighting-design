function cpoints = Cpoints()
k=1;
%% ����㣬����100����1mһ��
%% ����ÿ������������������������������Ϊ1m
Yc = zeros(3,900);

%%  ������������Ϣ����һ��X���꣬�ڶ���Y���꣬������ΪZ����
for  j=0.5:1:100
    for i = -4:1:4
	    Yc(1,k)=i;
        Yc(2,k)=j;
        k = k+1;
    end
end
cpoints = Yc;
