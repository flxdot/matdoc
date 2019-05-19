classdef AccessCategory < handle
    
    %% PROPERTIES: PUBLIC
    properties
        
    end % properties
    
    %% PROPERTIES: SETACCESS = PROTECTED
    properties (SetAccess = protected)
        
        % The category of the method, property, event or enumeration value
        % within a calls or class within a package
        categoryUML;
        
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
        function this = AccessCategory()
            % function this = AccessCategory()
            %
            %
            
            
            
        end % function this = ColumnDataDisplay()
        
        %% - val = get.categoryUML()
        function val = get.categoryUML(this)
            % function val = get.categoryUML(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = getAccessCategory(this);
            
        end % function val = get.categoryUML(this)
        
    end % methods
    
    %% METHODS: ABSTRACT, PROTECTED
    methods (Abstract, Access = protected)
        
        %% - umlCat = getAccessCategory(this
        umlCat = getAccessCategory(this);
        
    end %  methods (Access = protected)
    
    %% METHODS: STATIC
    methods (Static)
        
    end % methods (Static)
    
end % classdef AccessCategory < handle
