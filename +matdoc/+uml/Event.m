classdef Event < matdoc.uml.super.Base
    
    %% METHODS: PROTECTED
    methods (Access = protected)
        
        %% - umlStr = getPlantUML()
        function umlStr = getPlantUML(this)
            % function umlStr = getPlantUML(this)
            %
            % Returns the plantUML representation of this meta object.
            % Note: This method will be called by the getter of the
            % plantUML property of the matdoc.uml.super.Base.
            
            umlStr = sprintf('   %s', this.Name);
            
            % print inheritance hint?
            if this.Configuration.PropertyInheritanceHint && ...
                    ~strcmp(this.metaObj.DefiningClass.Name, this.Parent.Name)
                umlStr = sprintf('%s < %s', umlStr, this.metaObj.DefiningClass.Name);
            end % if this.Configuration.PropertyInheritanceHint
            
        end % function umlStr = getPlantUML(this)
        
    end %  methods (Access = protected)
    
end % classdef Event < handle
