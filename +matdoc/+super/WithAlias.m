classdef WithAlias < handle
   
    %% PROPERTIES: SETACCESS = PROTECTED
    properties (SetAccess = protected)
        
        % A distince name alias of this class which is used in the UML
        % diagram as alias to deal with packages and classes which might
        % have the same name
        Alias;
        
    end % properties (SetAccess = protected)
    
    %% PROPERTIES: ABSTRACT, SETACCESS = PROTECTED
    properties (Abstract, SetAccess = protected)
        
        % The name of the meta object
        Name;
        
        % The raw name of the class, package, etc. without the leading package or
        % namepace string
        NameRaw;
        
    end % properties (SetAccess = protected)
    
    %% METHODS: PROTECTED
    methods (Access = protected)
        
        %% - setAlias()
        function setAlias(this)
            % function setAlias(this)
            %
            % This method sets the Alias property based on the name. This
            % is method is called when ever the metaObj is been set.
            %
            % The alias will be the name of the class followed by the raw
            % name followed by a the first 8 characters of a hash build
            % from the class, the name and the current time
            
            % 
            StrToHash = sprintf('%s-%s-%s',...
                class(this),...
                this.Name,...
                datestr(now, 'YYYYMMDDhhmmssfff')...
                );
            HashedStr = matdoc.tools.string2hash(StrToHash);
            
            % get the raw class name
            ClassNameParts = strsplit(class(this), '.');
            
            % build the Alias
            this.Alias = sprintf('%s%s%s',...
                ClassNameParts{end},...
                this.NameRaw,...
                HashedStr(1:8)...
                );
            
        end % function setAlias(this)
        
    end % methods (Access = protected)
    
end % classdef WithAlias < handle
