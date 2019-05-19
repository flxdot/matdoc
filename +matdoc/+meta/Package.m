classdef Package < matdoc.meta.super.Base & ...
        matdoc.uml.Package
   
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
    
    %% PROPERTIES: DEPENDENT, SETACCESS = PROTECTED
    properties (Dependent, SetAccess = protected)
        
        % A complete list of packages incl the ones int sub packages
        PackageListFlattend;
        
    end % properties (Dependent, SetAccess = protected)
    
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
        
        %% - val = get.PackageListFlattend()
        function val = get.PackageListFlattend(this)
            % function val = get.PackageListFlattend(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            val = getPackageListFlattend(this);
            
        end % function val = get.PackageListFlattend(this)
        
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
                this.PackageList = matdoc.meta.Package(this.metaObj.PackageList(1), this);
                for iPack = 2:length(this.metaObj.PackageList)
                    this.PackageList(iPack) = matdoc.meta.Package(this.metaObj.PackageList(iPack), this);
                end % for iPack = 2:length(this.metaObj.PackageList)
            end % if ~isempty(this.metaObj.PackageList)
            
            % ClassList %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if ~isempty(this.metaObj.ClassList)
                this.ClassList = matdoc.meta.Class(this.metaObj.ClassList(1), this);
                for iPack = 2:length(this.metaObj.ClassList)
                    this.ClassList(iPack) = matdoc.meta.Class(this.metaObj.ClassList(iPack), this);
                end % for iPack = 2:length(this.metaObj.ClassList)
            end % if ~isempty(this.metaObj.ClassList)
            
            % FunctionList %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if ~isempty(this.metaObj.FunctionList)
                this.FunctionList = matdoc.meta.Method(this.metaObj.FunctionList(1), this);
                for iPack = 2:length(this.metaObj.FunctionList)
                    this.FunctionList(iPack) = matdoc.meta.Method(this.metaObj.FunctionList(iPack), this);
                end % for iPack = 2:length(this.metaObj.ClassList)
            end % if ~isempty(this.metaObj.ClassList)
            
        end % function walkMeta(this)
        
        %% - val = getPackageListFlattend(this)
        function val = getPackageListFlattend(this)
            % function val = getPackageListFlattend(this)
            %
            % return as a list of all supbpackages including their
            % subpackages
            
            val = this.PackageList;
            for iPack = 1:length(val)
                val = horzcat(...
                    val,...
                    this.PackageList(iPack).PackageListFlattend...
                    );
            end % for iSup = 1:length(val)
            
            % keep only distinct items
            if length(val) > 1
                val = unique(val);
            end
            
        end % function val = getPackageListFlattend(this)
        
    end %  methods (Access = protected)
    
    %% METHODS: STATIC
    methods (Static)
        
    end % methods (Static)
    
end % classdef Package < handle
