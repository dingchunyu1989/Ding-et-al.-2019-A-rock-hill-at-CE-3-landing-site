clc
close all
clear all

load data_gpr.mat

time_window = 640 %ns
travel_dis = 107.4;
dt = 0.3125; % Time sample interval of LPR channel 2 units in ns
t =linspace(0,time_window,2048);
th = 18;
dt = 0.3125;
x_space = linspace(81.45,96.99,1000);
y_space = linspace(-1.781,-1.681,1000);

per=1
de=0.3*0.5/sqrt(per);
d_a  = t*de;

figure;
subplot(2,2,1);plot(dis,ter_pos,'r-','LineWidth',2)
xlabel('Distance (m)');
ylabel('Elevation (m)');
hold on;plot(x_space,y_space,'cyan--','LineWidth',2)
image_format
set(gca,'yDir','reverse')

subplot(2,2,2);
imagesc(dis,d_a-44.08*de,data_ch2b,[-th,th]);colormap('gray');
ylim([-3,1.5])
xlim([77 102])
xlabel('Distance (m)');
ylabel('Apparent depth (m), ¦Å= 1');
image_format

subplot(2,2,3);
imagesc(dis,d_a-44.08*de,data_ch2b,[-th,th]);colormap('gray');
hold on;plot(dis,((data_line+89)*de*dt)-44.08*de,'r-','LineWidth',2)
hold on;plot(x_space,y_space,'cyan--','LineWidth',2)
ylim([-3,1.5])
xlim([77 102])
xlabel('Distance (m)');
ylabel('Apparent depth (m), ¦Å= 1');
image_format

for i  =1:length(x_space),
    a_Temp=x_space(i)-dis;
    [a_t,b_t]=min(abs(a_Temp));
    z_space(i)=ter_pos(b_t);
end
real_dep= y_space-z_space;
up_dis = dis(1007:1436);
up_pos = ter_pos(1007:1436);
slope_line = (-1.681+1.781)/(96.99-81.45);
b = -1.681-slope_line*96.99;
dis_s = linspace(70,100,1000);
y = slope_line*dis_s+b;
for i =1:length(up_dis),
    data_min=abs((up_dis(i)-dis_s));
    [h,d] = min(data_min);
    diff_dis(i)=up_pos(i)-y(d);
end

load subsurface_points_auto.mat
for j =1:length(x_s1),
    data_min=abs((x_s1(j)-up_dis));
    [h,d] = min(data_min);
    rea_dep(j)=-diff_dis(d);
end

x=rea_dep';
y=y_s1;

subplot(2,2,4);
func=inline('a*x','a','x');
a0=1;% initial value
[a,r,j]=nlinfit(x,y,func,a0);%a is the slope
c=nlparci(a,r,j).^2% 95%confident interval
c_confident_interval = c(2)-c(1)
xf=linspace(min(0,min(x)),max(x),10);
yf=a*xf;
h1=plot(x,y,'.');% Drawing orignal data
hold on
h2=plot(xf,yf,'r','LineWidth',1);% Drawing fiting curve

disp(['Slop= ' num2str(a)])
disp(['per= ' num2str(a^2)])
xlabel('Interpolated depth (m)');
ylabel('Apparent depth (m)');
image_format
xlim([0.35 0.56])
