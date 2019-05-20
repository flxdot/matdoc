classdef Class < matdoc.uml.super.Base
    
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
            
            % uml string start %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if ~isempty(this.EnumerationMemberList)
                classPrefix = 'enum';
            elseif this.Abstract
                classPrefix = 'abstract class';
            else
                classPrefix = 'class';
            end % if this.Abstract
            umlStr = sprintf('%s%s %s {',identStr, classPrefix, this.Name);
            
            % add UML String for each enumeration value %%%%%%%%%%%%%%%%%%%
            if ~this.Configuration.HideEnumerationMember
                umlStr = sprintf('%s%s',...
                    umlStr,...
                    getPlantUmlEnumerationValues(this, ident_ + matdoc.uml.super.Base.IDENT)...
                    );
            end % if ~this.Configuration.HideEnumerationMember
            
            % add UML String of each field %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if ~this.Configuration.HideProperties
                umlStr = sprintf('%s%s',...
                    umlStr,...
                    getPlantUmlProperties(this, ident_ + matdoc.uml.super.Base.IDENT)...
                    );
            end % if ~this.Configuration.HideProperties
            
            % add UML String for each method %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if ~this.Configuration.HideMethods
                umlStr = sprintf('%s%s',...
                    umlStr,...
                    getPlantUmlMethods(this, ident_ + matdoc.uml.super.Base.IDENT)...
                    );
            end % if ~this.Configuration.HideMethods
            
            % add UML String for each event %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if ~this.Configuration.HideEvents
                umlStr = sprintf('%s%s',...
                    umlStr,...
                    getPlantUmlEvents(this, ident_ + matdoc.uml.super.Base.IDENT)...
                    );
            end % if ~this.Configuration.HideEvents
            
            % close the class section the UML end %%%%%%%%%%%%%%%%%%%%%%%%%
            umlStr = sprintf('%s\n%s}', umlStr, identStr);
            
            % add UML String for each superclass inheritance %%%%%%%%%%%%%%
            %if ~this.Configuration.HideInheritance
            %    umlStr = sprintf('%s%s',...
            %        umlStr,...
            %        getPlantUmlInheritanceRelation(this, ident_)...
            %        );
            %end % if ~this.Configuration.HideInheritance
            
        end % function umlStr = getPlantUML(this)
        
        %% - umlStr = getPlantUmlInheritanceRelation(ident_)
        function umlStr = getPlantUmlInheritanceRelation(this, ident_)
            % function umlStr = getPlantUmlInheritanceRelation(this, ident_)
            %
            % Returns the uml string defining the class inheritances
            
            if this.Configuration.HideInheritance
                  umlStr = '';
                  return;
            end % if this.Configuration.HideInheritance
            
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
            
            umlStr = '';
            relations = this.InheritationRelations;
            relationCnt = length(relations);
            if relationCnt > 0
                % add first relation without a new line
                umlStr = sprintf('%s%s',...
                    identStr,...
                    relations{1}...
                    );
                for idx = 2:relationCnt
                    umlStr = sprintf('%s\n%s%s',...
                        umlStr,...
                        identStr,...
                        relations{idx}...
                        );
                end % for idx = 1:length(this.InheritationRelations)
            end % if relationCnt > 0
            
        end % function umlStr = getPlantUmlInheritanceRelation(this, ident_)
        
    end % methods
    
    %% METHODS: PROTECTED
    methods (Access = protected)
        %% - umlStr = getPlantUmlProperties(ident_)
        function umlStr = getPlantUmlProperties(this, ident_)
            % function umlStr = getPlantUmlProperties(this)
            %
            % Returns the uml string for the properties of this class
            
            % if there are no members of the list, return an empty string
            if isempty(this.PropertyList)
                umlStr = '';
                return;
            end % if isempty(this.PropertyList)
            
            % build the identStr
            identStr = char(32 * ones(1, ident_));
            
            umlStr = '';
            umlCatStr = '';
            for iCat = 1:size(this.SortedPropertyList, 1)
                
                % loop over the methods
                curUmlCatStr = '';
                theProperties = this.SortedPropertyList{iCat, 2};
                for iProperty = 1:length(theProperties)
                    % get the currently processed method
                    curMetaObj = theProperties(iProperty);
                    
                    % may be the class needs to be skipped?
                    if this.Configuration.IngoreBuiltInPropertyInheritance && ...
                            matdoc.tools.isBuiltIn(curMetaObj.metaObj.DefiningClass)
                        continue;
                    end % if this.Configuration.IgnoreBuiltInClass && curMetaClass.isBuiltIn
                    
                    % add it to the string
                    curUmlCatStr = sprintf('%s\n%s',...
                        curUmlCatStr,...
                        curMetaObj.getPlantUML(ident_)...
                        );
                end % for iObj = 1:length(this.PropertyList)
                
                % check if this category needs to be added or if they are
                % empty
                if ~isempty(curUmlCatStr)
                    % add the headline of the current category
                    umlCatStr = sprintf('%s\n%s.. %s ..%s',...
                        umlCatStr,...
                        identStr,...
                        this.SortedPropertyList{iCat, 1},...
                        curUmlCatStr...
                        );
                end % if ~isempty(umlCatStr)
            end % for iCat = 1:size(this.SortedPropertyList, 1)
            
            % check if the method have to be added after all
            if ~isempty(umlCatStr)
                umlStr = sprintf('\n%s-- Properties --%s', identStr, umlCatStr);
            end % if ~isempty(umlCatStr)
            
        end % function umlStr = getPlantUmlProperties(this, ident_)
        
        %% - umlStr = getPlantUmlMethods(ident_)
        function umlStr = getPlantUmlMethods(this, ident_)
            % function umlStr = getPlantUmlMethods(this, ident_)
            %
            % Returns the uml string for the methods of this class
            
            % if there are no members of the list, return an empty string
            if isempty(this.MethodList)
                umlStr = '';
                return;
            end % if isempty(this.MethodList)
            
            % build the identStr
            identStr = char(32 * ones(1, ident_));
            
            umlStr = '';
            umlCatStr = '';
            % Get the Signature of the constructor %%%%%%%%%%%%%%%%%%%%%%%%
            if ~isempty(this.Constructor)
                umlCatStr = sprintf('%s\n%s',...
                    umlCatStr,...
                    this.Constructor.getPlantUML(ident_)...
                    );
            end % if ~isempty(this.Constructor)
            
            % Get all methods by category %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            for iCat = 1:size(this.SortedMethodList, 1)
                
                % loop over the methods %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                curUmlCatStr = '';
                theMethods = this.SortedMethodList{iCat, 2};
                for iMethod = 1:length(theMethods)
                    % get the currently processed method
                    curMetaObj = theMethods(iMethod);
                    
                    % may be the class needs to be skipped?
                    if curMetaObj.isConstructor || ...
                            (this.Configuration.IngoreBuiltInMethodInheritance &&...
                            matdoc.tools.isBuiltIn(curMetaObj.metaObj.DefiningClass))
                        continue;
                    end % if this.Configuration.IgnoreBuiltInClass && curMetaClass.isBuiltIn
                    
                    % add it to the string
                    curUmlCatStr = sprintf('%s\n%s',...
                        curUmlCatStr,...
                        curMetaObj.getPlantUML(ident_)...
                        );
                end % for iObj = 1:length(this.MethodList)
                
                % check if this category needs to be added or if they are
                % empty
                if ~isempty(curUmlCatStr)
                    % add the headline of the current category
                    umlCatStr = sprintf('%s\n%s.. %s ..%s',...
                        umlCatStr,...
                        identStr,...
                        this.SortedMethodList{iCat, 1},...
                        curUmlCatStr...
                        );
                end % if ~isempty(umlCatStr)
            end % for iCat = 1:size(this.SortedMethodList, 1)
            
            % check if the method have to be added after all %%%%%%%%%%%%%%
            if ~isempty(umlCatStr)
                umlStr = sprintf('\n%s-- Methods --%s', identStr, umlCatStr);
            end % if ~isempty(umlCatStr)
            
        end % function umlStr = getPlantUmlMethods(this, ident_)
        
        %% - umlStr = getPlantUmlEvents(ident_)
        function umlStr = getPlantUmlEvents(this, ident_)
            % function umlStr = getPlantUmlEvents(this, ident_)
            %
            % Returns the uml string for the events of this class
            
            % if there are no members of the list, return an empty string
            if isempty(this.EventList)
                umlStr = '';
                return;
            end % if isempty(this.EventList)
            
            % build the identStr
            identStr = char(32 * ones(1, ident_));
            
            umlStr = sprintf('\n%s-- Events --', identStr);
            
            for iObj = 1:length(this.EventList)
                curMetaObj = this.EventList(iObj);
                umlStr = sprintf('%s\n%s',...
                    umlStr,...
                    curMetaObj.getPlantUML(ident_)...
                    );
            end % for iObj = 1:length(this.EventList)
            
        end % function umlStr = getPlantUmlEvents(this)
        
        %% - umlStr = getPlantUmlEnumerationValues(ident_)
        function umlStr = getPlantUmlEnumerationValues(this, ident_)
            % function umlStr = getPlantUmlEnumerationValues(this, ident_)
            %
            % Returns the uml string for the enumeration values of this class
            
            % if there are no members of the list, return an empty string
            if isempty(this.EnumerationMemberList)
                umlStr = '';
                return;
            end % if isempty(this.EnumerationMemberList)
            
            % build the identStr
            identStr = char(32 * ones(1, ident_));
            
            umlStr = sprintf('\n%s-- Enumeration Values --', identStr);
            
            for iObj = 1:length(this.EnumerationMemberList)
                curMetaObj = this.EnumerationMemberList(iObj);
                umlStr = sprintf('%s\n%s',...
                    umlStr,...
                    curMetaObj.getPlantUML(ident_)...
                    );
            end % for iObj = 1:length(this.EnumerationMemberList)
            
        end % function umlStr = getPlantUmlEnumerationValues(this, ident_)
        
    end %  methods (Access = protected)
    
end % classdef Class < handle
