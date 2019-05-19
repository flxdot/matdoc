classdef Property < matdoc.uml.super.Base
    
    %% METHODS: PUBLIC
    methods
        
        %% - umlStr = getPlantUML(ident_)
        function umlStr = getPlantUML(this, ident_)
            % function umlStr = getPlantUML(this, ident_)
            %
            % Returns the plantUML representation of this meta object.
            % Note: This method will be called by the getter of the
            % plantUML property of the matdoc.uml.super.Base.
            
            % process input %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if nargin < 2 || isempty(ident_)
                ident_ = 0;
            end % if nargin < 2 || isempty(ident_)
            if ~isnumeric(ident_)
                error('matdoc:uml:Package:getPlantUML:TypeError',...
                    'Input ident_ has to be numeric.');
            end % if ~isnumeric(ident_)
            
            % make sure its a scalar integer value
            ident_ = abs(round(ident_(1)));
            
            % build the identStr
            identStr = char(32 * ones(1, ident_));
            
            % build the UML string %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            % prefix
            prefix = sprintf('%s{field}', identStr);
            if this.Constant
                prefix = sprintf('%s {static}', prefix);
            end % if this.Constant
            if this.Abstract
                prefix = sprintf('%s {abstract}', prefix);
            end % if this.Abstract
            
            % acces level
            switch this.GetAccess
                case 'private'
                    AccessLevel = '-';
                case 'protected'
                    AccessLevel = '#';
                otherwise
                    AccessLevel = '+';
            end % switch this.GetAccess
            
            % name
            umlStr = sprintf('%s %s %s', prefix, AccessLevel, this.Name);
            
            % print inheritance hint?
            if this.Configuration.PropertyInheritanceHint && ...
                    ~strcmp(this.metaObj.DefiningClass.Name, this.Parent.Name)
                umlStr = sprintf('%s < %s', umlStr, this.metaObj.DefiningClass.Name);
            end % if this.Configuration.PropertyInheritanceHint
            
            % print description?
            if this.Configuration.PropertyDescription
                umlStr = sprintf('%s\n%s%s\n%s', umlStr, identStr, this.Description, identStr);
            end % if this.Configuration.PropertyDescription
            
        end % function umlStr = getPlantUML(this)
        
    end % methods
    
end % classdef Property < handle
