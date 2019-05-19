classdef Method < matdoc.uml.super.Base
    
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
            prefix = sprintf('%s{method}', identStr);
            if this.Static
               prefix = sprintf('%s {static}', prefix); 
            end
            if this.Abstract
               prefix = sprintf('%s {abstract}', prefix); 
            end
            
            % acces level
            switch this.Access
                case 'private'
                    AccessLevel = '-';
                case 'protected'
                    AccessLevel = '#';
                otherwise
                    AccessLevel = '+';
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
            umlStr = sprintf('%s %s %s', prefix, AccessLevel, MethodSignature);
            
            % print inheritance hint?
            if this.Configuration.MethodInheritanceHint && ...
                    ~strcmp(this.metaObj.DefiningClass.Name, this.Parent.Name)
                umlStr = sprintf('%s < %s', umlStr, this.metaObj.DefiningClass.Name);
            end % if this.Configuration.PropertyInheritanceHint
            
        end % function umlStr = getPlantUML(this)
        
    end %  methods
    
end % classdef Method < handle
