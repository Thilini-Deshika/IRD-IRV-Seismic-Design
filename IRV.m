// function IRV_GUI

f = figure('Name','IRV Calculator','Position',[300 300 420 320]);

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
    'FontSize',11,'String','IRV = ');

uicontrol(f,'Style','pushbutton','Position',[150 100 120 30], ...
    'String','Compute IRV','Callback',@computeIRV);

    function computeIRV(,)
        mu = str2double(muBox.String);
        Te = str2double(TeBox.String);
        dampList = [5 10 20 30 40 50];
        damp = dampList(dampMenu.Value);
        motionType = motionMenu.Value;

        [C1,C2,C3,C4] = getIRVcoeff(damp,motionType);
        IRV = 1 + (mu-1)^C1 * (C2/(Te^C3) + C4/Te);
        resultText.String = ['IRV = ' num2str(IRV,4)];
    end
end

function [C1,C2,C3,C4] = getIRVcoeff(damp,motion)

data = struct( ...
 'd5',[0.314 -0.216 0.231 0.031; 0.323 -0.283 0.238 0.032; 0.317 -0.250 0.235 0.032], ...
 'd10',[0.384 -0.161 0.220 0.024; 0.354 -0.214 0.226 0.026; 0.364 -0.188 0.223 0.025], ...
 'd20',[0.480 -0.111 0.157 0.017; 0.383 -0.148 0.216 0.019; 0.422 -0.131 0.188 0.018], ...
 'd30',[0.499 -0.098 0.156 0.015; 0.387 -0.114 0.212 0.015; 0.439 -0.107 0.183 0.015], ...
 'd40',[0.499 -0.092 0.162 0.014; 0.384 -0.091 0.211 0.012; 0.441 -0.092 0.184 0.013], ...
 'd50',[0.479 -0.090 0.170 0.014; 0.368 -0.077 0.219 0.010; 0.427 -0.084 0.191 0.012] );

row = data.(['d' num2str(damp)])(motion,:);
[C1,C2,C3,C4] = deal(row(1),row(2),row(3),row(4));
end