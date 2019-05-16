classdef Meta < m2plantUML.Super.DisplayUML
    
    %% PROPERTIES: PUBLIC
    properties
        
    end % properties
    
    %% PROPERTIES: SETACCESS = PROTECTED
    properties (SetAccess = protected)
        
        % the actual wrapped meta object (meta.package, meta.class,
        % meta.method, meta.property, etc.)
        metaObj;
        
    end % properties (SetAccess = protected)
    
    %% PROPERTIES: ACCESS = PROTECTED
    properties (Access = protected)
        
        % the parent object
        Parent;
        
    end % properties (Access = protected)
    
    %% PROPERTIES: CONSTANT
    properties (Constant)
        
    end % properties (Constant)
    
    %% METHODS: PUBLIC
    methods
        
        %% - Constructor
        function this = Meta(metaObj, parent)
            % function this = Meta()
            %
            %
            
            % store the property
            this.metaObj = metaObj;
            if nargin > 1
                this.Parent = parent;
            end % if nargin > 1
            
        end % function this = ColumnDataDisplay()
        
        %% - set.metaObj(val)
        function set.metaObj(this, val)
            % function set.metaObj(this, val)
            %
            % The setter method will make sure that only proper values are
            % set.
            
            % check data type
            if isempty(val) || (...
                    ~isa(val, 'meta.package') && ...
                    ~isa(val, 'meta.class') && ...
                    ~isa(val, 'meta.property') && ...
                    ~isa(val, 'meta.method') && ...
                    ~isa(val, 'meta.event') && ...
                    ~isa(val, 'meta.EnumeratedValue') && ...
                    ~isa(val, 'function_handle')...
                    )
                error('m2plantUML:Meta:Super:setmetaObj:TypeError',...
                    'The metaObj has to be a non empty meta object. Was of type %s instead.',...
                    class(val));
            end % if ~isnumeric(val)
            
            % store the property
            this.metaObj = val;
            
            % make sure to wrap the sub meta classes
            walkMeta(this);
            
        end % function set.metaObj(this, val)
        
    end % methods
    
    %% METHODS: PROTECTED
    methods (Abstract, Access = protected)
        
        %% - walkMeta()
        walkMeta(this);
        
    end %  methods (Access = protected)
    
    %% METHODS: STATIC
    methods (Static)
        
    end % methods (Static)
    
end % classdef Meta < handle