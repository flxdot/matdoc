classdef Property < matdoc.uml.super.Base
    
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
            prefix = '   {field} ';
            if this.Constant
                prefix = sprintf('%s{static} ', prefix(1:end-1));
            end
            if this.Abstract
                prefix = sprintf('%s{abstract} ', prefix(1:end-1));
            end
            
            % acces level
            switch this.GetAccess
                case 'private'
                    AccessLevel = '- ';
                case 'protected'
                    AccessLevel = '# ';
                otherwise
                    AccessLevel = '+ ';
            end % switch this.GetAccess
            
            % name
            umlStr = sprintf('%s%s%s', prefix, AccessLevel, this.Name);
            
            % print inheritance hint?
            if this.Configuration.PropertyInheritanceHint && ...
                    ~strcmp(this.metaObj.DefiningClass.Name, this.Parent.Name)
                umlStr = sprintf('%s < %s', umlStr, this.metaObj.DefiningClass.Name);
            end % if this.Configuration.PropertyInheritanceHint
            
            % print description?
            if this.Configuration.PropertyDescription
                spacer = char(32 * ones(1, length(prefix) + length(AccessLevel)));
                umlStr = sprintf('%s\n%s%s\n%s', umlStr, spacer, this.Description, spacer);
            end % if this.Configuration.PropertyDescription
            
        end % function umlStr = getPlantUML(this)
        
    end %  methods (Access = protected)
    
end % classdef Property < handle
