classdef Property < m2plantUML.Meta.Super.Meta & ...
        m2plantUML.Super.DisplayUMLCategory
    
    %% PROPERTIES: PUBLIC
    properties
        
    end % properties
    
    
    %% PROPERTIES: SETACCESS = PROTECTED
    properties (SetAccess = protected)
        
        % The get methd of the property
        GetMethod;
        
        % The set method of the propery
        SetMethod;
        
    end % properties (SetAccess = protected)
    
    %% PROPERTIES: DEPENDENT, SETACCESS = PROTECTED
    properties (Dependent, SetAccess = protected)
        
        % The name of the property
        Name;
        
        % Short description of the property
        Description;
        
        % Details description of the property
        DetailedDescription;
        
        % The get access level
        GetAccess;
        
        % The set access level
        SetAccess;
        
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
            
            this = this@m2plantUML.Meta.Super.Meta(metaObj, parent);
            
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
            else
                val = help(sprintf('%s/%s', this.DefiningClass.Name, this.Name));
            end
            
        end % function val = get.Description(this)
        
        %% - val = get.DetailedDescription()
        function val = get.DetailedDescription(this)
            % function val = get.DetailedDescription(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.DetailedDescription;
            
        end % function val = get.DetailedDescription(this)
        
        %% - val = get.GetAccess()
        function val = get.GetAccess(this)
            % function val = get.GetAccess(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.GetAccess;
            
        end % function val = get.GetAccess(this)
        
        %% - val = get.SetAccess()
        function val = get.SetAccess(this)
            % function val = get.SetAccess(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.SetAccess;
            
        end % function val = get.SetAccess(this)
        
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
                this.GetMethod = m2plantUML.Meta.Method(this.metaObj.GetMethod, this);
            end % if ~isempty(this.metaObj.PackageList)
            
            % SetMethod %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if ~isempty(this.metaObj.SetMethod)
                this.SetMethod = m2plantUML.Meta.Method(this.metaObj.SetMethod, this);
            end % if ~isempty(this.metaObj.PackageList)
            
        end % function walkMeta(this)
        
        %% - umlStr = getPlantUML()
        function umlStr = getPlantUML(this)
            % function umlStr = getPlantUML(this)
            %
            % Returns the plantUML representation of this meta object.
            % Note: This method will be called by the getter of the
            % plantUML property of the m2plantUML.Meta.Super.Meta.
            
            % prefix
            prefix = '   {field} ';
            if this.Constant
               prefix = sprintf('%s{static} ', prefix(1:end-1)); 
            end
            if this.Abstract
               prefix = sprintf('%s{abtract} ', prefix(1:end-1)); 
            end
            
            % acces level
            switch this.GetAccess
                case 'private'
                    AccessLevel = '-';
                case 'protected'
                    AccessLevel = '#';
                otherwise
                    AccessLevel = '+';
            end % switch this.GetAccess
            
            % name
            umlStr = sprintf('%s%s%s', prefix, AccessLevel, this.Name);
            
            % print description?
            % spacer = char(31 * ones(1, length(prefix) + length(AccessLevel)));
            % umlStr = sprintf('%s\n%s%s\n%s', umlStr, spacer, this.Description, spacer);
            
        end % function umlStr = getPlantUML(this)
        
        %% - umlCat = getCategoryUML(this
        function umlCat = getCategoryUML(this)
            % function umlCat = getCategoryUML(this)
            %
            % Returns the string of the category within a class or package
            % based on its access level and other (abstract, hidden, etc.)
            
            umlCat = this.GetAccess;
            
        end % function umlCat = getCategoryUML(this)
        
    end %  methods (Access = protected)
    
    %% METHODS: STATIC
    methods (Static)
        
    end % methods (Static)
    
end % classdef Property < handle
