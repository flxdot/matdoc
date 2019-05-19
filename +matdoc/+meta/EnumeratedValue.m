classdef EnumeratedValue < matdoc.meta.super.Base & ...
        matdoc.super.AccessCategory & ...
        matdoc.uml.EnumeratedValue
    
    %% PROPERTIES: PUBLIC
    properties
        
    end % properties
    
    %% PROPERTIES: DEPENDENT, SETACCESS = PROTECTED
    properties (Dependent, SetAccess = protected)
        
        % The name of the enumeration value
        Name;
        
        % The description of th enumeration value
        Description;
        
        % The detailes description of the enumeration value
        DetailedDescription;
        
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
        function this = EnumeratedValue(metaObj, parent)
            % function this = EnumeratedValue()
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
    
end % classdef EnumeratedValue < handle
