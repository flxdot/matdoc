%% - hash = string2hash(string)
function hash = string2hash(string)
%STRING2HASH Convert a string to a 32 char hex hash string (MD5 hash)
%
%   hash = string2hash(string)
%
%IN:
%   string - a string!
%
%OUT:
%   hash - a 32 character string, encoding the 256 bit SHA hash of string
%          in hexadecimal.

persistent md
if isempty(md)
    md = java.security.MessageDigest.getInstance('MD5');
end
hash = sprintf('%2.2x', typecast(md.digest(uint8(string)), 'uint8')');

end % function hash = string2hash(string)