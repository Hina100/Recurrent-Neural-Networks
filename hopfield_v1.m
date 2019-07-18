clear all
close all
clc

%%

%defining the stable points
T = [1 1; -1 -1; 1 -1]';

%plot of the stable poonts
plot(T(1,:),T(2,:),'r*')
axis([-1.1 1.1 -1.1 1.1])
title('Hopfield Network State Space')
xlabel('a(1)');
ylabel('a(2)');

%create Hopfield network given the stable points T
net = newhop(T);

%checking if the target vectors are indeed stable
[Y,Pf,Af] = net([],[],T);
T,Y %if Y==T then stable

% define a random starting point and simulate the Hopfield network for
% n steps.  It should reach one of its stable points.
% n = columns in the .....net({n_steps},{},a)
n_steps = 18;
a = {rands(2,1)};
% a = {[0.1;0.3]}
  a = {[0.1;-1]}
[y,Pf,Af] = net({n_steps},{},a);
% 
%plot of the Hopfield networks activity.
record = [cell2mat(a) cell2mat(y)];
start = cell2mat(a);
hold on
plot(start(1,1),start(2,1),'bx',record(1,:),record(2,:))

% We repeat the simulation for 25 more initial conditions.
color = 'rgbmy';
% i = number of 'x' points in figure/initial conditions???
for i=1:5
   a = {rands(2,1)}; %Will genrate 2rows*1col array
   [y,Pf,Af] = net({n_steps},{},a);
   record=[cell2mat(a) cell2mat(y)];
   start=cell2mat(a);
   plot(start(1,1),start(2,1),'kx',record(1,:),record(2,:),color(rem(i,5)+1))
end

