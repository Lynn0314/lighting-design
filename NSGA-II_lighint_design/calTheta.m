function theta = calTheta(CoorC,CoorD,alpha, beta1,flag)

if(flag==1)
    alphaReal = alpha;
elseif(flag==0)
    alphaReal = -alpha;
end

CD = sqrt((CoorC(1)-CoorD(1))^2+(CoorC(2)-CoorD(2))^2+CoorD(3)*CoorD(3));
cosAlpha = cosd(alphaReal);
cosBeta = cosd(beta1);
tanAlpha = tand(alphaReal);
tanBeta = tand(beta1);

cosTheta = (CoorD(3)+ tanAlpha*(CoorC(1)-CoorD(1))+tanBeta*(CoorC(2)-CoorD(2))/cosAlpha)*cosAlpha*cosBeta/CD ;
theta = acosd(cosTheta);