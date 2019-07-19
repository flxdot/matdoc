classdef Property < matdoc.meta.super.Base & ...
        matdoc.super.AccessCategory & ...
        matdoc.uml.Property & ...
        matdoc.sphinx.Property
    
    %% PROPERTIES: PUBLIC
    properties
        
    end % properties
    
    
    %% PROPERTIES: SETACCESS = PROTECTED
    properties (SetAccess = protected)
        
        % The get methd of the property
        GetMethod;
        
        % The set method of the propery
        SetMethod;
        
        % The get access level
        GetAccess;
        
        % The set access level
        SetAccess;
        
    end % properties (SetAccess = protected)
    
    %% PROPERTIES: DEPENDENT, SETACCESS = PROTECTED
    properties (Dependent, SetAccess = protected)
        
        % The name of the property
        Name;
        
        % Short description of the property
        Description;
        
        % Details description of the property
        DetailedDescription;
        
        % Is the property dependent?
        Dependent;
        
        % Is the property constant?
        Constant;
        
        % Is the property abstract?
        Abstract;
        
        % Is the property transient?
        Transient;
        
        % Is the property Hidden?
        Hidden;
        
        % Is the property get oberservable?
        GetObservable;
        
        % Is the property set aoberservable?
        SetObservable;
        
        % Is the AboirtSet Flag set?
        AbortSet;
        
        % Does the property have a default value?
        HasDefault;
        
        % The default value
        DefaultValue;
        
        % The class where this property is defined
        DefiningClass;
        
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
        function this = Property(metaObj, parent)
            % function this = Property()
            %
            %
            
            this = this@matdoc.meta.super.Base(metaObj, parent);
            
        end % function this = ColumnDataDisplay()
        
        %% - val = get.Name()
        function val = get.Name(this)
            % function val = get.Name(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.Name;
            
        end % function val = get.Name(this)
        
        %% - val = get.Description()
        function val = get.Description(this)
            % function val = get.Description(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            if ~isempty(this.metaObj.Description)
                val = this.metaObj.Description;
            else % if ~isempty(this.metaObj.Description)
                val = help(sprintf('%s/%s', this.DefiningClass.Name, this.Name));
            end % if ~isempty(this.metaObj.Description)
            
            % mae sure to remove trailing white spaces as good as possible
            val = strtrim(val);
            
        end % function val = get.Description(this)
        
        %% - val = get.DetailedDescription()
        function val = get.DetailedDescription(this)
            % function val = get.DetailedDescription(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.DetailedDescription;
            
        end % function val = get.DetailedDescription(this)
        
        %% - val = get.Dependent()
        function val = get.Dependent(this)
            % function val = get.Dependent(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.Dependent;
            
        end % function val = get.Dependent(this)
        
        %% - val = get.Constant()
        function val = get.Constant(this)
            % function val = get.Constant(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.Constant;
            
        end % function val = get.Constant(this)
        
        %% - val = get.Abstract()
        function val = get.Abstract(this)
            % function val = get.Abstract(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.Abstract;
            
        end % function val = get.Abstract(this)
        
        %% - val = get.Transient()
        function val = get.Transient(this)
            % function val = get.Transient(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.Transient;
            
        end % function val = get.Transient(this)
        
        %% - val = get.Hidden()
        function val = get.Hidden(this)
            % function val = get.Hidden(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.Hidden;
            
        end % function val = get.Hidden(this)
        
        %% - val = get.GetObservable()
        function val = get.GetObservable(this)
            % function val = get.GetObservable(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.GetObservable;
            
        end % function val = get.GetObservable(this)
        
        %% - val = get.SetObservable()
        function val = get.SetObservable(this)
            % function val = get.SetObservable(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.SetObservable;
            
        end % function val = get.SetObservable(this)
        
        %% - val = get.AbortSet()
        function val = get.AbortSet(this)
            % function val = get.AbortSet(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.AbortSet;
            
        end % function val = get.AbortSet(this)
        
        %% - val = get.HasDefault()
        function val = get.HasDefault(this)
            % function val = get.HasDefault(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.HasDefault;
            
        end % function val = get.HasDefault(this)
        
        %% - val = get.DefaultValue()
        function val = get.DefaultValue(this)
            % function val = get.DefaultValue(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.DefaultValue;
            
        end % function val = get.DefaultValue(this)
        
        %% - val = get.DefiningClass()
        function val = get.DefiningClass(this)
            % function val = get.DefiningClass(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.Parent;
            
        end % function val = get.DefiningClass(this)
        
    end % methods
    
    %% METHODS: PROTECTED
    methods (Access = protected)
        
        %% - walkMeta()
        function walkMeta(this)
            % function walkMeta(this)
            %
            % This method will make sure the sub meta classes of the
            % metaObj are also wrapped by the meta classes of this package.
            
            % GetMethod %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if ~isempty(this.metaObj.GetMethod)
                this.GetMethod = matdoc.meta.Method(this.metaObj.GetMethod, this);
            end % if ~isempty(this.metaObj.PackageList)
            
            % SetMethod %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if ~isempty(this.metaObj.SetMethod)
                this.SetMethod = matdoc.meta.Method(this.metaObj.SetMethod, this);
            end % if ~isempty(this.metaObj.PackageList)
            
            % The get access level
            this.GetAccess  = matdoc.enums.AccessLevel.from(this.metaObj.GetAccess);
            
            % The set access level
            this.SetAccess  = matdoc.enums.AccessLevel.from(this.metaObj.SetAccess);
            
        end % function walkMeta(this)
        
        %% - umlCat = getAccessCategory(this)
        function umlCat = getAccessCategory(this)
            % function umlCat = getAccessCategory(this)
            %
            % Returns the string of the category within a class or package
            % based on its access level and other (abstract, hidden, etc.)
            
            % Access Level %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            % Is the access the same for get and set?
            if this.GetAccess == this.SetAccess
                
                umlCat = char(this.GetAccess);
                
                sameAccessLevel = true;
                
            else % if this.GetAccess == this.SetAccess
                
                sameAccessLevel = false;
                
                umlCat = '';
                
                % GetAccess
                if this.GetAccess > matdoc.enums.AccessLevel.Public
                    umlCat = sprintf('%s GetAccess = %s,',...
                        umlCat, char(this.GetAccess));
                end % if this.GetAccess > matdoc.enums.AccessLevel.Public
                
                % SetAccess
                if this.SetAccess > matdoc.enums.AccessLevel.Public
                    umlCat = sprintf('%s SetAccess = %s,',...
                        umlCat, char(this.SetAccess));
                end % if this.SetAccess > matdoc.enums.AccessLevel.Public
                
            end % if this.GetAccess == this.SetAccess
            
            % Observable %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            % GetObservable
            if this.GetObservable
                umlCat = sprintf('%s GetObservable,', umlCat);
            end % if this.GetObservable
            
            % SetObservable
            if this.SetObservable
                umlCat = sprintf('%s SetObservable,', umlCat);
            end % if this.SetObservable
            
            % AbortSet
            if this.AbortSet
                umlCat = sprintf('%s AbortSet,', umlCat);
            end % if this.AbortSet
            
            % Other Attributes %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            % Hidden
            if this.Hidden
                umlCat = sprintf('Hidden %s', umlCat);
                % remove public key word if both set and get access is
                % public
                if sameAccessLevel
                    umlCat = strrep(umlCat, ...
                        char(matdoc.enums.AccessLevel.Public),...
                        ''...
                        );
                end % if sameAccessLevel
            end % if this.Hidden
            
            % Transient
            if this.Transient
                umlCat = sprintf('Transient %s', umlCat);
                % remove public key word if both set and get access is
                % public
                if sameAccessLevel
                    umlCat = strrep(umlCat, ...
                        char(matdoc.enums.AccessLevel.Public),...
                        ''...
                        );
                end % if sameAccessLevel
            end % if this.Transient
            
            % Constant
            if this.Constant
                umlCat = sprintf('Constant %s', umlCat);
                % remove public key word if both set and get access is
                % public
                if sameAccessLevel
                    umlCat = strrep(umlCat, ...
                        char(matdoc.enums.AccessLevel.Public),...
                        ''...
                        );
                end % if sameAccessLevel
            end % if this.Constant
            
            % Abstract
            if this.Abstract
                umlCat = sprintf('Abstract %s', umlCat);
                % remove public key word if both set and get access is
                % public
                if sameAccessLevel
                    umlCat = strrep(umlCat, ...
                        char(matdoc.enums.AccessLevel.Public),...
                        ''...
                        );
                end % if sameAccessLevel
            end % if this.Abstract
            
            % Final adjustements %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            % remove trailing and leading whitespaces
            umlCat = strtrim(umlCat);
            if strcmp(umlCat(end), ',')
                umlCat = strtrim(umlCat(1:end-1));
            end
            
        end % function umlCat = getAccessCategory(this)
        
    end %  methods (Access = protected)
    
    %% METHODS: STATIC
    methods (Static)
        
    end % methods (Static)
    
end % classdef Property < handle
