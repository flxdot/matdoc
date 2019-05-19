classdef Base < matdoc.super.WithMetaObjProps
    
    %% PROPERTIES: PUBLIC
    properties
        
    end % properties
    
    %% PROPERTIES: ABSTRACT, SETACCESS = PROTECTED
    properties (Abstract, SetAccess = protected)
        
        % The name of the meta object
        Name;
        
    end % properties (SetAccess = protected)
    
    %% PROPERTIES: SETACCESS = PROTECTED
    properties (SetAccess = protected)
        
        % the actual wrapped meta object (meta.package, meta.class,
        % meta.method, meta.property, etc.)
        metaObj;
        
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
        function this = Base(metaObj, parent)
            % function this = Base()
            %
            %
            
            % store the property
            this.Parent = parent;
            this.metaObj = metaObj;
            
            % get the umlRoot %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            this.UmlRoot = this.Parent;
            while ~isa(this.UmlRoot, 'matdoc.Documentation') && ~isempty(this.UmlRoot)
                this.UmlRoot = this.UmlRoot.Parent;
            end % while ~isa(this.UmlRoot, 'matdoc.Documentation') && ~isempty(this.UmlRoot)
            
            % Store handle to the config
            this.Configuration = this.UmlRoot.Configuration;
            
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
                error('matdoc:Base:Super:setmetaObj:TypeError',...
                    'The metaObj has to be a non empty meta object. Was of type %s instead.',...
                    class(val));
            end % if ~isnumeric(val)
            
            % store the property
            this.metaObj = val;
            
            % make sure to wrap the sub meta classes
            walkMeta(this);
            
        end % function set.metaObj(this, val)
        
        %% [B, IX] = sort()
        function [B, IX] = sort(this, dim, mode)
            % function [B, IX] = sort(this)
            %
            % Custom sort function based on the Class name
            
            % Sort by name
            if nargin > 2
                [~, IX] = sort({this(:).Name}, dim, mode);
            elseif nargin > 1
                [~, IX] = sort({this(:).Name}, dim);
            else
                [~, IX] = sort({this(:).Name});
            end
            
            % return the sorted list
            B = this(IX);
            
        end % function [B, IX] = sort(this)
        
        %% - is_eq = eq(this, other)
        function is_eq = eq(this, other)
            % function is_eq = eq(this, other)
            %
            % Check for equality
            
            % check if both objects are from the same class
            if ~strcmp(class(this), class(other))
                error('Objects are not of the same class.');
            end % if ~strcmp(class(this), class(other))
            
            % check sizes
            szA = numel(this);
            szB = numel(other);
            
            if szA == szB
                if szA == 1
                    is_eq = ~strcmp(this.Name, other.Name);
                else % if szA == 1
                    is_eq = false(size(this));
                    for idx = 1:szA
                        is_eq(idx) = strcmp(this(idx).Name, other(idx).Name);
                    end % for idx = 1:szA
                end % if szA == 1
            elseif szA == 1
                is_eq = false(size(other));
                for idx = 1:szA
                    is_eq(idx) = strcmp(this.Name, other(idx).Name);
                end % for idx = 1:szA
            elseif szB == 1
                is_eq = false(size(this));
                for idx = 1:szA
                    is_eq(idx) = strcmp(this(idx).Name, other.Name);
                end % for idx = 1:szA
            else
                error('Dimension missmatch');
            end % if szA == szB
            
        end % function is_eq = eq(this, other)
        
        %% - is_eq = ne(this, other)
        function is_ne = ne(this, other)
            % function is_ne = ne(this, other)
            %
            % Check for in equality
            
            % check if both objects are from the same class
            if ~strcmp(class(this), class(other))
                error('Objects are not of the same class.');
            end % if ~strcmp(class(this), class(other))
            
            % check sizes
            szA = numel(this);
            szB = numel(other);
            
            if szA == szB
                if szA == 1
                    is_ne = ~strcmp(this.Name, other.Name);
                else % if szA == 1
                    is_ne = false(size(this));
                    for idx = 1:szA
                        is_ne(idx) = ~strcmp(this(idx).Name, other(idx).Name);
                    end % for idx = 1:szA
                end % if szA == 1
            elseif szA == 1
                is_ne = false(size(other));
                for idx = 1:szA
                    is_ne(idx) = ~strcmp(this.Name, other(idx).Name);
                end % for idx = 1:szA
            elseif szB == 1
                is_ne = false(size(this));
                for idx = 1:szA
                    is_ne(idx) = ~strcmp(this(idx).Name, other.Name);
                end % for idx = 1:szA
            else
                error('Dimension missmatch');
            end % if szA == szB
            
        end % function is_eq = eq(this, other)
        
    end % methods
    
    %% METHODS: PROTECTED
    methods (Abstract, Access = protected)
        
        %% - walkMeta()
        walkMeta(this);
        
    end %  methods (Access = protected)
    
    %% METHODS: STATIC
    methods (Static)
        
    end % methods (Static)
    
end % classdef Base < handle