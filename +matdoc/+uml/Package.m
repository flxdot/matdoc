classdef Package < matdoc.uml.super.Base
   
    %% METHODS: PROTECTED
    methods (Access = protected)
        
        %% - umlStr = getPlantUML()
        function umlStr = getPlantUML(this)
            % function umlStr = getPlantUML(this)
            %
            % Returns the plantUML representation of this meta object.
            % Note: This method will be called by the getter of the
            % plantUML property of the matdoc.uml.super.Base.
            
            umlStr = '';
            
            % get all classes contained by this package %%%%%%%%%%%%%%%%%%%
            for iObj = 1:length(this.ClassList)
                umlStr = sprintf('%s\n\n%s', umlStr, this.ClassList(iObj).plantUML);
            end % for iObj = 1:length(this.ClassList)
            
        end % function umlStr = getPlantUML(this)
        
    end %  methods (Access = protected)
    
end % classdef Package < handle
