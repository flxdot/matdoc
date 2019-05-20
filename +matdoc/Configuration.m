classdef Configuration < handle
    
    %% PROPERTIES: PUBLIC
    properties
        
        % Flag: true or false
        % Default: false
        % If set the UML won't contain any information about enumeration
        % members
        HideEnumerationMember = false;
        
        % Flag: true or false
        % Default: false
        % If set the UML won't contain any information about events
        HideEvents = false;
        
        % Flag: true or false
        % Default: false
        % If set the UML won't contain any information about methods
        HideMethods = false;
        
        % Flag: true or false
        % Default: false
        % If set the UML won't contain any information about inheritances
        % If you specify inheritances your self, they will still be
        % displayed!
        HideInheritance = false;
        
        % Flag: true or false
        % Default: false
        % If set the UML won't contain any information about properties
        HideProperties = false;
        
        % Flag: true or false
        % Default: false
        % If set the uml export will not contain refrences to built-in
        % classes
        IgnoreBuiltInClass = false;
        
        % Flag: true or false
        % Default: true
        % If set the uml export will not contain methods inheritated from
        % built-in classes
        IngoreBuiltInMethodInheritance = true;
        
        % Flag: true or false
        % Default: true
        % If set the uml export will not contain properties inheritated
        % from built-in classes
        IngoreBuiltInPropertyInheritance = true;
        
        % Flag: true or false
        % Default: true
        % If set the UML will contain information about inhertitated
        % methods at the end of the line
        MethodInheritanceHint = true;
        
        % Flag: true or false
        % Default: false
        % If set the description of each property will be added to the UML
        % diagram
        PropertyDescription = false;
        
        % Flag: true or false
        % Default: true
        % If set the UML will contain information about inhertitated
        % properties at the end of the line
        PropertyInheritanceHint = true;
        
        % Flag: true or fals
        % Default: false
        % If set the UML export will be done class wise instead of nesting
        % classes into their packages. This can address issues when the
        % classe diagram looks funky or classes are actually completly
        % missing form diagram. This is mainly caused by naming conflicts
        % when classes and packages have the same name.
        SafeUmlExport = false;
        
    end % properties
    
    %% PROPERTIES: SETACCESS = PROTECTED
    properties (SetAccess = protected)
        
    end % properties (SetAccess = protected)
    
    %% PROPERTIES: ACCESS = PROTECTED
    properties (Access = protected)
        
        % List of meta.properties of public all properties
        % This is mainly used to build some maintance free code, rather
        % than making things espacially fast.
        ConfigPropertyList;
        
    end % properties (Access = protected)
    
    %% PROPERTIES: CONSTANT
    properties (Constant)
        
    end % properties (Constant)
    
    %% METHODS: PUBLIC
    methods
        
        %% - Constructor
        function this = Configuration(varargin)
            % function this = Configuration(varargin)
            %
            %
            
            % reset to default values
            reset(this);
            
            % Process the input %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if mod(length(varargin), 2) == 1
                warning('matdoc:Configuration:InputInvalid',...
                    'It seems like there is something wrong here. Usually the number of inputs should be even. But it was odd. I'' just ignore the last input.');
                varargin = varargin(1:end-1);
            end % if mod(length(varargin), 2) == 1
            
            % reshape the config values
            CfgCnt = length(varargin) / 2;
            cfgVals = cell(CfgCnt, 2);
            cfgVals(:, 1) = varargin(1:2:end);
            cfgVals(:, 2) = varargin(2:2:end);
            for iCfg = 1:CfgCnt
                setSetting(this,...
                    cfgVals{iCfg, 1},... key
                    cfgVals{iCfg, 2}... value
                    );
            end % for iCfg = 1:CfgCnt
            
        end % function this = ColumnDataDisplay()
        
        %% - setSetting(key, value)
        function setSetting(this, key, value)
            % function setSetting(this, key, value)
            %
            % Call to set a config value. The key specifies the name of the
            % config value and the value... you know what the value is for.
            %
            
            % check if the property can be found directly from the list of
            % public properties
            propIdx = strcmpi({this.ConfigPropertyList(:).Name}, key);
            if any(propIdx)
                this.(this.ConfigPropertyList(propIdx).Name) = value;
                return;
            end % if any(propIdx)
            
            % check some special cases
            if value
                switch lower(key)
                    case 'ingorebuiltininheritance'
                        this.IngoreBuiltInMethodInheritance = value;
                        this.IngoreBuiltInPropertyInheritance = value;
                    case 'inheritancehint'
                        this.PropertyInheritanceHint = value;
                        this.MethodInheritanceHint = value;
                    case 'onlyrelationship'
                        this.HideProperties = true;
                        this.HideMethods = true;
                        this.HideEvents = true;
                        this.HideEnumerationMember = true;
                    otherwise
                        error('matdoc:Configuration:setSetting:SettingNotFound',...
                            'Can not set settings ''%s'' because it don'' know that. You better check the documentation again!', key);
                end % switch lower(key)
            end % if value
            
        end % function setSetting(this, key, value)
        
        %% - reset()
        function reset(this)
            % function reset(this)
            %
            % Call to reset to the default values
            
            % get the meta.class object of the Configuration to loop
            % through the public properties and reset its values to their
            % default values
            
            % Hardcoding it might be faster. But with this method I won't
            % need to touch the method each time a new config value is
            % added.
            
            metaObj = metaclass(this);
            
            % fill the list of public properties
            this.ConfigPropertyList = metaObj.PropertyList(...
                strcmp({metaObj.PropertyList(:).SetAccess}, 'public')...
                );
            
            for iProp = 1:length(this.ConfigPropertyList)
                curProp = metaObj.PropertyList(iProp);
                
                % reset the value if it can be accessed from outside and it
                % actually has a default value
                if curProp.HasDefault
                    this.(curProp.Name) = curProp.DefaultValue;
                end % if isPublic && HasDefault
            end % for iProp = 1:length(metaObj.PropertyList)
            
            
        end % function reset(this)
        
        %% - set.IgnoreBuiltInClass(val)
        function set.IgnoreBuiltInClass(this, val)
            % function set.IgnoreBuiltInClass(this, val)
            %
            % The setter method will make sure that only proper values are
            % set.
            
            % check data type
            if isempty(val) || (~islogical(val) && ~isnumeric(val))
                error('matdoc:Configuration:setIgnoreBuiltInClass:TypeError',...
                    'The IgnoreBuiltInClass has to be a bool value.');
            end % if (~islogical(val) && ~isnumeric(val))
            
            this.IgnoreBuiltInClass = logical(val(1));
            
        end % function set.IgnoreBuiltInClass(this, val)
        
        %% - set.IngoreBuiltInMethodInheritance(val)
        function set.IngoreBuiltInMethodInheritance(this, val)
            % function set.IngoreBuiltInMethodInheritance(this, val)
            %
            % The setter method will make sure that only proper values are
            % set.
            
            % check data type
            if isempty(val) || (~islogical(val) && ~isnumeric(val))
                error('matdoc:Configuration:setIngoreBuiltInMethodInheritance:TypeError',...
                    'The IngoreBuiltInMethodInheritance has to be a bool value.');
            end % if (~islogical(val) && ~isnumeric(val))
            
            this.IngoreBuiltInMethodInheritance = logical(val(1));
            
        end % function set.IngoreBuiltInMethodInheritance(this, val)
        
        %% - set.IngoreBuiltInPropertyInheritance(val)
        function set.IngoreBuiltInPropertyInheritance(this, val)
            % function set.IngoreBuiltInPropertyInheritance(this, val)
            %
            % The setter method will make sure that only proper values are
            % set.
            
            % check data type
            if isempty(val) || (~islogical(val) && ~isnumeric(val))
                error('matdoc:Configuration:setIngoreBuiltInPropertyInheritance:TypeError',...
                    'The IngoreBuiltInPropertyInheritance has to be a bool value.');
            end % if (~islogical(val) && ~isnumeric(val))
            
            this.IngoreBuiltInPropertyInheritance = logical(val(1));
            
        end % function set.IngoreBuiltInPropertyInheritance(this, val)
        
        %% - set.PropertyDescription(val)
        function set.PropertyDescription(this, val)
            % function set.PropertyDescription(this, val)
            %
            % The setter method will make sure that only proper values are
            % set.
            
            % check data type
            if isempty(val) || (~islogical(val) && ~isnumeric(val))
                error('matdoc:Configuration:setPropertyDescription:TypeError',...
                    'The PropertyDescription has to be a bool value.');
            end % if (~islogical(val) && ~isnumeric(val))
            
            this.PropertyDescription = logical(val(1));
            
        end % function set.PropertyDescription(this, val)
        
        %% - set.PropertyInheritanceHint(val)
        function set.PropertyInheritanceHint(this, val)
            % function set.PropertyInheritanceHint(this, val)
            %
            % The setter method will make sure that only proper values are
            % set.
            
            % check data type
            if isempty(val) || (~islogical(val) && ~isnumeric(val))
                error('matdoc:Configuration:setPropertyInheritanceHint:TypeError',...
                    'The PropertyInheritanceHint has to be a bool value.');
            end % if (~islogical(val) && ~isnumeric(val))
            
            this.PropertyInheritanceHint = logical(val(1));
            
        end % function set.PropertyInheritanceHint(this, val)
        
        %% - set.MethodInheritanceHint(val)
        function set.MethodInheritanceHint(this, val)
            % function set.MethodInheritanceHint(this, val)
            %
            % The setter method will make sure that only proper values are
            % set.
            
            % check data type
            if isempty(val) || (~islogical(val) && ~isnumeric(val))
                error('matdoc:Configuration:setMethodInheritanceHint:TypeError',...
                    'The MethodInheritanceHint has to be a bool value.');
            end % if (~islogical(val) && ~isnumeric(val))
            
            this.MethodInheritanceHint = logical(val(1));
            
        end % function set.MethodInheritanceHint(this, val)
        
    end % methods
    
    %% METHODS: PROTECTED
    methods (Access = protected)
        
    end %  methods (Access = protected)
    
    %% METHODS: STATIC
    methods (Static)
        
    end % methods (Static)
    
end % classdef Configuration < handle