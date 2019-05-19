classdef Documentation < matdoc.Super.DisplayUML
    
    %% PROPERTIES: PUBLIC
    properties
        
        % Cell array of objects which will be added to the UML
        Configuration   @matdoc.Configuration;
        
    end % properties
    
    %% PROPERTIES: DEPENDENT
    properties (Dependent)
        
        % Cell array of objects which will be added to the UML
        UmlObjects;
        
        % List of all classes in the UmlObjects
        % This list also includes the super classes for each class
        % All classes of the added packages will also be part of this list
        ClassListFlattend = matdoc.Meta.Class.empty(1, 0);
        
        % List of all packages in the UmlObjects
        % This list also includes the sub packages of package
        PackageListFlattend = matdoc.Meta.Package.empty(1, 0);
        
    end % properties (Dependent)
    
    %% PROPERTIES: SETACCESS = PROTECTED
    properties (SetAccess = protected)
        
        % List of all classes in the UmlObjects
        % This list only contains the classes directly added to UmlObjects
        ClassList = matdoc.Meta.Class.empty(1, 0);
        
        % List of all packages in the UmlObjects
        % This list only contains the packages directly added to UmlObjects
        PackageList = matdoc.Meta.Package.empty(1, 0);
        
    end % properties (SetAccess = protected)
    
    %% PROPERTIES: ACCESS = PROTECTED
    properties (Access = protected)
        
        % private member of the UmlObjects property
        UmlObjects_;
        
    end % properties (Access = protected)
    
    %% PROPERTIES: CONSTANT
    properties (Constant)
        
    end % properties (Constant)
    
    %% METHODS: PUBLIC
    methods
        
        %% - Constructor
        function this = Documentation(objects_, varargin)
            % function this = Documentation()
            %
            % The default constructor can be used to directly create a
            % diagram based on the given objects_.
            %
            % :param objects_: (mandatory, cell) cell array containing the
            % objects to add to the UML diagram. See help of method
            % addObj(object); for further details about the list of
            % supported types.
            %
            
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
                addMetaObj(this, matdoc.metaFromStr(object));
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
                    fwrite(fid, this.plantUML);
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
            
        end % function set.UmlObjects(this, val)
        
        %% - val = get.UmlObjects()
        function val = get.UmlObjects(this)
            % function val = get.UmlObjects(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.UmlObjects_;
            
        end % function val = get.UmlObjects(this)
        
        %% - val = get.ClassListFlattend()
        function val = get.ClassListFlattend(this)
            % function val = get.ClassListFlattend(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            % Get classes %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            % get the directly added classes
            val = this.ClassList;
            
            % get their super classes
            for iClass = 1:length(this.ClassList)
                val = horzcat(val, this.ClassList(iClass).SuperclassListFlattend);
            end % for iClass = 1:length(this.ClassList)
            
            % Get classes from packages %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            flattenedPackList = this.PackageListFlattend;
            for iPack = 1:length(flattenedPackList)
                val = horzcat(val, flattenedPackList(iPack).ClassList);
            end % for iPack = 1:length(flattenedPackList)
            
            % make sure to return only distinct classes %%%%%%%%%%%%%%%%%%%
            val = unique(val);
            
        end % function val = get.ClassListFlattend(this)
        
        %% - val = get.PackageListFlattend()
        function val = get.PackageListFlattend(this)
            % function val = get.PackageListFlattend(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.PackageList;
            
            % get their super classes
            for iClass = 1:length(this.PackageList)
                val = horzcat(val, this.PackageList(iClass).PackageListFlattend);
            end % for iClass = 1:length(this.ClassList)
            
            % make sure to return only distinct classes
            val = unique(val);
            
        end % function val = get.PackageListFlattend(this)
        
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
                case 'meta.class'
                    % wrapt the matlab meta class with my own to allow uml
                    % export
                    umlMetaObj = matdoc.Meta.Class(metaObj, this);
                    
                    % add the class to the list of classes
                    if isempty(this.ClassList)
                        this.ClassList = umlMetaObj;
                    else % if isempty(this.ClassList)
                        this.ClassList(1, end + 1) = umlMetaObj;
                    end % if isempty(this.ClassList)
                    
                case 'meta.package'
                    
                    % wrap the meta.package with my own class to allow uml
                    % export
                    umlMetaObj = matdoc.Meta.Package(metaObj, this);
                    
                    % add the class to the list of classes
                    if isempty(this.PackageList)
                        this.PackageList = umlMetaObj;
                    else % if isempty(this.PackageList)
                        this.PackageList(1, end + 1) = umlMetaObj;
                    end % if isempty(this.PackageList)
                    
            end % switch class(metaObj)
            
            this.UmlObjects_{end + 1, 1} = umlMetaObj;
            
        end % function addMetaObj(this, metaObj)
        
        %% - umlStr = getPlantUML()
        function umlStr = getPlantUML(this)
            % function umlStr = getPlantUML(this)
            %
            % Returns the plantUML representation of this meta object.
            % Note: This method will be called by the getter of the
            % plantUML property of the matdoc.Meta.Super.Meta.
            
            % uml string start %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            umlStr = '@startuml';
            
            % add UML String for each package %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            % The packages will not directly be exported to UML because
            % their classes are discovered on the ClassListFlattend
            % property
            
            %for iObj = 1:length(this.PackageList)
            %    umlStr = sprintf('%s\n\n%s', ...
            %        umlStr, this.PackageList(iObj).plantUML);
            %end % for iObj = 1:length(this.PackageList)
            
            % add UML String of each class %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            for iObj = 1:length(this.ClassListFlattend)
                curMetaClass = this.ClassListFlattend(iObj);
                
                % may be the class needs to be skipped?
                if this.Configuration.IgnoreBuiltInClass && curMetaClass.isBuiltIn
                    continue;
                end % if this.Configuration.IgnoreBuiltInClass && curMetaClass.isBuiltIn
                
                umlStr = sprintf('%s\n\n%s', umlStr, curMetaClass.plantUML);
            end % for iObj = 1:length(this.UmlObjects_)
            
            % add UML String for the relations %%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            % add the UML end %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            umlStr = sprintf('%s\n\n%s', umlStr, '@enduml');
            
        end % function umlStr = getPlantUML(this)
        
    end %  methods (Access = protected)
    
    %% METHODS: STATIC
    methods (Static)
        
    end % methods (Static)
    
end % classdef UML < handle