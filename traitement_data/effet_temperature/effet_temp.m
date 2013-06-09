clear all;
path='/Users/abecarix/Boulot/CdSe/SAXS/SC3356/data/';
temp = [30 40 50 60 70];
number = [420 421 423 425 433];

res =[];
for i=1:length(number)
    file_name = [path 'SC_3356_14_0_0' num2str(number(i)) '.dat'];
    Iq_f = importdata(file_name);  
    Iq = Iq_f.data;
    q = Iq(:,1);
    I = Iq(:,2);
    range = 234:332;
    q_peak = q(range);
    I_peak = I(range);
    peak = peakfit([q I],2.5,1,1,2);
    res = [res;peak(2:end)];
end
export_fig 'example_fit.pdf' -transparent

figure(2)
plot(temp,res(:,1),'r.-')
xlabel('temperature')
ylabel('qpeak (nm^{-1})');
export_fig 'effet_temp.pdf' -transparent


figure(3)
loglog(q,I,'linewidth',2)
XLim = [0.0618692 5.0039];
YLim = [0.00418162 61.3779];
export_fig 'Iq.pdf' -transparent

%%
    
number = [420];
res2 =[];
for i=1:length(number)
    file_name = [path 'SC_3356_14_0_0' num2str(number(i)) '.dat'];
    Iq_f = importdata(file_name);  
    Iq = Iq_f.data;
    q = Iq(:,1);
    I = Iq(:,2);
    range = 234:332;
    q_peak = q(range);
    I_peak = I(range);
    peak = peakfit([q I],1.3,0.8,2,2);
    peak(1,2:end)
    res2 = [res;peak(1,2:end)];
end
%%
figure(2)
plot(temp,res(:,1),'r.')
xlabel('temperature')
ylabel('qpeak (nm^{-1})');
%%

