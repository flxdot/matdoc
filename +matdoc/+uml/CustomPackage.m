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
            
            % 
            if this.Configuration.IgnoreTests && strncmp(this.Name, 'matlab.unittest', 15)
                umlStr = '';
                return;
            end % if this.Configuration.IgnoreTests && strncmp(this.Name, 'matlab.unittest', 15)
            
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
            exportedClassCnt = 0;
            for iClass = 1:length(this.ClassList)
                % 
                curClass = this.ClassList(iClass);
                
                % check if the current class need to be skipped 
                if (this.Configuration.IgnoreBuiltInClass && curClass.isBuiltIn) || ...
                        (this.Configuration.IgnoreTests && curClass.isUnitTest)
                    continue;
                end % if (this.Configuration.IgnoreBuiltInClass && curClass.isBuiltIn) || ...
                
                umlStr = sprintf('%s\n%s\n%s',...
                    umlStr,...
                    identStr,...
                    curClass.getPlantUML(ident_ + matdoc.uml.super.Base.IDENT)...
                    );
                
                exportedClassCnt = exportedClassCnt + 1;
            end % for iClass = 1:length(this.ClassList)
            
            % get the classes of the packages %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            exportedPackageCnt = 0;
            for iPack = 1:length(this.PackageList)
                
                curPackageUml = this.PackageList(iPack).getPlantUML(ident_ + matdoc.uml.super.Base.IDENT);
                if isempty(strtrim(curPackageUml))
                    continue;
                end % if isempty(curPackageUml)
                
                umlStr = sprintf('%s\n%s\n%s',...
                    umlStr,...
                    identStr,...
                    curPackageUml...
                    );
                exportedPackageCnt = exportedPackageCnt + 1;
            end % for iClass = 1:length(this.ClassList)
            
            % make sure to hide this custom package if neither a class nor
            % a sub package was exported
            if exportedPackageCnt + exportedClassCnt == 0
                umlStr = '';
                return;
            end % if exportedPackageCnt + exportedClassCnt == 0
            
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