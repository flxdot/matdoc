classdef UML < m2plantUML.Super.DisplayUML
    
    %% PROPERTIES: PUBLIC
    properties (Dependent)
        
        % Cell array of objects which will be added to the UML
        UmlObjects;
        
    end % properties
    
    %% PROPERTIES: SETACCESS = PROTECTED
    properties (SetAccess = protected)
        
        % List of all classes in the UmlObjects
        % This list only contains the classes directly added to UmlObjects
        ClassList = m2plantUML.Meta.Class.empty(1, 0);
        
        
        % List of all classes in the UmlObjects
        % This list also includes the super classes for each class
        ClassListFlattend = m2plantUML.Meta.Class.empty(1, 0);
        
        % List of all packages in the UmlObjects
        % This list only contains the packages directly added to UmlObjects
        PackageList = m2plantUML.Meta.Package.empty(1, 0);
        
        
        % List of all packages in the UmlObjects
        % This list also includes the sub packages of package
        PackeListFlattend = m2plantUML.Meta.Package.empty(1, 0);
        
    end % properties (SetAccess = protected)
    
    %% PROPERTIES: ACCESS = PROTECTED
    properties (Access = protected)
        
    end % properties (Access = protected)
    
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
        function this = UML(objects_)
            % function this = UML()
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
                % there is no need to call clear() here because it will be
                % called in the setter of the UmlObjects property.
                this.UmlObjects = objects_;
            else % if nargin > 0
                % reset the class
                clear(this);
            end % if nargin > 0
            
        end % function this = ColumnDataDisplay()
        
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
                addMetaObj(this, m2plantUML.metaFromStr(object));
            else % get the meta class of the actual passed object
                addMetaObj(this, metaclass(val));
            end % if isa(object, 'meta.class')
            
        end % function addObj(this, object)
        
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
                error('m2plantUML:UML:setUmlObjects:TypeError',...
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
                    umlMetaObj = m2plantUML.Meta.Class(metaObj, []);
                    
                    % add the class to the list of all classes
                    if isempty(this.ClassList)
                        
                        % ClassList
                        this.ClassList = umlMetaObj;
                        
                        % ClassListFlattend
                        this.ClassListFlattend = horzcat(...
                            umlMetaObj,...
                            umlMetaObj.SuperclassListFlattend...
                            );
                        
                    else % if isempty(this.ClassList)
                        % ClassList
                        this.ClassList = horzcat(...
                            this.ClassList,...
                            umlMetaObj...
                            );
                        
                        % ClassListFlattend
                        this.ClassListFlattend = horzcat(...
                            this.ClassListFlattend,...
                            umlMetaObj,...
                            umlMetaObj.SuperclassListFlattend...
                            );
                    end % if isempty(this.ClassList)
                    
                    % keep only distinct classes
                    this.ClassList = unique(this.ClassList);
                    this.ClassListFlattend = unique(this.ClassListFlattend);
                    
                case 'meta.package'
                    
                    % wrap the meta.package with my own class to allow uml
                    % export
                    umlMetaObj = m2plantUML.Meta.Package(metaObj, []);
                    
                    % add the class to the list of all classes
                    if isempty(this.PackageList)
                        
                        % PackageList
                        this.PackageList = umlMetaObj;
                        
                        % PackageListFlattend
                        this.PackageListFlattend = vertcat(...
                            umlMetaObj,...
                            umlMetaObj.SuperclassListFlattend...
                            );
                        
                    else % if isempty(this.PackageList)
                        % PackageList
                        this.PackageList = vertcat(...
                            this.PackageList,...
                            umlMetaObj...
                            );
                        
                        % PackageListFlattend
                        this.PackageListFlattend = vertcat(...
                            this.PackageListFlattend,...
                            umlMetaObj,...
                            umlMetaObj.SuperclassListFlattend...
                            );
                    end % if isempty(this.PackageList)
                    
                    % keep only distinct classes
                    this.PackageList = unique(this.PackageList);
                    this.PackageListFlattend = unique(this.PackageListFlattend);
                    
            end % switch class(metaObj)
            
            this.UmlObjects_{end + 1, 1} = umlMetaObj;
            
        end % function addMetaObj(this, metaObj)
        
        %% - umlStr = getPlantUML()
        function umlStr = getPlantUML(this)
            % function umlStr = getPlantUML(this)
            %
            % Returns the plantUML representation of this meta object.
            % Note: This method will be called by the getter of the
            % plantUML property of the m2plantUML.Meta.Super.Meta.
            
            % uml string start %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            umlStr = '@startuml';
            
            % add UML String of each class %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            for iObj = 1:length(this.ClassListFlattend)
                curMetaClass = this.ClassListFlattend(iObj);
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
