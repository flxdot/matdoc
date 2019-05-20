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
        IgnoreBuiltInMethodInheritance = true;
        
        % Flag: true or false
        % Default: true
        % If set the uml export will not contain properties inheritated
        % from built-in classes
        IgnoreBuiltInPropertyInheritance = true;
        
        % Flag: true or false
        % Default: true
        % If set the export will not contain any classes which are from the
        % matlab unittesting framework or inheritated from the unit testing
        % frame work
        IgnoreTests = true;
        
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
    
    %% PROPERTIES: DEPENDENT
    properties (Dependent)
        
        % IgnoreBuiltInMethodInheritance and
        % IgnoreBuiltInPropertyInheritance combined.
        IgnoreBuiltInInheritance = true;
        
        % MethodInheritanceHint and PropertyInheritanceHint combined.
        InheritanceHint = true;
        
        % Hiddes all methods, properties, events and enumeration members
        % to let the user focus on the relation between the classes. This
        % can be helfull when the Diagram is very large or fairly
        % complicated.
        OnlyRelationship = false;
        
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
                    otherwise
                        error('matdoc:Configuration:setSetting:SettingNotFound',...
                            'Can not set settings ''%s'' because i don''t know that. You better check the documentation again!', key);
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
        
        %% - set.HideEnumerationMember(val)
        function set.HideEnumerationMember(this, val)
            % function set.HideEnumerationMember(this, val)
            %
            % The setter method will make sure that only proper values are
            % set.
            
            % check data type
            if isempty(val) || (~islogical(val) && ~isnumeric(val))
                error('matdoc:Configuration:setHideEnumerationMember:TypeError',...
                    'The HideEnumerationMember has to be a numeric value.');
            end % if ~isnumeric(val)
            
            this.HideEnumerationMember = logical(val(1));
            
        end % function set.HideEnumerationMember(this, val)
        
        %% - set.HideEvents(val)
        function set.HideEvents(this, val)
            % function set.HideEvents(this, val)
            %
            % The setter method will make sure that only proper values are
            % set.
            
            % check data type
            if isempty(val) || (~islogical(val) && ~isnumeric(val))
                error('matdoc:Configuration:setHideEvents:TypeError',...
                    'The HideEvents has to be a numeric value.');
            end % if ~isnumeric(val)
            
            this.HideEvents = logical(val(1));
            
        end % function set.HideEvents(this, val)
        
        %% - set.HideMethods(val)
        function set.HideMethods(this, val)
            % function set.HideMethods(this, val)
            %
            % The setter method will make sure that only proper values are
            % set.
            
            % check data type
            if isempty(val) || (~islogical(val) && ~isnumeric(val))
                error('matdoc:Configuration:setHideMethods:TypeError',...
                    'The HideMethods has to be a numeric value.');
            end % if ~isnumeric(val)
            
            this.HideMethods = logical(val(1));
            
        end % function set.HideMethods(this, val)
        
        %% - set.HideInheritance(val)
        function set.HideInheritance(this, val)
            % function set.HideInheritance(this, val)
            %
            % The setter method will make sure that only proper values are
            % set.
            
            % check data type
            if isempty(val) || (~islogical(val) && ~isnumeric(val))
                error('matdoc:Configuration:setHideInheritance:TypeError',...
                    'The HideInheritance has to be a numeric value.');
            end % if ~isnumeric(val)
            
            this.HideInheritance = logical(val(1));
            
        end % function set.HideInheritance(this, val)
        
        %% - set.HideProperties(val)
        function set.HideProperties(this, val)
            % function set.HideProperties(this, val)
            %
            % The setter method will make sure that only proper values are
            % set.
            
            % check data type
            if isempty(val) || (~islogical(val) && ~isnumeric(val))
                error('matdoc:Configuration:setHideProperties:TypeError',...
                    'The HideProperties has to be a numeric value.');
            end % if ~isnumeric(val)
            
            this.HideProperties = logical(val(1));
            
        end % function set.HideProperties(this, val)
        
        %% - set.IgnoreBuiltInClass(val)
        function set.IgnoreBuiltInClass(this, val)
            % function set.IgnoreBuiltInClass(this, val)
            %
            % The setter method will make sure that only proper values are
            % set.
            
            % check data type
            if isempty(val) || (~islogical(val) && ~isnumeric(val))
                error('matdoc:Configuration:setIgnoreBuiltInClass:TypeError',...
                    'The IgnoreBuiltInClass has to be a numeric value.');
            end % if ~isnumeric(val)
            
            this.IgnoreBuiltInClass = logical(val(1));
            
        end % function set.IgnoreBuiltInClass(this, val)
        
        %% - set.IgnoreBuiltInMethodInheritance(val)
        function set.IgnoreBuiltInMethodInheritance(this, val)
            % function set.IgnoreBuiltInMethodInheritance(this, val)
            %
            % The setter method will make sure that only proper values are
            % set.
            
            % check data type
            if isempty(val) || (~islogical(val) && ~isnumeric(val))
                error('matdoc:Configuration:setIgnoreBuiltInMethodInheritance:TypeError',...
                    'The IgnoreBuiltInMethodInheritance has to be a numeric value.');
            end % if ~isnumeric(val)
            
            this.IgnoreBuiltInMethodInheritance = logical(val(1));
            
        end % function set.IgnoreBuiltInMethodInheritance(this, val)
        
        %% - set.IgnoreBuiltInPropertyInheritance(val)
        function set.IgnoreBuiltInPropertyInheritance(this, val)
            % function set.IgnoreBuiltInPropertyInheritance(this, val)
            %
            % The setter method will make sure that only proper values are
            % set.
            
            % check data type
            if isempty(val) || (~islogical(val) && ~isnumeric(val))
                error('matdoc:Configuration:setIgnoreBuiltInPropertyInheritance:TypeError',...
                    'The IgnoreBuiltInPropertyInheritance has to be a numeric value.');
            end % if ~isnumeric(val)
            
            this.IgnoreBuiltInPropertyInheritance = logical(val(1));
            
        end % function set.IgnoreBuiltInPropertyInheritance(this, val)
        
        %% - set.IgnoreTests(val)
        function set.IgnoreTests(this, val)
            % function set.IgnoreTests(this, val)
            %
            % The setter method will make sure that only proper values are
            % set.
            
            % check data type
            if isempty(val) || (~islogical(val) && ~isnumeric(val))
                error('matdoc:Configuration:setIgnoreTests:TypeError',...
                    'The IgnoreTests has to be a numeric value.');
            end % if ~isnumeric(val)
            
            this.IgnoreTests = logical(val(1));
            
        end % function set.IgnoreTests(this, val)
        
        %% - set.MethodInheritanceHint(val)
        function set.MethodInheritanceHint(this, val)
            % function set.MethodInheritanceHint(this, val)
            %
            % The setter method will make sure that only proper values are
            % set.
            
            % check data type
            if isempty(val) || (~islogical(val) && ~isnumeric(val))
                error('matdoc:Configuration:setMethodInheritanceHint:TypeError',...
                    'The MethodInheritanceHint has to be a numeric value.');
            end % if ~isnumeric(val)
            
            this.MethodInheritanceHint = logical(val(1));
            
        end % function set.MethodInheritanceHint(this, val)
        
        %% - set.PropertyDescription(val)
        function set.PropertyDescription(this, val)
            % function set.PropertyDescription(this, val)
            %
            % The setter method will make sure that only proper values are
            % set.
            
            % check data type
            if isempty(val) || (~islogical(val) && ~isnumeric(val))
                error('matdoc:Configuration:setPropertyDescription:TypeError',...
                    'The PropertyDescription has to be a numeric value.');
            end % if ~isnumeric(val)
            
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
                    'The PropertyInheritanceHint has to be a numeric value.');
            end % if ~isnumeric(val)
            
            this.PropertyInheritanceHint = logical(val(1));
            
        end % function set.PropertyInheritanceHint(this, val)
        
        %% - set.SafeUmlExport(val)
        function set.SafeUmlExport(this, val)
            % function set.SafeUmlExport(this, val)
            %
            % The setter method will make sure that only proper values are
            % set.
            
            % check data type
            if isempty(val) || (~islogical(val) && ~isnumeric(val))
                error('matdoc:Configuration:setSafeUmlExport:TypeError',...
                    'The SafeUmlExport has to be a numeric value.');
            end % if ~isnumeric(val)
            
            this.SafeUmlExport = logical(val(1));
            
        end % function set.SafeUmlExport(this, val)
        
        %% - set.IgnoreBuiltInInheritance(val)
        function set.IgnoreBuiltInInheritance(this, val)
            % function set.IgnoreBuiltInInheritance(this, val)
            %
            % The setter method will make sure that only proper values are
            % set.
            
            % check data type
            if isempty(val) || (~islogical(val) && ~isnumeric(val))
                error('matdoc:Configuration:setIgnoreBuiltInInheritance:TypeError',...
                    'The IgnoreBuiltInInheritance has to be a numeric value.');
            end % if ~isnumeric(val)
            
            this.IgnoreBuiltInMethodInheritance = logical(val(1));
            this.IgnoreBuiltInPropertyInheritance = logical(val(1));
            
        end % function set.IgnoreBuiltInInheritance(this, val)
        
        %% - set.InheritanceHint(val)
        function set.InheritanceHint(this, val)
            % function set.InheritanceHint(this, val)
            %
            % The setter method will make sure that only proper values are
            % set.
            
            % check data type
            if isempty(val) || (~islogical(val) && ~isnumeric(val))
                error('matdoc:Configuration:setInheritanceHint:TypeError',...
                    'The InheritanceHint has to be a numeric value.');
            end % if ~isnumeric(val)
            
            this.PropertyInheritanceHint = logical(val(1));
            this.MethodInheritanceHint = logical(val(1));
            
        end % function set.InheritanceHint(this, val)
        
        %% - set.OnlyRelationship(val)
        function set.OnlyRelationship(this, val)
            % function set.OnlyRelationship(this, val)
            %
            % The setter method will make sure that only proper values are
            % set.
            
            % check data type
            if isempty(val) || (~islogical(val) && ~isnumeric(val))
                error('matdoc:Configuration:setOnlyRelationship:TypeError',...
                    'The OnlyRelationship has to be a numeric value.');
            end % if ~isnumeric(val)
            
            this.HideProperties = logical(val(1));
            this.HideMethods = logical(val(1));
            this.HideEvents = logical(val(1));
            this.HideEnumerationMember = logical(val(1));
            
        end % function set.OnlyRelationship(this, val)
        
        %% - val = get.IgnoreBuiltInInheritance()
        function val = get.IgnoreBuiltInInheritance(this)
            % function val = get.IgnoreBuiltInInheritance(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.IgnoreBuiltInMethodInheritance &&...
                this.IgnoreBuiltInPropertyInheritance;
            
        end % function val = get.IgnoreBuiltInInheritance(this)
        
        %% - val = get.InheritanceHint()
        function val = get.InheritanceHint(this)
            % function val = get.InheritanceHint(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.PropertyInheritanceHint && ...
                this.MethodInheritanceHint;
            
        end % function val = get.InheritanceHint(this)
        
        %% - val = get.OnlyRelationship()
        function val = get.OnlyRelationship(this)
            % function val = get.OnlyRelationship(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.HideProperties &&  this.HideMethods && ...
                this.HideEvents && this.HideEnumerationMember;
            
        end % function val = get.OnlyRelationship(this)
        
    end % methods
    
    %% METHODS: PROTECTED
    methods (Access = protected)
        
    end %  methods (Access = protected)
    
    %% METHODS: STATIC
    methods (Static)
        
    end % methods (Static)
    
end % classdef Configuration < handle