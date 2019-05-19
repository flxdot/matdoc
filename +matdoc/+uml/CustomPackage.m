classdef CustomPackage < matdoc.uml.super.Base
    
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
            if isempty(this.Name)
                ident_ = -matdoc.uml.super.Base.IDENT;
            else % if isempty(this.Name)
                ident_ = abs(round(ident_(1)));
            end % if isempty(this.Name)
            
            % build the identStr
            identStr = char(32 * ones(1, ident_));
            
            % build the UML string %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if isempty(this.Name)
                umlStr = '';
            else
                umlStr = sprintf('%spackage %s {', identStr, this.Name);
            end
            
            % get the stand alone classes %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            for iClass = 1:length(this.ClassList)
                umlStr = sprintf('%s\n%s\n%s',...
                    umlStr,...
                    identStr,...
                    this.ClassList(iClass).getPlantUML(ident_ + matdoc.uml.super.Base.IDENT)...
                    );
            end % for iClass = 1:length(this.ClassList)
            
            % get the classes of the packages %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            for iPack = 1:length(this.PackageList)
                umlStr = sprintf('%s\n%s\n%s',...
                    umlStr,...
                    identStr,...
                    this.PackageList(iPack).getPlantUML(ident_ + matdoc.uml.super.Base.IDENT)...
                    );
            end % for iClass = 1:length(this.ClassList)
            
            % close the package string
            if ~isempty(this.Name)
                umlStr = sprintf('%s\n%s\n%s}',...
                    umlStr,...
                    identStr,...
                    identStr...
                    );
            end % if ~isempty(this.Name)
            
        end % function umlStr = getPlantUML(this)
        
    end % methods
    
end % classdef CustomPackage < handle