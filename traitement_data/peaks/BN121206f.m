clear all;
path='/Users/abecarix/Boulot/CdSe/SAXS/SWING_2013_03/data/moyenne/';
file_name = [path 'CdSe_0757_moy.dat']
Iq = importdata(file_name);  
q = Iq(:,1)*10;
I = Iq(:,2)
figure(1)
loglog(q,I)
export_fig 'iq.pdf' -transparent


res=[];
range = 96:150;
q_peak = q(range);
I_peak = I(range);
peak = peakfit([q_peak I_peak],0,0,1,2);
export_fig 'fit_peak_1.pdf' -transparent
res = [res;peak(2:end)];


range = 200:300;
q_peak = q(range);
I_peak = I(range);
peak = peakfit([q_peak I_peak],0,0,1,2)
export_fig 'fit_peak_2.pdf' -transparent
res = [res;peak(2:end)];


range = 310:420;
q_peak = q(range);
I_peak = I(range);
peak = peakfit([q_peak I_peak],0,0,1,2)
export_fig 'fit_peak_3.pdf' -transparent
res = [res;peak(2:end)];

range = 420:560;
q_peak = q(range);
I_peak = I(range);
peak = peakfit([q_peak I_peak],0,0,1,2)
export_fig 'fit_peak_4.pdf' -transparent
res = [res;peak(2:end)];

range = 560:670;
q_peak = q(range);
I_peak = I(range);
peak = peakfit([q_peak I_peak],0,0,1,2)
export_fig 'fit_peak_5.pdf' -transparent
res = [res;peak(2:end)];

titres={'Position (nm-1)','Intensity','Width (nm-1)', 'Area'};
h=figure(2);
set(h,'Position',[100 100 700 1000]);
for i=1:4
    subplot(4,1,i);plot(res(:,i),'r.','MarkerSize',20)
    
    set(gca,'FontSize',16)
    ylabel(titres{i})
end
xlabel('order')
export_fig 'fit_peak_res.pdf' -transparent
