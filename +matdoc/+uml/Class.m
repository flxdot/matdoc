classdef Class < matdoc.uml.super.Base
    
    %% METHODS: PROTECTED
    methods (Access = protected)
        
        %% - umlStr = getPlantUML()
        function umlStr = getPlantUML(this)
            % function umlStr = getPlantUML(this)
            %
            % Returns the plantUML representation of this meta object.
            % Note: This method will be called by the getter of the
            % plantUML property of the matdoc.uml.super.Base.
            
            % uml string start %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if ~isempty(this.EnumerationMemberList)
                classPrefix = 'enum';
            elseif this.Abstract
                classPrefix = 'abstract class';
            else
                classPrefix = 'class';
            end % if this.Abstract
            umlStr = sprintf('%s %s {', classPrefix, this.Name);
            
            % add UML String for each enumeration value %%%%%%%%%%%%%%%%%%%
            if ~this.Configuration.HideEnumerationMember
                umlStr = sprintf('%s%s', umlStr, getPlantUmlEnumerationValues(this));
            end % if ~this.Configuration.HideEnumerationMember
            
            % add UML String of each field %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if ~this.Configuration.HideProperties
                umlStr = sprintf('%s%s', umlStr, getPlantUmlProperties(this));
            end % if ~this.Configuration.HideProperties
            
            % add UML String for each method %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if ~this.Configuration.HideMethods
                umlStr = sprintf('%s%s', umlStr, getPlantUmlMethods(this));
            end % if ~this.Configuration.HideMethods
            
            % add UML String for each event %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if ~this.Configuration.HideEvents
                umlStr = sprintf('%s%s', umlStr, getPlantUmlEvents(this));
            end % if ~this.Configuration.HideEvents
            
            % close the class section the UML end %%%%%%%%%%%%%%%%%%%%%%%%%
            umlStr = sprintf('%s\n}', umlStr);
            
            % add UML String for each superclass inheritance %%%%%%%%%%%%%%
            umlStr = sprintf('%s%s', umlStr, getPlantUmlInheritanceRelation(this));
            
        end % function umlStr = getPlantUML(this)
        
        %% - umlStr = getPlantUmlProperties()
        function umlStr = getPlantUmlProperties(this)
            % function umlStr = getPlantUmlProperties(this)
            %
            % Returns the uml string for the properties of this class
            
            % if there are no members of the list, return an empty string
            if isempty(this.PropertyList)
                umlStr = '';
                return;
            end % if isempty(this.PropertyList)
            
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
                            matdoc.isBuiltIn(curMetaObj.metaObj.DefiningClass)
                        continue;
                    end % if this.Configuration.IgnoreBuiltInClass && curMetaClass.isBuiltIn
                    
                    % add it to the string
                    curUmlCatStr = sprintf('%s\n%s', curUmlCatStr, curMetaObj.plantUML);
                end % for iObj = 1:length(this.PropertyList)
                
                % check if this category needs to be added or if they are
                % empty
                if ~isempty(curUmlCatStr)
                    % add the headline of the current category
                    umlCatStr = sprintf('%s\n   .. %s ..%s',...
                        umlCatStr,...
                        this.SortedPropertyList{iCat, 1},...
                        curUmlCatStr...
                        );
                end % if ~isempty(umlCatStr)
            end % for iCat = 1:size(this.SortedPropertyList, 1)
            
            % check if the method have to be added after all
            if ~isempty(umlCatStr)
                umlStr = sprintf('\n   -- Properties --%s', umlCatStr);
            end % if ~isempty(umlCatStr)
            
        end % function umlStr = getPlantUmlProperties(this)
        
        %% - umlStr = getPlantUmlMethods()
        function umlStr = getPlantUmlMethods(this)
            % function umlStr = getPlantUmlMethods(this)
            %
            % Returns the uml string for the methods of this class
            
            % if there are no members of the list, return an empty string
            if isempty(this.MethodList)
                umlStr = '';
                return;
            end % if isempty(this.MethodList)
            
            umlStr = '';
            umlCatStr = '';
            % Get the Signature of the constructor %%%%%%%%%%%%%%%%%%%%%%%%
            if ~isempty(this.Constructor)
                umlCatStr = sprintf('%s\n%s', umlCatStr, this.Constructor.plantUML);
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
                            matdoc.isBuiltIn(curMetaObj.metaObj.DefiningClass))
                        continue;
                    end % if this.Configuration.IgnoreBuiltInClass && curMetaClass.isBuiltIn
                    
                    % add it to the string
                    curUmlCatStr = sprintf('%s\n%s', curUmlCatStr, curMetaObj.plantUML);
                end % for iObj = 1:length(this.MethodList)
                
                % check if this category needs to be added or if they are
                % empty
                if ~isempty(curUmlCatStr)
                    % add the headline of the current category
                    umlCatStr = sprintf('%s\n   .. %s ..%s',...
                        umlCatStr,...
                        this.SortedMethodList{iCat, 1},...
                        curUmlCatStr...
                        );
                end % if ~isempty(umlCatStr)
            end % for iCat = 1:size(this.SortedMethodList, 1)
            
            % check if the method have to be added after all %%%%%%%%%%%%%%
            if ~isempty(umlCatStr)
                umlStr = sprintf('\n   -- Methods --%s', umlCatStr);
            end % if ~isempty(umlCatStr)
            
        end % function umlStr = getPlantUmlMethods(this)
        
        %% - umlStr = getPlantUmlEvents()
        function umlStr = getPlantUmlEvents(this)
            % function umlStr = getPlantUmlEvents(this)
            %
            % Returns the uml string for the events of this class
            
            % if there are no members of the list, return an empty string
            if isempty(this.EventList)
                umlStr = '';
                return;
            end % if isempty(this.EventList)
            
            umlStr = sprintf('\n   -- Events --');
            
            for iObj = 1:length(this.EventList)
                curMetaObj = this.EventList(iObj);
                umlStr = sprintf('%s\n%s', umlStr, curMetaObj.plantUML);
            end % for iObj = 1:length(this.EventList)
            
        end % function umlStr = getPlantUmlEvents(this)
        
        %% - umlStr = getPlantUmlEnumerationValues()
        function umlStr = getPlantUmlEnumerationValues(this)
            % function umlStr = getPlantUmlEnumerationValues(this)
            %
            % Returns the uml string for the enumeration values of this class
            
            % if there are no members of the list, return an empty string
            if isempty(this.EnumerationMemberList)
                umlStr = '';
                return;
            end % if isempty(this.EnumerationMemberList)
            
            umlStr = sprintf('\n   -- Enumeration Values --');
            
            for iObj = 1:length(this.EnumerationMemberList)
                curMetaObj = this.EnumerationMemberList(iObj);
                umlStr = sprintf('%s\n%s', umlStr, curMetaObj.plantUML);
            end % for iObj = 1:length(this.EnumerationMemberList)
            
        end % function umlStr = getPlantUmlEnumerationValues(this)
        
        %% - umlStr = getPlantUmlInheritanceRelation()
        function umlStr = getPlantUmlInheritanceRelation(this)
            % function umlStr = getPlantUmlInheritanceRelation(this)
            %
            % Returns the uml string defining the class inheritances
            
            umlStr = sprintf('\n');
            
            relations = this.InheritationRelations;
            for idx = 1:length(relations)
                umlStr = sprintf('%s\n%s',...
                    umlStr,...
                    relations{idx}...
                    );
            end % for idx = 1:length(this.InheritationRelations)
            
        end % function umlStr = getPlantUmlInheritanceRelation(this)
        
    end %  methods (Access = protected)
    
end % classdef Class < handle
