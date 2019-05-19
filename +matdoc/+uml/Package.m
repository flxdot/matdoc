classdef Package < matdoc.uml.super.Base
   
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
            
            % start the package tag
            umlStr = sprintf('%spackage %s {', identStr, this.NameRaw);
            
            % get all classes contained by this package %%%%%%%%%%%%%%%%%%%
            for iObj = 1:length(this.ClassList)
                umlStr = sprintf('%s\n\n%s',...
                    umlStr,...
                    this.ClassList(iObj).getPlantUML(ident_ + matdoc.uml.super.Base.IDENT)...
                    );
            end % for iObj = 1:length(this.ClassList)
            
            % close the package tag
            umlStr = sprintf('%s\n%s} as %s', umlStr, identStr, this.Alias);
            
        end % function umlStr = getPlantUML(this)
        
    end %  methods
    
end % classdef Package < handle
