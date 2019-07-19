classdef Base < matdoc.super.WithMetaObjProps & ...
        matdoc.uml.super.WithPlantUML
   
    
    %% PROPERTIES: CONSTANT
    properties (Constant)
        
        % Number if spaces for each identation level in the RST file
        SPHINX_IDENT = 3;
        
    end % properties (Constant)
    
end % classdef Base < handle