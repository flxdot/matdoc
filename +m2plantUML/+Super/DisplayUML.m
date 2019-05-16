classdef DisplayUML < handle
   
    %% PROPERTIES: PUBLIC
    properties
        
    end % properties
    
    %% PROPERTIES: SETACCESS = PROTECTED
    properties (SetAccess = protected)
        
        % The plantUML representation of the object
        plantUML = '';
        
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
        function this = DisplayUML()
            % function this = DisplayUML()
            %
            %
            
            
            
        end % function this = ColumnDataDisplay()
        
        %% - val = get.plantUML()
        function val = get.plantUML(this)
            % function val = get.plantUML(this)
            %
            % Returns the plantUML representation of the meta object
            
            val = getPlantUML(this);
            
        end % function val = get.plantUML(this)
        
    end % methods
    
    %% METHODS: PROTECTED
    methods (Abstract, Access = protected)
        
        %% - getPlantUML()
        getPlantUML(this);
        
    end %  methods (Access = protected)
    
    %% METHODS: STATIC
    methods (Static)
        
    end % methods (Static)
    
end % classdef DisplayUML < handle