classdef WithMetaObjProps < handle
    
    %% PROPERTIES: ACCESS = PROTECTED
    properties (Access = protected)
         
        % the parent object
        Parent;
        
        % Handle to the parent matdoc.Documentation class
        UmlRoot;
        
        % The handle to the export configuration
        Configuration;
        
    end % properties (Access = protected)
    
end % classdef WithMetaObjProps < handle
