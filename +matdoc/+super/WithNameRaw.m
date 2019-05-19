classdef WithNameRaw < handle
   
    %% PROPERTIES: SETACCESS = PROTECTED
    properties (SetAccess = protected)
        
        % The raw name of the class, package, etc. without the leading package or
        % namepace string
        NameRaw;
        
    end % properties (SetAccess = protected)
    
    %% PROPERTIES: ABSTRACT, SETACCESS = PROTECTED
    properties (Abstract, SetAccess = protected)
        
        % The name of the meta object
        Name;
        
    end % properties (SetAccess = protected)
    
    %% METHODS: PROTECTED
    methods (Access = protected)
        
        %% - setNameRaw()
        function setNameRaw(this)
            % function setNameRaw()(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            % this is ~250x faster than str split
            sepPos = strfind(this.Name, '.');
            if any(sepPos)
                this.NameRaw = this.Name(sepPos(end)+1:end);
            else % if any(sepPos)
                this.NameRaw = this.Name;
            end % if any(sepPos)
            
        end % function setNameRaw(this)
        
    end % methods (Access = protected)
    
end % classdef WithNameRaw < handle
