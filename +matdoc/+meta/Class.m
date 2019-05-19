classdef Class < matdoc.meta.super.Base & ...
        matdoc.uml.Class
    
    %% PROPERTIES: PUBLIC
    properties
        
    end % properties
    
    %% PROPERTIES: SETACCESS = PROTECTED
    properties (SetAccess = protected)
        
        % The list of properties
        PropertyList;
        
        % It cotains a Nx2 cell array. The first column holds the
        % category (categoryUML property) and the second column the
        % actual cell array of handles to the meta classes.
        % N = number of unique categories.
        SortedPropertyList = cell(0, 2);
        
        % The list of methods
        MethodList;
        
        % It cotains a Nx2 cell array. The first column holds the
        % category (categoryUML property) and the second column the
        % actual cell array of handles to the meta classes.
        % N = number of unique categories.
        SortedMethodList = cell(0, 2);
        
        % The list of events
        EventList;
        
        % The list of EnumerationMembers
        EnumerationMemberList;
        
        % The list of super classes
        SuperclassList;
        
        % Handle to the matdoc.meta.Method instance representing the
        % constructor method
        Constructor;
        
        % Flag if any of the defined properties or methods are abstract
        hasAbstractMembers = false;
        
    end % properties (SetAccess = protected)
    
    %% PROPERTIES: DEPENDENT, SETACCESS = PROTECTED
    properties (Dependent, SetAccess = protected)
        
        % A complete list of properties incl the ones inheritated from
        % other classes
        PropertyListFlattened;
        
        % A complete list of methods incl the ones inheritated from
        % other classes
        MethodListFlattened;
        
        % A complete list of super classes incl. nested inheritated classes
        SuperclassListFlattened;
        
        % The inheritation relation ships
        InheritationRelations = cell(0, 1);
        
        % The name of Class
        Name;
        
        % Class description
        Description;
        
        % Detailed class description
        DetailedDescription;
        
        % Is the class hidden?
        Hidden;
        
        % Is the class sealed?
        Sealed;
        
        % Is the class abstract?
        Abstract;
        
        % Construct OnLoad
        ConstructOnLoad;
        
        % Is the class a handle class?
        HandleCompatible;
        
        % InferiorClasses
        InferiorClasses;
        
        % ContainingPackage
        ContainingPackage;
        
        % If true the wrapped class is a built in matlab class
        isBuiltIn;
        
    end % properties (Dependent, SetAccess = protected)
    
    %% PROPERTIES: ACCESS = PROTECTED
    properties (Access = protected)
        
    end % properties (Access = protected)
    
    %% PROPERTIES: CONSTANT
    properties (Constant)
        
    end % properties (Constant)
    
    %% METHODS: PUBLIC
    methods
        
        %% - Constructor
        function this = Class(metaObj, parent)
            % function this = Class()
            %
            %
            
            this = this@matdoc.meta.super.Base(metaObj, parent);
            
        end % function this = ColumnDataDisplay()
        
        %% - val = get.PropertyListFlattened()
        function val = get.PropertyListFlattened(this)
            % function val = get.PropertyListFlattened(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.PropertyList;
            
        end % function val = get.PropertyListFlattened(this)
        
        %% - val = get.MethodListFlattened()
        function val = get.MethodListFlattened(this)
            % function val = get.MethodListFlattened(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.MethodList;
            
        end % function val = get.MethodListFlattened(this)
        
        %% - val = get.SuperclassListFlattened()
        function val = get.SuperclassListFlattened(this)
            % function val = get.SuperclassListFlattened(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = getSuperclassListFlattened(this);
            
        end % function val = get.SuperclassListFlattened(this)
        
        %% - val = get.InheritationRelations()
        function val = get.InheritationRelations(this)
            % function val = get.InheritationRelations(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = cell(0, 1);
            for iSup = 1:length(this.SuperclassList)
                
                % get the current super class
                curSuperClass = this.SuperclassList(iSup);
                
                % may be the class needs to be skipped?
                if this.Configuration.IgnoreBuiltInClass && curSuperClass.isBuiltIn
                    continue;
                end % if this.Configuration.IgnoreBuiltInClass && curMetaClass.isBuiltIn
                
                % determine the relation type and direction
                if curSuperClass.Abstract || curSuperClass.hasAbstractMembers
                    arrowBody = '..';
                else % if curSuperClass.hasAbstractMembers
                    arrowBody = '--';
                end % if curSuperClass.hasAbstractMembers
                arrow = sprintf('%s|>', arrowBody);
                
                % add the string of the inheritation relations
                val{end + 1, 1} = sprintf('%s %s %s', this.Name, arrow, curSuperClass.Name);
                
            end % for iSup = 1:length(this.SuperclassList)
            
        end % function val = get.InheritationRelations(this)
        
        %% - val = get.Name()
        function val = get.Name(this)
            % function val = get.Name(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.Name;
            
        end % function val = get.Name(this)
        
        %% - val = get.Description()
        function val = get.Description(this)
            % function val = get.Description(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.Description;
            
        end % function val = get.Description(this)
        
        %% - val = get.DetailedDescription()
        function val = get.DetailedDescription(this)
            % function val = get.DetailedDescription(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.DetailedDescription;
            
        end % function val = get.DetailedDescription(this)
        
        %% - val = get.Hidden()
        function val = get.Hidden(this)
            % function val = get.Hidden(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.Hidden;
            
        end % function val = get.Hidden(this)
        
        %% - val = get.Sealed()
        function val = get.Sealed(this)
            % function val = get.Sealed(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.Sealed;
            
        end % function val = get.Sealed(this)
        
        %% - val = get.Abstract()
        function val = get.Abstract(this)
            % function val = get.Abstract(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.Abstract;
            
        end % function val = get.Abstract(this)
        
        %% - val = get.ConstructOnLoad()
        function val = get.ConstructOnLoad(this)
            % function val = get.ConstructOnLoad(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.ConstructOnLoad;
            
        end % function val = get.ConstructOnLoad(this)
        
        %% - val = get.HandleCompatible()
        function val = get.HandleCompatible(this)
            % function val = get.HandleCompatible(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.HandleCompatible;
            
        end % function val = get.HandleCompatible(this)
        
        %% - val = get.InferiorClasses()
        function val = get.InferiorClasses(this)
            % function val = get.InferiorClasses(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.InferiorClasses;
            
        end % function val = get.InferiorClasses(this)
        
        %% - val = get.ContainingPackage()
        function val = get.ContainingPackage(this)
            % function val = get.ContainingPackage(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.Parent;
            
        end % function val = get.ContainingPackage(this)
        
        %% - val = get.isBuiltIn()
        function val = get.isBuiltIn(this)
            % function val = get.isBuiltIn(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = matdoc.isBuiltIn(this.metaObj);
            
        end % function val = get.isBuiltIn(this)

    end % methods
    
    %% METHODS: PROTECTED
    methods (Access = protected)
        
        %% - walkMeta()
        function walkMeta(this)
            % function walkMeta(this)
            %
            % This method will make sure the sub meta classes of the
            % metaObj are also wrapped by the meta classes of this package.
            
            % PropertyList %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if ~isempty(this.metaObj.PropertyList)
                this.PropertyList = matdoc.meta.Property(this.metaObj.PropertyList(1), this);
                for iPack = 2:length(this.metaObj.PropertyList)
                    this.PropertyList(iPack) = matdoc.meta.Property(this.metaObj.PropertyList(iPack), this);
                end % for iPack = 2:length(this.metaObj.PropertyList)
            end % if ~isempty(this.metaObj.PropertyList)
            
            % The list of propertties sorted and categorized
            getSortedPropertyList(this);
            
            % MethodList %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if ~isempty(this.metaObj.MethodList)
                this.MethodList = matdoc.meta.Method(this.metaObj.MethodList(1), this);
                for iPack = 2:length(this.metaObj.MethodList)
                    this.MethodList(iPack) = matdoc.meta.Method(this.metaObj.MethodList(iPack), this);
                end % for iPack = 2:length(this.metaObj.MethodList)
            end % if ~isempty(this.metaObj.MethodList)
            
            % The list of propertties sorted and categorized
            getSortedMethodList(this);
            
            % EventList %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if ~isempty(this.metaObj.EventList)
                this.EventList = matdoc.meta.Event(this.metaObj.EventList(1), this);
                for iPack = 2:length(this.metaObj.EventList)
                    this.EventList(iPack) = matdoc.meta.Event(this.metaObj.EventList(iPack), this);
                end % for iPack = 2:length(this.metaObj.EventList)
            end % if ~isempty(this.metaObj.EventList)
            
            % EnumerationMemberList %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if ~isempty(this.metaObj.EnumerationMemberList)
                this.EnumerationMemberList = matdoc.meta.EnumeratedValue(this.metaObj.EnumerationMemberList(1), this);
                for iPack = 2:length(this.metaObj.EnumerationMemberList)
                    this.EnumerationMemberList(iPack) = matdoc.meta.EnumeratedValue(this.metaObj.EnumerationMemberList(iPack), this);
                end % for iPack = 2:length(this.metaObj.EnumerationMemberList)
            end % if ~isempty(this.metaObj.EnumerationMemberList)
            
            % SuperclassList %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if ~isempty(this.metaObj.SuperclassList)
                this.SuperclassList = matdoc.meta.Class(this.metaObj.SuperclassList(1), this);
                for iPack = 2:length(this.metaObj.SuperclassList)
                    this.SuperclassList(iPack) = matdoc.meta.Class(this.metaObj.SuperclassList(iPack), this);
                end % for iPack = 2:length(this.metaObj.EventList)
            end % if ~isempty(this.metaObj.EventList)
            
            % hasAbstractMembers %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            % Properties
            propsAbstrct = false;
            if isa(this.PropertyList, 'matdoc.meta.Property') ||...
                    isa(this.PropertyList, 'meta.property')
                propsAbstrct = any([this.PropertyList(:).Abstract]);
            end % if isa(this.PropertyList, 'matdoc.meta.Property') ||...
            
            % Methods
            methodsAbstrct = false;
            if isa(this.MethodList, 'matdoc.meta.Method') ||...
                    isa(this.MethodList, 'meta.method')
                methodsAbstrct = any([this.MethodList(:).Abstract]);
            end % if isa(this.PropertyList, 'matdoc.meta.Property') ||...
            
            % Combine the status
            this.hasAbstractMembers = propsAbstrct || methodsAbstrct;
            
            % Constructor %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            for iMeth = 1:length(this.MethodList)
                % does the method have the same name as the class? Then
                % this is the constructor
                if strcmp(this.NameRaw, this.MethodList(iMeth).Name)
                    this.Constructor = this.MethodList(iMeth);
                    % exit the loop since we found what we where looking
                    % for
                    break;
                end % if strcmp(this.Name, this.MethodList(iMeth).Name)
            end % for iMeth = 1:length(this.MethodList)
            
        end % function walkMeta(this)
        
        %% - getSortedPropertyList()
        function getSortedPropertyList(this)
            % function getSortedPropertyList(this)
            %
            % Call to fill the SortedPropertyList property.
            %
            % It cotains a Nx2 cell array. The first column holds the
            % category (categoryUML property) and the second column the
            % actual cell array of handles to the meta classes.
            
            % reset the list
            this.SortedPropertyList = cell(0, 2);
            
            thePropList = this.PropertyListFlattened;
            for iProp = 1:length(thePropList)
                % get the currently processes property
                curProp = thePropList(iProp);
                curPropCat = curProp.categoryUML;
                
                % get the index of the catergory in the list
                catIdx = strcmp(this.SortedPropertyList(:, 1), curPropCat);
                
                % new category?
                if ~any(catIdx)
                    this.SortedPropertyList{end + 1, 1} = curPropCat;
                    this.SortedPropertyList{end, 2} = curProp;
                else % if ~any(catIdx)
                    this.SortedPropertyList{catIdx, 2}(end + 1, 1) = curProp;
                end % if ~any(catIdx)
                
            end % for iProp = 1:length(this.PropertyList)
            
            % sort the categories by name
            [~, sortIdx] = sort(this.SortedPropertyList(:, 1));
            this.SortedPropertyList = this.SortedPropertyList(sortIdx, :);
            
            % sort the properties
            for iCat = 1:size(this.SortedPropertyList, 1)
                % make sure to sort case insensitive
                [~, sortIdx] = sort(lower({this.SortedPropertyList{iCat, 2}(:).Name}));
                % apply the sorting
                this.SortedPropertyList{iCat, 2} = this.SortedPropertyList{iCat, 2}(sortIdx);
            end % for iCat = 1:size(this.SortedPropertyList, 1)
            
        end % function getSortedPropertyList(this)
        
        %% - getSortedMethodList()
        function getSortedMethodList(this)
            % function getSortedMethodList(this)
            %
            % Call to fill the SortedMethodList property.
            %
            % It cotains a Nx2 cell array. The first column holds the
            % category (categoryUML property) and the second column the
            % actual cell array of handles to the meta classes.
            
            % reset the list
            this.SortedMethodList = cell(0, 2);
            
            theMethodList = this.MethodListFlattened;
            for iMethod = 1:length(theMethodList)
                % get the currently processes property
                curMethod = theMethodList(iMethod);
                curMethodCat = curMethod.categoryUML;
                
                % get the index of the catergory in the list
                catIdx = strcmp(this.SortedMethodList(:, 1), curMethodCat);
                
                % new category?
                if ~any(catIdx)
                    this.SortedMethodList{end + 1, 1} = curMethodCat;
                    this.SortedMethodList{end, 2} = curMethod;
                else % if ~any(catIdx)
                    this.SortedMethodList{catIdx, 2}(end + 1, 1) = curMethod;
                end % if ~any(catIdx)
                
            end % for iProp = 1:length(this.MethodList)
            
            % sort the categories by name
            [~, sortIdx] = sort(this.SortedMethodList(:, 1));
            this.SortedMethodList = this.SortedMethodList(sortIdx, :);
            
            % sort the properties
            for iCat = 1:size(this.SortedMethodList, 1)
                % make sure to sort case insensitive
                [~, sortIdx] = sort(lower({this.SortedMethodList{iCat, 2}(:).Name}));
                % apply the sorting
                this.SortedMethodList{iCat, 2} = this.SortedMethodList{iCat, 2}(sortIdx);
            end % for iCat = 1:size(this.SortedMethodList, 1)
            
        end % function getSortedMethodList(this)
        
        %% - val = getSuperclassListFlattened(this)
        function val = getSuperclassListFlattened(this)
            % function val = getSuperclassListFlattened(this)
            %
            % return as a list of all superclasses including the ones which
            % are inheritated
            
            val = this.SuperclassList;
            for iSup = 1:length(val)
                val = horzcat(...
                    val,...
                    this.SuperclassList(iSup).SuperclassListFlattened...
                    );
            end % for iSup = 1:length(val)
            
            % keep only distinct items
            if length(val) > 1
                val = unique(val);
            end
            
        end % function val = getSuperclassListFlattened(this)
        
    end %  methods (Access = protected)
    
    %% METHODS: STATIC
    methods (Static)
        
    end % methods (Static)
    
end % classdef Class < handle
