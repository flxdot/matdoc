classdef Event < matdoc.uml.super.Base
    
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
            
            umlStr = sprintf('%s%s', identStr, this.Name);
            
            % print inheritance hint?
            if this.Configuration.PropertyInheritanceHint && ...
                    ~strcmp(this.metaObj.DefiningClass.Name, this.Parent.Name)
                umlStr = sprintf('%s < %s', umlStr, this.metaObj.DefiningClass.Name);
            end % if this.Configuration.PropertyInheritanceHint
            
        end % function umlStr = getPlantUML(this)
        
    end %  methods
    
end % classdef Event < handle
