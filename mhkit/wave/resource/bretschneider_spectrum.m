function S=bretschneider_spectrum(frequency,Tp,Hs)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Calculates Bretschneider Sprectrum from Tucker and Pitt (2001)
%    
% Parameters
% ------------
%
%     Frequency: float
%         Wave frequency (Hz)
%
%     Tp: float
%         Peak Period (s)
%
%     Hs: float 
%         Significant Wave Height (s)
%
%     
% Returns
% ---------
%     S: structure
%
%
%         S.spectrum=Spectral Density (m^2/Hz)
%
%         S.type=String of the spectra type, i.e. Bretschneider, 
%         time series, date stamp etc. 
%
%         S.frequency= frequency (Hz)
%
%         S.Te
%
%         S.Hm0
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


py.importlib.import_module('mhkit');
py.importlib.import_module('numpy');

if (isa(frequency,'py.numpy.ndarray') ~= 1)
    frequency = py.numpy.array(frequency);
end

S_py=py.mhkit.wave.resource.bretschneider_spectrum(frequency,Tp,Hs);

S.spectrum=double(py.array.array('d',py.numpy.nditer(S_py.values))).';
char_arr=char(S_py.index.values);
S.frequency=double(py.array.array('d',py.numpy.nditer(S_py.index))).';
S.Tp=Tp;