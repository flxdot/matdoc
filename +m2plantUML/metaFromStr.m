function objMeta = metaFromStr(ObjDescStr)
% function objMeta = metaFromStr(ObjDescStr)
%
% This method will try to figure out what the string represents.
%
% The follwong possibilities will be checked:
% - class ? 
% - package ?
% - path to a m file

% prepare the string by removing leading and trailing white spaces
ObjDescStr = strtrim(ObjDescStr);

% now let's try to figure out what you are
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Class %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% obtain a meta.class based on the name
try
    classObj = meta.class.fromName(ObjDescStr);
catch ex
    switch ex.identifier
        case 'MATLAB:class:InvalidSuperClass'
            error('m2plantUML:metaFromStr:InvalidSuperClass',...
                'It looks like if one ore more super classes might not be accessible:\n%s', ex.message);
        otherwise
            rethrowx(ex);
    end % switch ex.identifier
end % try

% has a class been found?
if ~isempty(classObj)
    objMeta = classObj;
    return;
end % if ~isempty(classObj)

% Package %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% obtain a meta.package based on the name
packageObj = meta.package.fromName(ObjDescStr);

% has a class been found?
if ~isempty(packageObj)
    objMeta = packageObj;
    return;
end % if ~isempty(classObj)

% Maybe path to a package?
altPackageName = strrep(strrep(ObjDescStr, '\+', '.'), '/+', '.');
packageObj = meta.package.fromName(altPackageName);

% has a class been found?
if ~isempty(packageObj)
    objMeta = packageObj;
    return;
end % if ~isempty(classObj)

% Maybe a path to a m file? %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if exist(ObjDescStr, 'file') == 2
    % get the path
    [objPath, objName, objExt] = fileparts(ObjDescStr);
    if ~strcmpi(objExt, '.m')
        error('m2plantUML:metaFromStr:UnkownFileType',...
            'Fetching of meta information is only possible for matlab m-files (*.m). You tried to get information for %s file: %s',...
            obj.Ext, ObjDescStr);
    end % if ~strcmpi(objExt, '.m')
    
    % add the path to the search path
    addpath(objPath);
    
    classObj = meta.class.fromName(objName);
    
    % has a class been found?
    if ~isempty(classObj)
        objMeta = classObj;
        return;
    end % if ~isempty(classObj)
    
    error('m2plantUML:metaFromStr:FileIsNotClass',...
            'Can not get meta information for file ''%s'' it seems not to be a class or it is within a package.', ObjDescStr);
    
end % if exist(ObjDescStr, 'file') == 2

% Maybe a class which is not on the search path? %%%%%%%%%%%%%%%%%%%%%%%%%%

NameParts = strsplit(ObjDescStr, '.');
PartCnt = length(NameParts);

% is each part a valid varname?
isvalid = true;
for iPart = 1:PartCnt
    isvalid = isvalid & isvarname(NameParts{iPart});
end %  for iPart = 1:length(NameParts)

% seems like the class is not on the search path
if isvalid
    % get the search path
    fullSearchPath = strsplit(path(), ';');
    searchPath = cell(0, 1);
    mlRootLen = length(matlabroot);
    for iPath = 1:length(fullSearchPath)
        if ~strncmp(fullSearchPath{iPath}, matlabroot, mlRootLen)
            searchPath{end+ 1, 1} = fullSearchPath{iPath};
        end
    end % for iPath = 1:length(fullSearchPath)
    
    error('m2plantUML:metaFromStr:ClassNotInSearchPath',...
        'It looks like you specified a class or package: %s\nBut I can not find anywhere in the search path. The current search path are the following directories:%s',...
        ObjDescStr, sprintf('\n - %s', searchPath{:}));
    
end % if isvalid

% nothing else was found
error('m2plantUML:metaFromStr:InvalidObj',...
    'Can not get meta information for ''%s''. Please make sure you''ve read the documetation.', ObjDescStr);

end % function objMeta = metaFromStr(ObjDescStr)

