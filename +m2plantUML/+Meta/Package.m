classdef Package < m2plantUML.Meta.Super.Meta
   
    %% PROPERTIES: PUBLIC
    properties
        
    end % properties
    
    %% PROPERTIES: SETACCESS = PROTECTED
    properties (SetAccess = protected)
        
        % The name of the package
        Name;
        
        % A list of classes of this package
        ClassList;
        
        % A list of function of this package
        FunctionList;
        
        % A list of packages within this package
        PackageList;
        
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
        function this = Package(metaObj, parent)
            % function this = Package(metaObj)
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
        
    end % methods
    
    %% METHODS: PROTECTED
    methods (Access = protected)
        
        %% - walkMeta()
        function walkMeta(this)
            % function walkMeta(this)
            %
            % This method will make sure the sub meta classes of the
            % metaObj are also wrapped by the meta classes of this package.
            
            % PackageList %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if ~isempty(this.metaObj.PackageList)
                this.PackageList = m2plantUML.Meta.Package(this.metaObj.PackageList(1), this);
                for iPack = 2:length(this.metaObj.PackageList)
                    this.PackageList(iPack) = m2plantUML.Meta.Package(this.metaObj.PackageList(iPack), this);
                end % for iPack = 2:length(this.metaObj.PackageList)
            end % if ~isempty(this.metaObj.PackageList)
            
            % ClassList %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if ~isempty(this.metaObj.ClassList)
                this.ClassList = m2plantUML.Meta.Class(this.metaObj.ClassList(1), this);
                for iPack = 2:length(this.metaObj.ClassList)
                    this.ClassList(iPack) = m2plantUML.Meta.Class(this.metaObj.ClassList(iPack), this);
                end % for iPack = 2:length(this.metaObj.ClassList)
            end % if ~isempty(this.metaObj.ClassList)
            
            % FunctionList %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if ~isempty(this.metaObj.FunctionList)
                this.FunctionList = m2plantUML.Meta.Method(this.metaObj.FunctionList(1), this);
                for iPack = 2:length(this.metaObj.FunctionList)
                    this.FunctionList(iPack) = m2plantUML.Meta.Method(this.metaObj.FunctionList(iPack), this);
                end % for iPack = 2:length(this.metaObj.ClassList)
            end % if ~isempty(this.metaObj.ClassList)
            
        end % function walkMeta(this)
        
        %% - umlStr = getPlantUML()
        function umlStr = getPlantUML(this)
            % function umlStr = getPlantUML(this)
            %
            % Returns the plantUML representation of this meta object.
            % Note: This method will be called by the getter of the
            % plantUML property of the m2plantUML.Meta.Super.Meta.
            
            umlStr = '';
            
            % get all classes contained by this package %%%%%%%%%%%%%%%%%%%
            for iObj = 1:length(this.ClassList)
                umlStr = sprintf('%s\n\n%s', umlStr, this.ClassList(iObj).plantUML);
            end % for iObj = 1:length(this.ClassList)
            
        end % function umlStr = getPlantUML(this)
        
    end %  methods (Access = protected)
    
    %% METHODS: STATIC
    methods (Static)
        
    end % methods (Static)
    
end % classdef Package < handle
