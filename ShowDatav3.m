

if ~exist('Datav3')
  load('Datav3.mat')
end
%%

%nrecord = 449; % mooie Q=2200 bij v=12 responsie
%nrecord = 437; % Q=2200 en v=6
% nrecord = 340
nrecord = 786;

part = Data(nrecord).participant;
velo = Data(nrecord).velocity*3.6; % km/h
pull = Data(nrecord).pull;
forc = Data(nrecord).force;
outc = Data(nrecord).outcome;

t = Data(nrecord).t;
v = Data(nrecord).v;
phi = Data(nrecord).phi;
delta = Data(nrecord).delta;
phiDot = Data(nrecord).phiDot;
deltaDot = Data(nrecord).deltaDot;
psi = Data(nrecord).psi;
yP = Data(nrecord).yP;
yQ = Data(nrecord).yQ;


figure
plot(t,v);
grid on
xlabel('t [sec]')
ylabel('velocity [m/s]')
title('Velocity')


phimax = 45*pi/180;
yQmax = 1.2/2;

set(0,'defaultLineLineWidth',2)

figure
subplot(2,1,1)
plot(t,phi);
hold on
plot(t,delta);
grid on
xlabel('t [sec]')
ylabel('phi, delta [rad]')
plot([0 3],[phimax phimax],'k')
plot([0 3],[-phimax -phimax],'k')
plot([0.3 0.3],[-phimax phimax],':k')
%xlim([0 3])
%ylim([-1 1])
legend('roll angle phi','steer angle delta')
title(sprintf('participant=%d, v=%g km/h, pull=%d, DL=%g Nms, Outcome=%d',part,velo,pull,forc*0.3,outc))


subplot(2,1,2)
plot(t,psi);
hold on
plot(t,yQ);
grid on
xlabel('t [sec]')
ylabel('psi [rad], yQ [m]')
title('psi en yQ')
plot([0 3],[yQmax yQmax],'k')
plot([0 3],[-yQmax -yQmax],'k')
plot([0.3 0.3],[-phimax phimax],':k')
%xlim([0 3])
%ylim([-0.6 0.6])
legend('heading angle psi','lateral displacement front wheel yQ')
title(sprintf('participant=%d, v=%g km/h, pull=%d, DL=%g Nms, Outcome=%d',part,velo,pull,forc*0.3,outc))


