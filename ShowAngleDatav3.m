% Plot the angle content of an indivdual record from Datav3.mat
set(0,'defaultLineLineWidth',2)

% load Datav3.mat
if ~exist('Datav3.mat')
    load('Datav3.mat')
end

% chooce a record
nrec = 10;

data = Datav3(nrec);

figure
plot(data.t,data.psi)
hold on
plot(data.t,data.delta)
plot(data.t,data.phi)
grid on
legend('psi','delta','phi')

figure
plot(data.t,data.psiub)
hold on
plot(data.t,data.thetaub)
plot(data.t,data.phiub)
grid on
legend('psiub','thetaub','phiub')

% now combine bicycle and rider lean angles
figure
plot(data.t,data.phi)
hold on
plot(data.t,data.phiub)
plot(data.t,data.phi+data.phiub)
grid on
legend('phi','phiub','phi+phiub')
