classdef Documentation < matdoc.uml.super.WithPlantUML & ...
        matdoc.sphinx.super.WithSphinxDoc
    
    %% PROPERTIES: PUBLIC
    properties
        
        % Cell array of objects which will be added to the UML
        Configuration   @matdoc.Configuration;
        
    end % properties
    
    %% PROPERTIES: DEPENDENT
    properties (Dependent)
        
        % Cell array of objects which will be added to the UML
        UmlObjects;
        
    end % properties (Dependent)
    
    %% PROPERTIES: SETACCESS = PROTECTED
    properties (SetAccess = protected)
        
        % List of all classes in the UmlObjects
        % This list only contains the classes directly added to UmlObjects
        ClassList = matdoc.meta.Class.empty(1, 0);
        
        % List of all classes in the UmlObjects
        % This list also includes the super classes for each class
        % All classes of the added packages will also be part of this list
        ClassListFlattened = matdoc.meta.Class.empty(1, 0);
        
        % List of all packages in the UmlObjects
        % This list only contains the packages directly added to UmlObjects
        PackageList = matdoc.meta.Package.empty(1, 0);
        
        % List of all packages in the UmlObjects
        % This list also includes the sub packages of package
        PackageListFlattened = matdoc.meta.Package.empty(1, 0);
        
        % List of all defined class/package relations in the UmlObjects
        %
        RelationList = matdoc.uml.relation.Relation.empty(1, 0);
        
    end % properties (SetAccess = protected)
    
    %% PROPERTIES: ACCESS = PROTECTED
    properties (Access = protected)
        
        % private member of the UmlObjects property
        UmlObjects_;
        
        % list of classes which are not contained within a sub package
        StandaloneClassList = matdoc.meta.Class.empty(1, 0);
        
        % struct representing the hierarchy of all classes within their
        % packages
        ClassHierarchy = struct();
        
    end % properties (Access = protected)
    
    %% PROPERTIES: CONSTANT
    properties (Constant)
        
    end % properties (Constant)
    
    %% METHODS: PUBLIC
    methods
        
        %% - Constructor
        function this = Documentation(objects_, varargin)
            % function this = Documentation(objects_, varargin)
            %
            % The default constructor can be used to directly create a
            % diagram based on the given objects_.
            %
            % :param objects_: (mandatory, cell) cell array containing the
            % objects to add to the UML diagram. See help of method
            % addObj(object); for further details about the list of
            % supported types.
            % :param varargin: optional key value pairs
            
            % process input
            if nargin > 0
                
                % init the configuration
                this.Configuration = matdoc.Configuration(varargin{:});
                
                % there is no need to call clear() here because it will be
                % called in the setter of the UmlObjects property.
                this.UmlObjects = objects_;
                
            else % if nargin > 0
                
                % init the configuration
                this.Configuration = matdoc.Configuration();
                
                % reset the class
                clear(this);
                
            end % if nargin > 0
            
        end % function this = Documentation()
        
        %% - addObj(object)
        function addObj(this, object)
            % function addObj(this, object)
            %
            % Call to add an object to the UML diagram.
            %
            % The input object may be a meta.class or a string.
            %
            % If object is a string it should be the name of the class
            % including the name space!
            
            if isa(object, 'meta.class') || isa(object, 'meta.package')
                % add the meta class object directly to the list
                addMetaObj(this, object);
            elseif ischar(object)
                addMetaObj(this, matdoc.tools.metaFromStr(object));
            else % get the meta class of the actual passed object
                addMetaObj(this, metaclass(val));
            end % if isa(object, 'meta.class')
            
        end % function addObj(this, object)
        
        %% - UmlToFile(File_)
        function UmlToFile(this, File_)
            % function UmlToFile(this, File_)
            %
            % Write the uml string with the current settings to the defined
            % file.
            
            if ~ischar(File_)
                error('matdoc:UML:UmlToFile:TypeError',...
                    'Parameter File_ has to be a path (string). Was of type %s instead.', class(File_));
            end % if ~ischar(File_)
            
            % does the path exist?
            FilePath = fileparts(File_);
            if ~isdir(FilePath)
                mkdir(FilePath);
            end % if ~isdir(FilePath)
            
            % try to write the file
            [fid, fopen_err] = fopen(File_, 'w');
            if fid > 0
                try
                    % write the UML string to the file
                    fwrite(fid, this.getPlantUML());
                    % close the file
                    fclose(fid);
                catch ex
                    % make sure to close the file
                    try fclose(fid); end
                    rethrow(ex);
                end % try
            else % if fid > 0
                error('matdoc:UML:UmlToFile:IOError',...
                    'Could not open ''%s'' for writting. Cause: %s', File_, fopen_err);
            end % if fid > 0
            
        end % function UmlToFile(this, File_)
        
        %% - umlStr = getPlantUML()
        function umlStr = getPlantUML(this)
            % function umlStr = getPlantUML(this)
            %
            % Returns the plantUML representation of this meta object.
            % Note: This method will be called by the getter of the
            % plantUML property of the matdoc.meta.super.Base.
            
            % uml string start %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            umlStr = '@startuml';
            
            % add the plantUML string representing the classes %%%%%%%%%%%%
            umlStr = sprintf('%s\n\n%s',...
                umlStr,...
                getClassUml(this)...
                );
            
            % add UML String for the relations %%%%%%%%%%%%%%%%%%%%%%%%%%%%
            umlStr = sprintf('%s\n\n%s',...
                umlStr,...
                getRelationUml(this)...
                );
            
            % add the UML end %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            umlStr = sprintf('%s\n\n%s', umlStr, '@enduml');
            
        end % function umlStr = getPlantUML(this)
        
        %% - sphinxDocStr = getSphinxDoc(this)
        function sphinxDocStr = getSphinxDoc(this)
            % function sphinxDocStr = getSphinxDoc(this)
            %
            % Returns the sphinx documentation representation of the
            % objects.
            
            sphinxDocStr = '';
            
            % get PlantUML string of each Class
            for iClass = 1:length(this.ClassListFlattened)
                % get the handle to the currently processed class
                curClass = this.ClassListFlattened(iClass);
                
                % do the built-in classes need to be skipped?
                if this.Configuration.IgnoreBuiltInClass && curClass.isBuiltIn
                    continue;
                end % if this.Configuration.IgnoreBuiltInClass && curClass.isBuiltIn
                
                sphinxDocStr = sprintf('%s\n\n%s',...
                    sphinxDocStr,...
                    curClass.getSphinxDoc()...
                    );
                
            end % for iClass = 1:length(this.ClassListFlattened)
            
        end % function sphinxDocStr = getSphinxDoc(this)
        
        %% - clear()
        function clear(this)
            % function addObj(this)
            %
            % Call to remove all objects from the UML diagram.
            
            this.UmlObjects_ = cell(0, 1);
            
        end % function addObj(this, object)
        
        %% - set.UmlObjects(val)
        function set.UmlObjects(this, val)
            % function set.UmlObjects(this, val)
            %
            % The setter method will make sure that only proper values are
            % set.
            
            % check data type
            if ischar(val)
                % convert to cell
                val = {val};
            elseif isempty(val) || ~iscell(val)
                error('matdoc:UML:setUmlObjects:TypeError',...
                    'The UmlObjects has to be of type cell value.');
            end % if ~isnumeric(val)
            
            % add each element
            for iObj = 1:length(val)
                addObj(this, val{iObj});
            end % for iObj = 1:length(val)
            
            % get the flattened Class and Package list
            getFlattenedLists(this);
            
            % figure out how the class and package hierachy is
            discoverClassHierarchy(this);
            
        end % function set.UmlObjects(this, val)
        
        %% - val = get.UmlObjects()
        function val = get.UmlObjects(this)
            % function val = get.UmlObjects(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.UmlObjects_;
            
        end % function val = get.UmlObjects(this)
        
    end % methods
    
    %% METHODS: PROTECTED
    methods (Access = protected)
        
        %% - addMetaObj(metaObj)
        function addMetaObj(this, metaObj)
            % function addMetaObj(this, metaObj)
            %
            % Call to add meta.class objects to the list of uml objects
            % (UmlObjects).
            % This method is called by addObj()
            %
            
            % wrap the meta class with my own classes
            switch class(metaObj)
                case {'meta.class', 'matlab.unittest.meta.class'}
                    % wrapt the matlab meta class with my own to allow uml
                    % export
                    umlMetaObj = matdoc.meta.Class(metaObj, this);
                    
                    % add the class to the list of classes
                    if isempty(this.ClassList)
                        this.ClassList = umlMetaObj;
                    else % if isempty(this.ClassList)
                        this.ClassList(1, end + 1) = umlMetaObj;
                    end % if isempty(this.ClassList)
                    
                case 'meta.package'
                    
                    % wrap the meta.package with my own class to allow uml
                    % export
                    umlMetaObj = matdoc.meta.Package(metaObj, this);
                    
                    % add the class to the list of classes
                    if isempty(this.PackageList)
                        this.PackageList = umlMetaObj;
                    else % if isempty(this.PackageList)
                        this.PackageList(1, end + 1) = umlMetaObj;
                    end % if isempty(this.PackageList)
                    
                case 'matdoc.uml.relation.Relation'
                    
                    umlMetaObj = metaObj;
                    this.RelationList(1, end + 1) = metaObj;
                    
            end % switch class(metaObj)
            
            this.UmlObjects_{end + 1, 1} = umlMetaObj;
            
        end % function addMetaObj(this, metaObj)
        
        %% - getFlattenedLists()
        function getFlattenedLists(this)
            % function getFlattenedLists(this)
            %
            % Calls getPackageListFlattened() and getClassListFlattened()
            % to fill all flattened list properties.
            
            getPackageListFlattened(this);
            getClassListFlattened(this);
            
        end % function getFlattenedLists(this)
        
        %% - getClassListFlattened()
        function getClassListFlattened(this)
            % function getClassListFlattened(this)
            %
            % Sets the ClassListFlattened property by checking every added
            % class for its super classes and every added package (and
            % their subpackages) for their containing classes.
            
            % Get classes %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            % get the directly added classes
            val = this.ClassList;
            
            % get their super classes
            for iClass = 1:length(this.ClassList)
                val = horzcat(val, this.ClassList(iClass).SuperclassListFlattened);
            end % for iClass = 1:length(this.ClassList)
            
            % Get classes from packages %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            flattenedPackList = this.PackageListFlattened;
            for iPack = 1:length(flattenedPackList)
                % get class list
                packageClassList = flattenedPackList(iPack).ClassList;
                
                % get the superclasses of the package classes
                for iClass = 1:length(packageClassList)
                    val = horzcat(val,...
                        packageClassList(iClass),...
                        packageClassList(iClass).SuperclassListFlattened...
                        );
                end % for iClass = 1:length(packageClassList)
            end % for iPack = 1:length(flattenedPackList)
            
            % make sure to return only distinct classes %%%%%%%%%%%%%%%%%%%
            this.ClassListFlattened = unique(val);
            
        end % function val = getClassListFlattened(this)
        
        %% - umlStr = getClassUml()
        function umlStr = getClassUml(this)
            % function umlStr = getClassUml(this)
            %
            % Returns the UML pseudo code to display a required classes. If
            % the SaveUmlExport flag is set, the export will be done flat
            % for each class. If not it will be a hierarchical export with
            % classes nested in their packages.
            
            umlStr = '';
            
            % Get the uml code for the classes %%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if this.Configuration.SafeUmlExport
                
                % get PlantUML string of each Class
                for iClass = 1:length(this.ClassListFlattened)
                    % get the handle to the currently processed class
                    curClass = this.ClassListFlattened(iClass);
                    
                    % do the built-in classes need to be skipped?
                    if (this.Configuration.IgnoreBuiltInClass && curClass.isBuiltIn) || ...
                        (this.Configuration.IgnoreTests && curClass.isUnitTest)
                        continue;
                    end % if this.Configuration.IgnoreBuiltInClass && curClass.isBuiltIn
                    
                    umlStr = sprintf('%s\n\n%s',...
                        umlStr,...
                        curClass.getPlantUML()...
                        );
                    
                end % for iClass = 1:length(this.ClassListFlattened)
            else % if this.Confiuration.SafeUmlExport
                
                % namespaceSeparator
                umlStr = sprintf('%s\n\n%s', umlStr, 'set namespaceSeparator none');
                
                % add ClassHierarchy
                umlStr = sprintf('%s\n\n%s',...
                    umlStr,...
                    strtrim(this.ClassHierarchy.getPlantUML())...
                    );
                
            end % if this.Confiuration.SafeUmlExport
            
            % get inheritance relation ships %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if ~this.Configuration.HideInheritance
                
                for iClass = 1:length(this.ClassListFlattened)
                    if iClass == 1
                        umlStr = sprintf('%s\n', umlStr);
                    end % if iClass == 1
                    
                    % get the handle to the currently processed class
                    curClass = this.ClassListFlattened(iClass);
                    
                    % do the built-in classes need to be skipped?
                    if (this.Configuration.IgnoreBuiltInClass && curClass.isBuiltIn) || ...
                        (this.Configuration.IgnoreTests && curClass.isUnitTest)
                        continue;
                    end % if this.Configuration.IgnoreBuiltInClass && curClass.isBuiltIn
                    
                    umlStr = sprintf('%s\n%s',...
                        umlStr,...
                        curClass.getPlantUmlInheritanceRelation()...
                        );
                    
                end % for iClass = 1:length(this.ClassListFlattened)
                
            end % if ~this.Configuration.HideInheritance
            
            % cleaup the string %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            umlStr = strtrim(umlStr);
            
        end % function umlStr = getClassUml(this)
        
        %% - umlStr = getRelationUml()
        function umlStr = getRelationUml(this)
            % function getRelationUml(this)
            %
            % Returns the UML representation of the relations defined in
            % the RelationList property.
            
            umlStr = '';
            for iRel = 1:length(this.RelationList)
                umlStr = sprintf('%s\n%s',...
                    umlStr,...
                    this.RelationList(iRel).getPlantUML(0)...
                    );
            end % for iRel = 1:length(this.RelationList)
            
        end % function umlStr = getRelationUml(this)
        
        %% - getPackageListFlattened()
        function getPackageListFlattened(this)
            % function getPackageListFlattened(this)
            %
            % Sets the PackageListFlattened property by finding all
            % subpackages of all directly added packages.
            
            val = this.PackageList;
            
            % get their super classes
            for iClass = 1:length(this.PackageList)
                val = horzcat(val, this.PackageList(iClass).PackageListFlattened);
            end % for iClass = 1:length(this.ClassList)
            
            % make sure to return only distinct classes
            this.PackageListFlattened = unique(val);
            
        end % function getPackageListFlattened(this)
        
        %% - discoverClassHierarchy(this)
        function discoverClassHierarchy(this)
            % function discoverClassHierarchy(this)
            %
            % This function will find out how the class hierarchy is.
            % Therefore it will check every class for the package it is
            % contained recursivlely. If the class is not contained in a
            % package or is a built-in the class will be added to the
            % StandaloneClassList.
            
            % reset the properties
            this.ClassHierarchy = matdoc.tools.CustomPackage(this, '');
            
            % check each class
            for iClass = 1:length(this.ClassListFlattened)
                % get the handle to the currently processed class
                curClass = this.ClassListFlattened(iClass);
                
                % get the containing package
                curContainingPackage = curClass.metaObj.ContainingPackage;
                
                % is the current class a built-in or not contained by a
                % package?
                if curClass.isBuiltIn || isempty(curContainingPackage)
                    this.ClassHierarchy.addClass(curClass);
                    continue;
                end % if curClass.isBuiltIn || isempty(curContainingPackage)
                
                % does the class contain the
                route = cell(0, 1);
                while ~isempty(curContainingPackage)
                    % add the current package to the route
                    route{end + 1, 1} = curContainingPackage.Name;
                    
                    % get the package that contains this package
                    try
                        curContainingPackage = curContainingPackage.ContainingPackage;
                    catch ex
                        curContainingPackage = curContainingPackage.metaObj.ContainingPackage;
                    end
                end % while ~isempty(curContainingPackage)
                
                % add the class to the packge
                % build the classes from the back
                curPackage = this.ClassHierarchy;
                for iRoute = length(route):-1:1
                    curPackage = curPackage.getPackage(route{iRoute});
                end % for iRoute = length(route):-1:1
                curPackage.addClass(curClass);
                
            end % for iClass = 1:length(this.ClassListFlattened)
            
        end % function discoverClassHierarchy(this)
        
    end %  methods (Access = protected)
    
    %% METHODS: STATIC
    methods (Static)
        
    end % methods (Static)
    
end % classdef UML < handle
