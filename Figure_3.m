
% Process of deriving the relative permittivity for the topographic hill.
% Reference: Ding, C. Y et al (2019). A rocky hill on the continuous ejecta of Ziwei revealed by the Chang¡¯e-3 mission.
% Published in Earth and Planetary Physics.
% by Dr.Chunyu Ding (E-mail:baci.dingchunyu@gmail.com)
% Sep. 2019

clc
close all
clear all

load data_per_1_raw.mat

figure;subplot(2,3,1);imagesc(dis,d_a-zero_pos,data_ch2,[-500,500]);colormap('gray');
hold on;plot(dis,ter_pos,'r-','LineWidth',2)
ylim([-3.5,0])
xlim([77 102])
hold on;plot(x_space,y_space,'cyan--','LineWidth',2)
axis off;
clear data_ch2 ter_pos dis d_a zero_pos x_space y_space

th=20;
load data_per_1.mat
subplot(2,3,2);imagesc(dis,d_a-zero_pos,data_ch2,[-th,th]);colormap('gray');
hold on;plot(dis,ter_pos,'r-','LineWidth',2)
ylim([-3.5,0])
xlim([77 102])
hold on;plot(x_space,y_space,'cyan--','LineWidth',2)
axis off;
clear data_ch2 ter_pos dis d_a zero_pos x_space y_space

load data_per_3_raw.mat
subplot(2,3,3);imagesc(dis,d_a-zero_pos,data_ch2,[-th,th]);colormap('gray');
hold on;plot(dis,ter_pos,'r-','LineWidth',2)
ylim([-3.5,0])
xlim([77 102])
hold on;plot(x_space,y_space,'cyan--','LineWidth',2)
axis off;
clear data_ch2 ter_pos dis d_a zero_pos x_space y_space

load data_per_5_raw.mat
subplot(2,3,4);imagesc(dis,d_a-zero_pos,data_ch2,[-th,th]);colormap('gray');
hold on;plot(dis,ter_pos,'r-','LineWidth',2)
ylim([-3.5,0])
xlim([77 102])
hold on;plot(x_space,y_space,'cyan--','LineWidth',2)
axis off;
clear data_ch2 ter_pos dis d_a zero_pos x_space y_space

load data_per_7_raw.mat
subplot(2,3,5);imagesc(dis,d_a-zero_pos,data_ch2,[-th,th]);colormap('gray');
hold on;plot(dis,ter_pos,'r-','LineWidth',2)
ylim([-3.5,0])
xlim([77 102])
hold on;plot(x_space,y_space,'cyan--','LineWidth',2)
axis off;
clear data_ch2 ter_pos dis d_a zero_pos x_space y_space

load data_per_9_raw.mat
subplot(2,3,6);imagesc(dis,d_a-zero_pos,data_ch2,[-th,th]);colormap('gray');
hold on;plot(dis,ter_pos,'r-','LineWidth',2)
ylim([-3.5,0])
xlim([77 102])
hold on;plot(x_space,y_space,'cyan--','LineWidth',2)
axis off;
clear data_ch2 ter_pos dis d_a zero_pos x_space y_space

