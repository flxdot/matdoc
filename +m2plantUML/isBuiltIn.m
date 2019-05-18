function tf = isBuiltIn(object)
% function tf = isBuiltIn(object)
%
% This method will determine if the given class or object is a built-in.
%
% Input object may be a string with the class name, meta.class or a
% instance of the object it self.

if ischar(object)
    % is the given object a valid accessible class?
    object = meta.class.fromName(object);
    if isempty(object)
        error('m2plantUML:isBuiltIn:ClassNotFound',...
            'Class ''%s'' can not be located or may not be on the matlab search path.', object);
    end % if isempty(metaObj)
elseif ~isa(object, 'meta.class')
    object = metaclass(object);
end % if ischar(object)

% is the class a build-in?
tf = strncmpi(which(object.Name), 'built-in', 8);

end % function tf = isBuiltIn(object)