classdef Class < m2plantUML.Meta.Super.Meta
    
    %% PROPERTIES: PUBLIC
    properties
        
    end % properties
    
    %% PROPERTIES: SETACCESS = PROTECTED
    properties (SetAccess = protected)
        
        % The list of properties
        PropertyList;
        
        % The list of methods
        MethodList;
        
        % The list of events
        EventList;
        
        % The list of EnumerationMembers
        EnumerationMemberList;
        
        % The list of super classes
        SuperclassList;
        
    end % properties (SetAccess = protected)
    
    %% PROPERTIES: SETACCESS = PROTECTED
    properties (Dependent, SetAccess = protected)
        
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
            
            this = this@m2plantUML.Meta.Super.Meta(metaObj, parent);
            
            
        end % function this = ColumnDataDisplay()
        
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
                this.PropertyList = m2plantUML.Meta.Property(this.metaObj.PropertyList(1), this);
                for iPack = 2:length(this.metaObj.PropertyList)
                    this.PropertyList(iPack) = m2plantUML.Meta.Property(this.metaObj.PropertyList(iPack), this);
                end % for iPack = 2:length(this.metaObj.PropertyList)
            end % if ~isempty(this.metaObj.PropertyList)
            
            % MethodList %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if ~isempty(this.metaObj.MethodList)
                this.MethodList = m2plantUML.Meta.Method(this.metaObj.MethodList(1), this);
                for iPack = 2:length(this.metaObj.MethodList)
                    this.MethodList(iPack) = m2plantUML.Meta.Method(this.metaObj.MethodList(iPack), this);
                end % for iPack = 2:length(this.metaObj.MethodList)
            end % if ~isempty(this.metaObj.MethodList)
            
            % EventList %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if ~isempty(this.metaObj.EventList)
                this.EventList = m2plantUML.Meta.Event(this.metaObj.EventList(1), this);
                for iPack = 2:length(this.metaObj.EventList)
                    this.EventList(iPack) = m2plantUML.Meta.Event(this.metaObj.EventList(iPack), this);
                end % for iPack = 2:length(this.metaObj.EventList)
            end % if ~isempty(this.metaObj.EventList)
            
            % EnumerationMemberList %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if ~isempty(this.metaObj.EnumerationMemberList)
                this.EnumerationMemberList = m2plantUML.Meta.EnumerationValue(this.metaObj.EnumerationMemberList(1), this);
                for iPack = 2:length(this.metaObj.EnumerationMemberList)
                    this.EnumerationMemberList(iPack) = m2plantUML.Meta.EnumerationValue(this.metaObj.EnumerationMemberList(iPack), this);
                end % for iPack = 2:length(this.metaObj.EnumerationMemberList)
            end % if ~isempty(this.metaObj.EnumerationMemberList)
            
            % SuperclassList %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if ~isempty(this.metaObj.SuperclassList)
                this.SuperclassList = m2plantUML.Meta.Class(this.metaObj.SuperclassList(1), this);
                for iPack = 2:length(this.metaObj.SuperclassList)
                    this.SuperclassList(iPack) = m2plantUML.Meta.Class(this.metaObj.SuperclassList(iPack), this);
                end % for iPack = 2:length(this.metaObj.EventList)
            end % if ~isempty(this.metaObj.EventList)
            
        end % function walkMeta(this)
        
        %% - umlStr = getPlantUML()
        function umlStr = getPlantUML(this)
            % function umlStr = getPlantUML(this)
            %
            % Returns the plantUML representation of this meta object.
            % Note: This method will be called by the getter of the
            % plantUML property of the m2plantUML.Meta.Super.Meta.
            
            % uml string start %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            umlStr = sprintf('class %s {', this.Name);
            
            % add UML String of each field %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            for iObj = 1:length(this.PropertyList)
                curMetaObj = this.PropertyList(iObj);
                umlStr = sprintf('%s\n%s', umlStr, curMetaObj.plantUML);
            end % for iObj = 1:length(this.PropertyList)
            
            % add UML String for each method %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            for iObj = 1:length(this.MethodList)
                curMetaObj = this.MethodList(iObj);
                umlStr = sprintf('%s\n%s', umlStr, curMetaObj.plantUML);
            end % for iObj = 1:length(this.MethodList)
            
            % add UML String for each event %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            for iObj = 1:length(this.EventList)
                curMetaObj = this.EventList(iObj);
                umlStr = sprintf('%s\n%s', umlStr, curMetaObj.plantUML);
            end % for iObj = 1:length(this.EventList)
            
            % add UML String for each enuemration value %%%%%%%%%%%%%%%%%%%
            for iObj = 1:length(this.EnumerationMemberList)
                curMetaObj = this.EnumerationMemberList(iObj);
                umlStr = sprintf('%s\n%s', umlStr, curMetaObj.plantUML);
            end % for iObj = 1:length(this.EnumerationMemberList)
            
            % add the UML end %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            umlStr = sprintf('%s\n}', umlStr);
            
        end % function umlStr = getPlantUML(this)
        
    end %  methods (Access = protected)
    
    %% METHODS: STATIC
    methods (Static)
        
    end % methods (Static)
    
end % classdef Class < handle
