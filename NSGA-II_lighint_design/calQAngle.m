%% 计算简化亮度系数的两个角度：光线入射以及观察面和入射面的夹角beta
function [tanGamma,beta] = calQAngle(CoorC, CoorD)
CoorQ = [0,-60,0]; %% 观察点的坐标值（在平面上的投影，实际计算是1.5m高）
if(CoorC(1)<4.5 &&CoorC(1)>1.5)
    CoorQ = [3,-60,0];
elseif(CoorC(1)<1.5 &&CoorC(1)>-1.5)
    CoorQ = [0,-60,0];
elseif(CoorC(1)<-1.5&& CoorC(1)>-4.5)
    CoorQ = [-3,-60,0];
end

CoorB = [CoorD(1),CoorD(2),0];
tanGamma = sqrt((CoorC(1)-CoorB(1))^2+(CoorC(2)-CoorB(2))^2)/CoorD(3);
%tanGamma

cb = [CoorC(1)-CoorB(1),CoorC(2)-CoorB(2)];
oc = [CoorQ(1)-CoorC(1), CoorQ(2)-CoorC(2)];
if(cb==0)
    beta = 180;
else
    bcMo = sqrt(cb(1)^2+cb(2)^2);
    ocMo = sqrt(oc(1)^2+oc(2)^2);
    cosBeta = (cb(1)*oc(1)+cb(2)*oc(2))/bcMo/ocMo;
    beta = acosd(cosBeta);
end
%beta