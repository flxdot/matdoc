classdef Method < matdoc.uml.super.Base
    
    %% METHODS: PROTECTED
    methods (Access = protected)
        
        %% - umlStr = getPlantUML()
        function umlStr = getPlantUML(this)
            % function umlStr = getPlantUML(this)
            %
            % Returns the plantUML representation of this meta object.
            % Note: This method will be called by the getter of the
            % plantUML property of the matdoc.uml.super.Base.
            
            % prefix
            prefix = '   {method} ';
            if this.Static
               prefix = sprintf('%s{static} ', prefix(1:end-1)); 
            end
            if this.Abstract
               prefix = sprintf('%s{abstract} ', prefix(1:end-1)); 
            end
            
            % acces level
            switch this.Access
                case 'private'
                    AccessLevel = '- ';
                case 'protected'
                    AccessLevel = '# ';
                otherwise
                    AccessLevel = '+ ';
            end % switch this.GetAccess
            
            % method signature
            switch length(this.OutputNames)
                case 0
                    Outputs = '';
                case 1
                    Outputs = sprintf('%s = ', this.OutputNames{1});
                otherwise
                    Outputs = sprintf('%s, ', this.OutputNames{:});
                    Outputs = sprintf('[%s] = ', Outputs(1:end-2));
            end
            switch length(this.InputNames)
                case 0
                    Inputs = '';
                otherwise
                    Inputs = sprintf('%s, ', this.InputNames{:});
                    Inputs = Inputs(1:end-2);
            end
            MethodSignature = sprintf('%s%s(%s)', Outputs, this.Name, Inputs);
            
            % combine everything
            umlStr = sprintf('%s%s%s', prefix, AccessLevel, MethodSignature);
            
            % print inheritance hint?
            if this.Configuration.MethodInheritanceHint && ...
                    ~strcmp(this.metaObj.DefiningClass.Name, this.Parent.Name)
                umlStr = sprintf('%s < %s', umlStr, this.metaObj.DefiningClass.Name);
            end % if this.Configuration.PropertyInheritanceHint
            
        end % function umlStr = getPlantUML(this)
        
    end %  methods (Access = protected)
    
end % classdef Method < handle
