clear;clc
% Get information of cameras
CamInfo=imaqhwinfo; % get all cameras' information
CamAdaptor=char(CamInfo.InstalledAdaptors(end));% Get last camera's name
CamInfo=imaqhwinfo(CamAdaptor);CamInfo=CamInfo.DeviceInfo;% Get last camera's information
CamID=length(CamInfo);% Choose last Camera and get its ID
CamFormat=char(CamInfo.SupportedFormats(end));%get a supported format
% Get memory: 3e7 bytes -> 28.61 Mb
%imaqmem(30000000);
%Create Camera object
CamObj=videoinput(CamAdaptor,CamID,CamFormat);
% Preview Camera video
preview(CamObj);

%test Canera
start(CamObj);

h=figure('NumberTitle','off','Name','After processing',...
    'MenuBar','none', 'Visible', 'on'); 
set(h,'doublebuffer','on');

while ishandle(h) 
Iyuv=getsnapshot (CamObj); 
I=ycbcr2rgb(Iyuv); 
flushdata(CamObj); 

drawnow; 
end





