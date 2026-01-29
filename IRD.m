// function IRD_GUI

%% Create GUI
f = figure('Name','IRD Calculator','Position',[300 300 420 320]);

uicontrol(f,'Style','text','Position',[20 270 150 20],'String','Damping Ratio (%)');
dampMenu = uicontrol(f,'Style','popupmenu','Position',[180 270 200 20], ...
    'String',{'5','10','20','30','40','50'});

uicontrol(f,'Style','text','Position',[20 230 150 20],'String','Ground Motion');
motionMenu = uicontrol(f,'Style','popupmenu','Position',[180 230 200 20], ...
    'String',{'FD','FS','FD+FS'});

uicontrol(f,'Style','text','Position',[20 190 150 20],'String','Ductility (\mu)');
muBox = uicontrol(f,'Style','edit','Position',[180 190 200 20]);

uicontrol(f,'Style','text','Position',[20 150 150 20],'String','Effective Period (Te)');
TeBox = uicontrol(f,'Style','edit','Position',[180 150 200 20]);

resultText = uicontrol(f,'Style','text','Position',[20 60 360 30], ...
    'FontSize',11,'String','IRD = ');

uicontrol(f,'Style','pushbutton','Position',[150 100 120 30], ...
    'String','Compute IRD','Callback',@computeIRD);

%% Callback function
    function computeIRD(,)
        mu = str2double(muBox.String);
        Te = str2double(TeBox.String);
        dampList = [5 10 20 30 40 50];
        damp = dampList(dampMenu.Value);
        motionType = motionMenu.Value;

        % Get coefficients
        [C1,C2,C3,C4] = getIRDcoeff(damp,motionType);

        % Equation
        IRD = 1 + (mu-1)^C1 * (C2/(Te^C3) + C4/Te);
        resultText.String = ['IRD = ' num2str(IRD,4)];
    end
end

%% Coefficient Function
function [C1,C2,C3,C4] = getIRDcoeff(damp,motion)
% motion: 1=FD, 2=FS, 3=FD+FS

data = struct( ...
  'd5',[1.279 0.162 0.965 -0.124; 1.399 0.107 0.953 -0.077; 1.336 0.109 0.950 -0.075], ...
  'd10',[1.231 0.154 0.940 -0.106; 1.280 0.061 0.720 -0.007; 1.255 0.132 0.916 -0.081], ...
  'd20',[1.154 0.184 0.933 -0.126; 1.123 0.094 0.634 -0.007; 1.135 0.171 0.896 -0.101], ...
  'd30',[1.069 0.210 0.931 -0.144; 1.006 0.120 0.620 -0.011; 1.034 0.189 0.879 -0.105], ...
  'd40',[1.001 0.213 0.926 -0.142; 0.947 0.138 0.660 -0.021; 0.971 0.188 0.864 -0.097], ...
  'd50',[0.963 0.207 0.920 -0.134; 0.909 0.152 0.701 -0.033; 0.932 0.189 0.859 -0.095] );

row = data.(['d' num2str(damp)])(motion,:);
[C1,C2,C3,C4] = deal(row(1),row(2),row(3),row(4));
end