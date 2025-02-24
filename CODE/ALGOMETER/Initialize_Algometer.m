function ALG=Initialize_Algometer(com_port,baudrate)

if isempty(instrfind)
else
    fclose(instrfind);
end

disp('Connecting to COM port');
ALG=serial(com_port,'BaudRate',baudrate);
fopen(ALG);
disp('Done');



end

