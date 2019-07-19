classdef Class < matdoc.sphinx.super.Base
    
    %% METHODS: PUBLIC
    methods
        
        %% - sphinxDocStr = getSphinxDoc(ident_)
        function sphinxDocStr = getSphinxDoc(this, ident_)
            % function sphinxDocStr = getSphinxDoc(this, ident_)
            %
            % Returns the SphinxDoc representation of this meta object.
            % Note: This method will be called by the getter of the
            % SphinxDoc property of the matdoc.uml.super.Base.
            
            % process input %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if nargin < 2 || isempty(ident_)
                ident_ = 0;
            end % if nargin < 2 || isempty(ident_)
            if ~isnumeric(ident_)
                error('matdoc:sphinx:Package:getSphinxDoc:TypeError',...
                    'Input ident_ has to be numeric.');
            end % if ~isnumeric(ident_)
            
            % make sure its a scalar integer value
            ident_ = abs(round(ident_(1)));
            
            % build the identStr
            identStr = char(32 * ones(1, ident_));
            
            % increase the indent for all
            ident_ = ident_ + matdoc.sphinx.super.Base.SPHINX_IDENT;
            
            % build the sphinx string %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            % uml string start %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if ~isempty(this.EnumerationMemberList)
                classPrefix = 'class';
            elseif this.Abstract
                classPrefix = 'abstractclass';
            else
                classPrefix = 'class';
            end % if this.Abstract
            sphinxDocStr = sprintf('%s.. py:%s:: %s',identStr, classPrefix, this.Name);
            
            % add UML String for each superclass inheritance %%%%%%%%%%%%%%
            if ~this.Configuration.HideInheritance
               sphinxDocStr = sprintf('%s%s',...
                   sphinxDocStr,...
                   getSphinxDocInheritance(this, ident_)...
                   );
            end % if ~this.Configuration.HideInheritance
            
            % add UML String for each enumeration value %%%%%%%%%%%%%%%%%%%
            if ~this.Configuration.HideEnumerationMember
                sphinxDocStr = sprintf('%s%s',...
                    sphinxDocStr,...
                    getSphinxDocEnumerationValues(this, ident_)...
                    );
            end % if ~this.Configuration.HideEnumerationMember
            
            % add UML String of each field %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if ~this.Configuration.HideProperties
                sphinxDocStr = sprintf('%s%s',...
                    sphinxDocStr,...
                    getSphinxDocProperties(this, ident_)...
                    );
            end % if ~this.Configuration.HideProperties
            
            % add UML String for each method %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if ~this.Configuration.HideMethods
                sphinxDocStr = sprintf('%s%s',...
                    sphinxDocStr,...
                    getSphinxDocMethods(this, ident_)...
                    );
            end % if ~this.Configuration.HideMethods
            
            % add UML String for each event %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if ~this.Configuration.HideEvents
                sphinxDocStr = sprintf('%s%s',...
                    sphinxDocStr,...
                    getSphinxDocEvents(this, ident_)...
                    );
            end % if ~this.Configuration.HideEvents
            
            % close the class section the UML end %%%%%%%%%%%%%%%%%%%%%%%%%
            sphinxDocStr = sprintf('%s\n', sphinxDocStr);
            
        end % function sphinxDocStr = getSphinxDoc(this, ident_)
        
        %% - sphinxDocStr = getSphinxDocInheritance(ident_)
        function sphinxDocStr = getSphinxDocInheritance(this, ident_)
            % function sphinxDocStr = getSphinxDocInheritance(this, ident_)
            %
            % Return the relation ship string of the class
            
            % process input %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if nargin < 2 || isempty(ident_)
                ident_ = 0;
            end % if nargin < 2 || isempty(ident_)
            if ~isnumeric(ident_)
                error('matdoc:sphinx:Package:getSphinxDoc:TypeError',...
                    'Input ident_ has to be numeric.');
            end % if ~isnumeric(ident_)
            
            % make sure its a scalar integer value
            ident_ = abs(round(ident_(1)));
            
            % build the identStr
            identStr = char(32 * ones(1, ident_));
            
            % build the sphinx string %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            % create prefix
            sphinxDocStr = sprintf('%sBases :code:`', identStr);
            
            superCnt = length(this.SuperclassList);
            for iClass = 1:superCnt
                curSuper = this.SuperclassList(iClass);
                if iClass < superCnt
                    sphinxDocStr = sprintf('%s%s, ', sphinxDocStr, curSuper.Name);
                else % if iClass < superCnt
                    sphinxDocStr = sprintf('%s%s', sphinxDocStr, curSuper.Name);
                end % if iClass < superCnt
            end % for iClass = 1:length(this.SuperclassList)
            
            % add suffix
            sphinxDocStr = sprintf('\n\n%s`', sphinxDocStr);
            
        end % function sphinxDocStr = getSphinxDocInheritance(this, ident_)
        
    end % methods
    
    %% METHODS: PROTECTED
    methods (Access = protected)
        %% - sphinxDocStr = getSphinxDocProperties(ident_)
        function sphinxDocStr = getSphinxDocProperties(this, ident_)
            % function sphinxDocStr = getSphinxDocProperties(this)
            %
            % Returns the uml string for the properties of this class
            
            % if there are no members of the list, return an empty string
            if isempty(this.PropertyList)
                sphinxDocStr = '';
                return;
            end % if isempty(this.PropertyList)
            
            % build the identStr
            identStr = char(32 * ones(1, ident_));
            
            sphinxDocStr = '';
            sphinxCatStr = '';
            for iCat = 1:size(this.SortedPropertyList, 1)
                
                % loop over the methods
                cursphinxCatStr = '';
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
                    cursphinxCatStr = sprintf('%s\n%s',...
                        cursphinxCatStr,...
                        curMetaObj.getSphinxDoc(ident_ + matdoc.sphinx.super.Base.SPHINX_IDENT)...
                        );
                end % for iObj = 1:length(this.PropertyList)
                
                % check if this category needs to be added or if they are
                % empty
                if ~isempty(cursphinxCatStr)
                    % add the headline of the current category
                    sphinxCatStr = sprintf('%s\n%s.. py:attribute:: Properties %s\n%s\n',...
                        sphinxCatStr,...
                        identStr,...
                        this.SortedPropertyList{iCat, 1},...
                        cursphinxCatStr...
                        );
                end % if ~isempty(sphinxCatStr)
            end % for iCat = 1:size(this.SortedPropertyList, 1)
            
            % check if the method have to be added after all
            if ~isempty(sphinxCatStr)
                sphinxDocStr = sprintf('\n\n%s%s', identStr, sphinxCatStr);
            end % if ~isempty(sphinxCatStr)
            
        end % function sphinxDocStr = getSphinxDocProperties(this, ident_)
        
        %% - sphinxDocStr = getSphinxDocMethods(ident_)
        function sphinxDocStr = getSphinxDocMethods(this, ident_)
            % function sphinxDocStr = getSphinxDocMethods(this, ident_)
            %
            % Returns the uml string for the methods of this class
            
            % if there are no members of the list, return an empty string
            if isempty(this.MethodList)
                sphinxDocStr = '';
                return;
            end % if isempty(this.MethodList)
            
            % build the identStr
            identStr = char(32 * ones(1, ident_));
            subIdentStr = char(32 * ones(1, ident_ + matdoc.sphinx.super.Base.SPHINX_IDENT));
            
            sphinxDocStr = '';
            sphinxCatStr = '';
            % Get the Signature of the constructor %%%%%%%%%%%%%%%%%%%%%%%%
            if ~isempty(this.Constructor)
                sphinxCatStr = sprintf('.. py:attribute:: Constructor\n\n%s',...
                    this.Constructor.getSphinxDoc(ident_ + matdoc.sphinx.super.Base.SPHINX_IDENT)...
                    );
            end % if ~isempty(this.Constructor)
            
            % Get all methods by category %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            for iCat = 1:size(this.SortedMethodList, 1)
                
                % loop over the methods %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                cursphinxCatStr = '';
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
                    cursphinxCatStr = sprintf('%s\n\n%s',...
                        cursphinxCatStr,...
                        curMetaObj.getSphinxDoc(ident_ + matdoc.sphinx.super.Base.SPHINX_IDENT)...
                        );
                end % for iObj = 1:length(this.MethodList)
                
                % check if this category needs to be added or if they are
                % empty
                if ~isempty(cursphinxCatStr)
                    % add the headline of the current category
                    sphinxCatStr = sprintf('%s\n\n%s.. py:attribute:: Methods %s%s',...
                        sphinxCatStr,...
                        identStr,...
                        this.SortedMethodList{iCat, 1},...
                        cursphinxCatStr...
                        );
                end % if ~isempty(sphinxCatStr)
            end % for iCat = 1:size(this.SortedMethodList, 1)
            
            % check if the method have to be added after all %%%%%%%%%%%%%%
            if ~isempty(sphinxCatStr)
                sphinxDocStr = sprintf('\n\n%s%s', identStr, sphinxCatStr);
            end % if ~isempty(sphinxCatStr)
            
        end % function sphinxDocStr = getSphinxDocMethods(this, ident_)
        
        %% - sphinxDocStr = getSphinxDocEvents(ident_)
        function sphinxDocStr = getSphinxDocEvents(this, ident_)
            % function sphinxDocStr = getSphinxDocEvents(this, ident_)
            %
            % Returns the uml string for the events of this class
            
            % if there are no members of the list, return an empty string
            if isempty(this.EventList)
                sphinxDocStr = '';
                return;
            end % if isempty(this.EventList)
            
            % build the identStr
            identStr = char(32 * ones(1, ident_));
            
            sphinxDocStr = sprintf('\n\n%s.. py:attribute::  Events\n', identStr);
            
            for iObj = 1:length(this.EventList)
                curMetaObj = this.EventList(iObj);
                sphinxDocStr = sprintf('%s\n%s',...
                    sphinxDocStr,...
                    curMetaObj.getSphinxDoc(ident_ + matdoc.sphinx.super.Base.SPHINX_IDENT)...
                    );
            end % for iObj = 1:length(this.EventList)
            
        end % function sphinxDocStr = getSphinxDocEvents(this)
        
        %% - sphinxDocStr = getSphinxDocEnumerationValues(ident_)
        function sphinxDocStr = getSphinxDocEnumerationValues(this, ident_)
            % function sphinxDocStr = getSphinxDocEnumerationValues(this, ident_)
            %
            % Returns the uml string for the enumeration values of this class
            
            % if there are no members of the list, return an empty string
            if isempty(this.EnumerationMemberList)
                sphinxDocStr = '';
                return;
            end % if isempty(this.EnumerationMemberList)
            
            % build the identStr
            identStr = char(32 * ones(1, ident_));
            
            sphinxDocStr = sprintf('\n\n%s.. py:attribute::  Enumerations\n', identStr);
            
            for iObj = 1:length(this.EnumerationMemberList)
                curMetaObj = this.EnumerationMemberList(iObj);
                sphinxDocStr = sprintf('%s\n%s',...
                    sphinxDocStr,...
                    curMetaObj.getSphinxDoc(ident_)...
                    );
            end % for iObj = 1:length(this.EnumerationMemberList)
            
        end % function sphinxDocStr = getSphinxDocEnumerationValues(this, ident_)
        
    end %  methods (Access = protected)
    
end % classdef Class < handle
