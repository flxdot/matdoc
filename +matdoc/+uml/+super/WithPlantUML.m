classdef WithPlantUML < handle
   
    %% PROPERTIES: SETACCESS = PROTECTED
    properties (SetAccess = protected)
        
        % The plantUML representation of the object
        plantUML = '';
        
    end % properties (SetAccess = protected)
    
    %% METHODS: PUBLIC
    methods
        
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
    
end % classdef WithPlantUML < handle
