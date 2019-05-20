classdef AccessLevel < uint32
    % AccessLevel Defines the type of mold
    %
    %   Supported types are
    %    - None
    %    - Public
    %    - Protected
    %    - Private
    %    - Custom
    %
    %   If you want to obtain this enum based on a value please check the
    %   docs of following static methods:
    %     - enum = from(val)
    %     - enum = fromNum(val)
    %     - enum = fromStr(val)
    %
    
    %% ENUMERATION
    enumeration
        
        % None
        None      (0)
        % Public
        Public    (1)
        % Protected
        Protected (2)
        % Private
        Private   (3)
        % Custom
        Custom    (4)
        
    end % enumeration
    
    %% METHODS: PUBLIC
    methods
        
        %% - isEqual = eq(this, other)
        function isEqual = eq(this, other)
            % function isEqual = eq(this, other)
            %
            % Compares the enum to the other object
            
            try
                isEqual = double(matdoc.enums.AccessLevel.from(this)) == double(matdoc.enums.AccessLevel.from(other));
            catch ex
                switch ex.identifier
                    case 'matdoc:enums:AccessLevel:from:TypeError'
                        isEqual = false;
                    otherwise
                        rethrow(ex);
                end % switch ex.identifier
            end % try
            
        end % function isEqual = eq(this, other)
        
        %% - isEqual = ne(this, other)
        function isEqual = ne(this, other)
            % function isEqual = ne(this, other)
            %
            % Compares the enum to the other object
            
            try
                isEqual = double(matdoc.enums.AccessLevel.from(this)) ~= double(matdoc.enums.AccessLevel.from(other));
            catch ex
                switch ex.identifier
                    case 'matdoc:enums:AccessLevel:from:TypeError'
                        isEqual = false;
                    otherwise
                        rethrow(ex);
                end % switch ex.identifier
            end % try
            
        end % function isEqual = eq(this, other)
        
    end % methods
    
    %% METHODS: STATIC
    methods (Static)
        
        %% - enum = from(val)
        function enum = from(val)
            % function enum = from(val)
            %
            % Call to obtain AccessLevel enumeration based on either of
            % the following data types:
            % - matdoc.enums.AccessLevel
            % - string          see method: fromNum
            % - numerical       see method: fromStr
            %
            % Following input will yield:
            % 
            %  Enum      | Numeric | String
            % ===========|=========|========================
            %  None      |    0    | 'None'
            %  Public    |    1    | 'Public'
            %  Protected |    2    | 'Protected'
            %  Private   |    3    | 'Private'
            %  Custom    |    4    | any other string
            %
            
            % determine the type of the input
            if isa(val, 'matdoc.enums.AccessLevel')
                enum = val;
            elseif isnumeric(val)
                enum = matdoc.enums.AccessLevel.fromNum(val);
            elseif ischar(val)
                enum = matdoc.enums.AccessLevel.fromStr(val);
            elseif iscell(val)
                enum = matdoc.enums.AccessLevel.Custom;
            else
                error('matdoc:enums:AccessLevel:from:TypeError',...
                    'Can not build enum from %s. Please have a look at the doc:\n\n%s',...
                    class(val), help('matdoc.enums.AccessLevel'))
            end
            
        end % function enum = from(val)
        
        %% - enum = fromNum(val)
        function enum = fromNum(val)
            % function enum = fromNum(val)
            %
            % Call to obtain AccessLevel enumeration based on the given
            % numeric value.
            %
            %  Enum      | Numeric
            % ===========|=========
            %  None      |    0
            %  Public    |    1
            %  Protected |    2
            %  Private   |    3
            %  Custom    |    4
            
            % check data type
            if ~isnumeric(val)
                error('matdoc:enums:AccessLevel:fromNum:TypeError',...
                    'Can not build enum from %s. Please have a look at the doc:\n\n%s',...
                    class(val), help('matdoc.enums.AccessLevel.fromNum'))
            end % if ~isnumeric(val)
            
            % get the enum
            switch val
                case 0 % None
                    enum  = matdoc.enums.AccessLevel.None;
                case 1 % Public
                    enum  = matdoc.enums.AccessLevel.Public;
                case 2 % Protected
                    enum  = matdoc.enums.AccessLevel.Protected;
                case 3 % Private
                    enum  = matdoc.enums.AccessLevel.Private;
                case 4 % Custom
                    enum  = matdoc.enums.AccessLevel.Custom;
                otherwise % find closest match
                    % fetch all names of the LogLevel
                    avTypes = enumeration('matdoc.enums.AccessLevel');
                    % find the closest matching
                    avTypeValues = double(avTypes);
                    [~, idx] = min(abs(avTypeValues - val));
                    enum = avTypes(idx);
            end % switch val
            
        end % function enum = fromNum(val)
        
        %% - enum = fromStr(val)
        function enum = fromStr(val)
            % function enum = fromStr(val)
            %
            % Call to obtain AccessLevel enumeration based on the given
            % numeric value.
            %
            % Input is evaluated case insensitive
            % 
            %  Enum      | String
            % ===========|=========================
            %  None      | 'None'
            %  Public    | 'Public'
            %  Protected | 'Protected'
            %  Private   | 'Private'
            %  Custom    | any other string
            
            % check data type
            if ~ischar(val)
                error('matdoc:enums:AccessLevel:fromStr:TypeError',...
                    'Can not build enum from {}. Please have a look at the doc:\n\n%s',...
                    class(val), help('matdoc.enums.AccessLevel'));
            end % if ~isnumeric(val)
            
            % get the enum
            switch lower(val)
                case 'none' % None
                    enum  = matdoc.enums.AccessLevel.None;
                case 'public' % Public
                    enum  = matdoc.enums.AccessLevel.Public;
                case 'protected' % Protected
                    enum  = matdoc.enums.AccessLevel.Protected;
                case 'private' % Private
                    enum  = matdoc.enums.AccessLevel.Private;
                otherwise % Custom
                    enum  = matdoc.enums.AccessLevel.Custom;
            end % switch val
            
        end % function enum = fromStr(val)
        
    end % methods (Static)
    
end % classdef AccessLevel < uint32