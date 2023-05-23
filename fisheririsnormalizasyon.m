%Karar verme yöntemi (Topsis Method)
%normalizasyon=
%sum(veri) %(veri matrisinin sütun değerlerini topla)
%sum(veri,1) %(satırları toplar)
%           1.  2.  3.  (durumlar)
%1.marka    7   8   9
%2.marka    8   9   6        bir sütundaki her elemanın karesinin alıp topla kökünü al 
%3.marka    4   5   6        sütundaki elemanların herbirine bölerek, bölünen sayının
%4.marka    4   5   6        normalizasyonunu almış ol.
clc,clear
load fisheriris
sum(meas.^2)
a=(sum(meas.^2)).^0.5
normalize=meas./a
kriteragirligi=xlsread('matlabicin',2) %excelin 2. sayfası
% kriteragirligi=species(:,2);
krt_agrlkl_normalize=kriteragirligi.*normalize
krt_tipi=xlsread('matlabicin',3)   %excelin 3. sayfası

for i=1:length(krt_tipi)
    if(krt_tipi(1,i)==1)
        poz_idl(1,i)=max(krt_agrlkl_normalize(:,i))
        neg_idl(1,i)=min(krt_agrlkl_normalize(:,i))
    else
        poz_idl(1,i)=min(krt_agrlkl_normalize(:,i))
        neg_idl(1,i)=max(krt_agrlkl_normalize(:,i))
    end
end
% poz_idl_coz=max(krt_agrlkl_normalize).*krt_tipi+min(krt_agrlkl_normalize).*(1-ktr_tipi)
% neg_idl_coz=min(krt_agrlkl_normalize).*krt_tipi+max(krt_agrlkl_normalize).*(1-ktr_tipi)
% Böyle de çözülebilirdi.

for i=1:4
Sp(i)=sqrt(sum((krt_agrlkl_normalize(i,:)-poz_idl).^2));
Sn(i)=sqrt(sum((krt_agrlkl_normalize(i,:)-neg_idl).^2));
C(i)=Sn(i)/(Sp(i)+Sn(i))
end
max(C)