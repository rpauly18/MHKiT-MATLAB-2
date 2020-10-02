function TSR=tip_speed_ratio(rotor_speed, rotor_diameter, inflow_speed)

%%%%%%%%%%%%%%%%%%%%
%     Function used to calculate the tip speed ratio (TSR) of a MEC device with rotor
%     
%     
% Parameters
% ------------
%     rotor_speed : vector
%         Rotor Speed [rps]
%
%     rotor_diameter : double or int
%         diameter -f rotor [m]  
%         
%     inflow_speed : vector
%         Velocity of inflow condition [m/s]
%
% Returns
% ---------
%     TSR: vector 
%         Calculated tip speed ratio (TSR)
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

py_tsr = py.mhkit.river.performance.tip_speed_ratio(py.numpy.array(rotor_speed),double(rotor_diameter),py.numpy.array(inflow_speed));

TSR = double(py.array.array('d',py.numpy.nditer(py_tsr,pyargs("flags",{"refs_ok"}))));