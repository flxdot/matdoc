function tf = isClassOrPackage(string)
% function tf = isClassOrPackage(string)
%
% Checks if the passed string refers to a class or a package.

tf = ~isempty(meta.class.fromName(string)) || ~isempty(meta.package.fromName(string));

end % function tf = isClassOrPackage(string)