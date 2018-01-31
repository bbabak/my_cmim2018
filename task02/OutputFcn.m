function status = OutputFcn( t, y, flag, data )
%OUTPUTFCN' Function that is called by the integrators in every timestep
%that generates an output.
if strcmp(flag, 'init')==1
else
    if ~isempty(t)
        tdisp=t(end);
		cpus = toc;
		cpum = floor(cpus/60);
		cpus = cpus - cpum*60;
		cpuh = floor(cpum/60);
		cpum = cpum - cpuh*60;
		clk = clock;
        display(['...t = ',num2str(tdisp),' s reached. Cumulative calculation time: ', num2str(cpuh),' h ', num2str(cpum), ' min ', num2str(cpus),' s. Printed at: ',num2str(clk(4)),':',num2str(clk(5)),':',num2str(floor(clk(6)))])

end
status = 0;
end

