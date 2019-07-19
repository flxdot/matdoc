classdef Event < matdoc.meta.super.Base & ...
        matdoc.super.AccessCategory & ...
        matdoc.uml.Event & ...
        matdoc.sphinx.Event
    
    %% PROPERTIES: PUBLIC
    properties
        
    end % properties
    
    %% PROPERTIES: DEPENDENT, SETACCESS = PROTECTED
    properties (Dependent, SetAccess = protected)
        
        % The name of the event
        Name;
        
        % The description of the event
        Description;
        
        % The detailed description of the event
        DetailedDescription;
        
        % Is the event hidden?
        Hidden;
        
        % The notify access level
        NotifyAccess;
        
        % The listen access level
        ListenAccess;
        
        % The class defining the event
        DefiningClass;
        
    end % properties (SetAccess = protected)
    
    %% PROPERTIES: ACCESS = PROTECTED
    properties (Access = protected)
        
    end % properties (Access = protected)
    
    %% PROPERTIES: CONSTANT
    properties (Constant)
        
    end % properties (Constant)
    
    %% METHODS: PUBLIC
    methods
        
        %% - Constructor
        function this = Event(metaObj, parent)
            % function this = Event()
            %
            %
            
            this = this@matdoc.meta.super.Base(metaObj, parent);
            
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
        
        %% - val = get.NotifyAccess()
        function val = get.NotifyAccess(this)
            % function val = get.NotifyAccess(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.NotifyAccess;
            
        end % function val = get.NotifyAccess(this)
        
        %% - val = get.ListenAccess()
        function val = get.ListenAccess(this)
            % function val = get.ListenAccess(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.ListenAccess;
            
        end % function val = get.ListenAccess(this)
        
        %% - val = get.DefiningClass()
        function val = get.DefiningClass(this)
            % function val = get.DefiningClass(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.Parent;
            
        end % function val = get.DefiningClass(this)
        
    end % methods
    
    %% METHODS: PROTECTED
    methods (Access = protected)
        
        %% - walkMeta()
        function walkMeta(this)
            % function walkMeta(this)
            %
            % This method will make sure the sub meta classes of the
            % metaObj are also wrapped by the meta classes of this package.
            
        end % function walkMeta(this)
        
        %% - umlCat = getAccessCategory(this)
        function umlCat = getAccessCategory(this)
            % function umlCat = getAccessCategory(this)
            %
            % Returns the string of the category within a class or package
            % based on its access level and other (abstract, hidden, etc.)
            
            umlCat = '';
            
        end % function umlCat = getAccessCategory(this)
        
    end %  methods (Access = protected)
    
    %% METHODS: STATIC
    methods (Static)
        
    end % methods (Static)
    
end % classdef Event < handle
