classdef Method < m2plantUML.Meta.Super.Meta & ...
        m2plantUML.Super.DisplayUMLCategory
    
    %% PROPERTIES: PUBLIC
    properties
        
    end % properties
    
    %% PROPERTIES: SETACCESS = PROTECTED
    properties (SetAccess = protected)
        
        % The access level of the method
        Access;
        
    end % properties (SetAccess = protected)
    
    %% PROPERTIES: DEPENDENT, SETACCESS = PROTECTED
    properties (Dependent, SetAccess = protected)
        
        % The name of the method
        Name;
        
        % The description of the method
        Description;
        
        % The detailes description of the method
        DetailedDescription;
        
        % Is the method static?
        Static;
        
        % Is the method abstract?
        Abstract;
        
        % Is the method sealed?
        Sealed;
        
        % Is the method hidden?
        Hidden;
        
        % Cellstr of input names
        InputNames;
        
        % Cellstr of output names
        OutputNames;
        
        % The class defining the method
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
        function this = Method(metaObj, parent)
            % function this = Method()
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
            
            val = this.metaObj.Description;
            
        end % function val = get.Description(this)
        
        %% - val = get.DetailedDescription()
        function val = get.DetailedDescription(this)
            % function val = get.DetailedDescription(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.DetailedDescription;
            
        end % function val = get.DetailedDescription(this)
        
        %% - val = get.Static()
        function val = get.Static(this)
            % function val = get.Static(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.Static;
            
        end % function val = get.Static(this)
        
        %% - val = get.Abstract()
        function val = get.Abstract(this)
            % function val = get.Abstract(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.Abstract;
            
        end % function val = get.Abstract(this)
        
        %% - val = get.Sealed()
        function val = get.Sealed(this)
            % function val = get.Sealed(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.Sealed;
            
        end % function val = get.Sealed(this)
        
        %% - val = get.Hidden()
        function val = get.Hidden(this)
            % function val = get.Hidden(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.Hidden;
            
        end % function val = get.Hidden(this)
        
        %% - val = get.InputNames()
        function val = get.InputNames(this)
            % function val = get.InputNames(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.InputNames;
            
        end % function val = get.InputNames(this)
        
        %% - val = get.OutputNames()
        function val = get.OutputNames(this)
            % function val = get.OutputNames(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = this.metaObj.OutputNames;
            
        end % function val = get.OutputNames(this)
        
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
            
            % The access level of the method
            if isa(this.metaObj, 'function_handle')
                this.Access = m2plantUML.Enums.AccessLevel.Public;
            else % if isa(this.metaObj, 'function_handle')
                this.Access = m2plantUML.Enums.AccessLevel.from(this.metaObj.Access);
            end % if isa(this.metaObj, 'function_handle')
            
        end % function walkMeta(this)
        
        %% - umlStr = getPlantUML()
        function umlStr = getPlantUML(this)
            % function umlStr = getPlantUML(this)
            %
            % Returns the plantUML representation of this meta object.
            % Note: This method will be called by the getter of the
            % plantUML property of the m2plantUML.Meta.Super.Meta.
            
            % prefix
            prefix = '   {method} ';
            if this.Static
               prefix = sprintf('%s{static} ', prefix(1:end-1)); 
            end
            if this.Abstract
               prefix = sprintf('%s{abstract} ', prefix(1:end-1)); 
            end
            
            % acces level
            switch this.Access
                case 'private'
                    AccessLevel = '-';
                case 'protected'
                    AccessLevel = '#';
                otherwise
                    AccessLevel = '+';
            end % switch this.GetAccess
            
            % method signature
            switch length(this.OutputNames)
                case 0
                    Outputs = '';
                case 1
                    Outputs = sprintf('%s = ', this.OutputNames{1});
                otherwise
                    Outputs = sprintf('%s, ', this.OutputNames{:});
                    Outputs = sprintf('[%s] = ', Outputs(1:end-2));
            end
            switch length(this.InputNames)
                case 0
                    Inputs = '';
                otherwise
                    Inputs = sprintf('%s, ', this.InputNames{:});
                    Inputs = Inputs(1:end-2);
            end
            MethodSignature = sprintf('%s%s(%s)', Outputs, this.Name, Inputs);
            
            
            % name
            umlStr = sprintf('%s%s%s', prefix, AccessLevel, MethodSignature);
            
        end % function umlStr = getPlantUML(this)
        
        
        %% - umlCat = getCategoryUML(this)
        function umlCat = getCategoryUML(this)
            % function umlCat = getCategoryUML(this)
            %
            % Returns the string of the category within a class or package
            % based on its access level and other (abstract, hidden, etc.)
                        
            % Access Level %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            % Access
            umlCat = char(this.Access);
            isPublic = this.Access == m2plantUML.Enums.AccessLevel.Public;
            
            % Other Attributes %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            % Hidden
            if this.Hidden
                umlCat = sprintf('Hidden %s', umlCat);
                % remove public key word if both set and get access is
                % public
                if isPublic
                    umlCat = strrep(umlCat, ...
                        char(m2plantUML.Enums.AccessLevel.Public),...
                        ''...
                        );
                end % if sameAccessLevel
            end % if this.Hidden
            
            % Static
            if this.Static
                umlCat = sprintf('Static %s', umlCat);
                % remove public key word if both set and get access is
                % public
                if isPublic
                    umlCat = strrep(umlCat, ...
                        char(m2plantUML.Enums.AccessLevel.Public),...
                        ''...
                        );
                end % if sameAccessLevel
            end % if this.Static
            
            % Sealed
            if this.Sealed
                umlCat = sprintf('Sealed %s', umlCat);
                % remove public key word if both set and get access is
                % public
                if isPublic
                    umlCat = strrep(umlCat, ...
                        char(m2plantUML.Enums.AccessLevel.Public),...
                        ''...
                        );
                end % if sameAccessLevel
            end % if this.Sealed
            
            % Abstract
            if this.Abstract
                umlCat = sprintf('Abstract %s', umlCat);
                % remove public key word if both set and get access is
                % public
                if isPublic
                    umlCat = strrep(umlCat, ...
                        char(m2plantUML.Enums.AccessLevel.Public),...
                        ''...
                        );
                end % if sameAccessLevel
            end % if this.Abstract
            
            % Final adjustements %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            % remove trailing and leading whitespaces
            umlCat = strtrim(umlCat);
            if ~isempty(umlCat) && strcmp(umlCat(end), ',')
                umlCat = strtrim(umlCat(1:end-1));
            end
            
        end % function umlCat = getCategoryUML(this)
        
    end %  methods (Access = protected)
    
    %% METHODS: STATIC
    methods (Static)
        
    end % methods (Static)
    
end % classdef Method < handle
