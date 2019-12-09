function [s,e,f] = ieee754(x,fmt)

if ~isreal(x) || numel(x) > 1 || ~isa(x,'double')
  error('Real, scalar, double input required.')
end
hex = num2hex(x);        % string of 16 hex digits for x
dec = hex2dec(hex');     % decimal for each digit (1 per row)
bin = dec2bin(dec,4);    % 4 binary digits per row
bitstr = reshape(bin',[1 64]);  % string of 64 bits in order

% Return options
if nargout<2
  s = bitstr;      
else
  s = bitstr(1);
  e = bitstr(2:12);
  f = bitstr(13:64);
  if nargin > 1 && isequal(lower(fmt),'dec')
    s = bin2dec(s);  e = bin2dec(e);  f = bin2dec(f);
  end
end

