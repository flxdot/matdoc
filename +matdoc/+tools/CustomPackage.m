classdef CustomPackage < matdoc.super.Base &...
        matdoc.super.WithNameRaw & ...
        matdoc.super.WithAlias & ...
        matdoc.uml.CustomPackage
   
    %% PROPERTIES: PUBLIC
    properties
        
        
    end % properties
    
    %% PROPERTIES: SETACCESS = PROTECTED
    properties (SetAccess = protected)
        
        % Name of the package
        Name;
        
        % Array of matdoc.meta.Class which are contained in the current
        % package
        ClassList = matdoc.meta.Class.empty(1, 0);
        
        % Array of matdoc.tools.CustomPackage which are contained in the
        % current package
        PackageList = matdoc.tools.CustomPackage.empty(1, 0);
        
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
        function this = CustomPackage(parent, Name_)
            % function this = CustomPackage(parent, Name_)
            %
            %
            
            this = this@matdoc.super.Base(parent);
            
            if nargin < 1
                Name_ = '';
            end % if nargin < 1
            
            this.Name = Name_;
            
            % set the RawName and the Alias
            setNameRaw(this);
            setAlias(this);
            
        end % function this = ColumnDataDisplay()
        
        %% - addClass(MetaClass_)
        function addClass(this, MetaClass_)
            % function addClass(this, MetaClass_)
            %
            % Add an instance of matdoc.meta.Class to the ClassList.
            
            if ~isa(MetaClass_, 'matdoc.meta.Class')
                error('matdoc:tools:CustomPackage:addClass:TypeError',...
                'Can not add objects of type ''%s'' to ClassList. Please add an object of type ''matdoc.meta.Class''.',...
                class(MetaClass_));
            end % if ~isa(MetaClass_, 'matdoc.meta.Class')
            
            % add the class if not already in list
            if ~any(strcmp({this.ClassList(:).Name}, MetaClass_.Name))
                % add the class list
                this.ClassList(1, end + 1) = MetaClass_;
                % sort the list by name
                sort(this.ClassList);
            end % if ~any([this.ClassList == MetaClass_])
            
        end % function addClass(this, MetaClass_)
        
        %% - hCustomPackge = getPackage(PackageName_)
        function hCustomPackge = getPackage(this, PackageName_)
            % function getPackage(this, PackageName_)
            %
            % Returns the package with the requrestes PackageName_. If the
            % package does not exist, it will be created.
            
            if ~ischar(PackageName_) || isempty(PackageName_)
                error('matdoc:tools:CustomPackage:addPackage:TypeError',...
                'The new package name has to be a non empty string. Was of type ''%s'' instead.',...
                class(PackageName_));
            end % if ~ischar(PackageName_) || isempty(PackageName_)
            
            % add the class if not already in list
            packIdx = strcmp({this.PackageList(:).Name}, PackageName_);
            if ~any(packIdx)
                % create new custom packge
                hCustomPackge = matdoc.tools.CustomPackage(this, PackageName_);
                % add the class list
                this.PackageList(1, end + 1) = hCustomPackge;
                % sort the list by name
                sort(this.PackageList);
            else % if ~any(packIdx)
                hCustomPackge = this.PackageList(packIdx);
            end % if ~any(packIdx)
            
        end % function hCustomPackge = addPackage(this, MetaClass_)
        
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
        
    end % methods
    
    %% METHODS: PROTECTED
    methods (Access = protected)
        
    end %  methods (Access = protected)
    
    %% METHODS: STATIC
    methods (Static)
        
    end % methods (Static)
    
end % classdef CustomPackage < handle