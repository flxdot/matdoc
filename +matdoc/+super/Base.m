classdef Base < matdoc.super.WithMetaObjProps
   
    %% PROPERTIES: PUBLIC
    properties
        
    end % properties
    
    %% PROPERTIES: SETACCESS = PROTECTED
    properties (SetAccess = protected)
        
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
        function this = Base(parent)
            % function this = Base()
            %
            %
            
            this.Parent = parent;
            
            % get the umlRoot %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            this.UmlRoot = this.Parent;
            while ~isa(this.UmlRoot, 'matdoc.Documentation') && ~isempty(this.UmlRoot)
                this.UmlRoot = this.UmlRoot.Parent;
            end % while ~isa(this.UmlRoot, 'matdoc.Documentation') && ~isempty(this.UmlRoot)
            
            % Store handle to the config
            if isa(this.UmlRoot, 'matdoc.Documentation')
                this.Configuration = this.UmlRoot.Configuration;
            else
                this.Configuration = matdoc.Configuration();
            end % if isa(this.UmlRoot, 'matdoc.Documentation')
            
        end % function this = ColumnDataDisplay()
        
    end % methods
    
    %% METHODS: PROTECTED
    methods (Access = protected)
        
    end % methods (Access = protected)
    
    %% METHODS: STATIC
    methods (Static)
        
    end % methods (Static)
    
end % classdef Base < handle
