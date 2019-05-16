classdef UML < m2plantUML.Super.DisplayUML
    
    %% PROPERTIES: PUBLIC
    properties (Dependent)
        
        % Cell array of objects which will be added to the UML
        UmlObjects;
        
    end % properties
    
    %% PROPERTIES: SETACCESS = PROTECTED
    properties (SetAccess = protected)
        
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
                    umlMetaObj = m2plantUML.Meta.Class(metaObj, []);
                case 'meta.package'
                    umlMetaObj = m2plantUML.Meta.Package(metaObj, []);
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
            
            % add UML String of each object %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            for iObj = 1:length(this.UmlObjects_)
                curMetaObj = this.UmlObjects{iObj};
                umlStr = sprintf('%s\n\n%s', umlStr, curMetaObj.plantUML);
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
