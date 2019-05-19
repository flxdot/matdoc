classdef Container < matdoc.meta.super.Base & ...
        matdoc.super.WithNameRaw & ...
        matdoc.super.WithAlias
   
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
        function this = Container(metaObj, parent)
            % function this = Container(metaObj, parent)
            %
            %
            
            this = this@matdoc.meta.super.Base(metaObj, parent);
            
        end % function this = ColumnDataDisplay()
        
    end % methods
    
    %% METHODS: PROTECTED
    methods (Access = protected)
        
        %% - walkMeta()
        function walkMeta(this)
            % function walkMeta(this)
            %
            %

            % set the raw name
            setNameRaw(this);
            
            % set the alias
            setAlias(this);
            
        end % function walkMeta(this)
        
    end % methods (Access = protected)
    
    %% METHODS: STATIC
    methods (Static)
        
    end % methods (Static)
    
end % classdef Container < handle