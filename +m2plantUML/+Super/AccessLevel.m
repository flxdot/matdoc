classdef AccessLevel < uint32
    % AccessLevel Defines the type of mold
    %
    %   Supported types are
    %    - Public
    %    - Protected
    %    - Private
    %
    %   If you want to obtain this enum based on a value please check the
    %   docs of following static methods:
    %     - enum = from(val)
    %     - enum = fromNum(val)
    %     - enum = fromStr(val)
    %
    
    %% ENUMERATION
    enumeration
        
        % Public
        Public    (0)
        % Protected
        Protected (1)
        % Private
        Private   (2)
        
    end % enumeration
    
    %% METHODS: PUBLIC
    methods
        
        %% - isEqual = eq(this, other)
        function isEqual = eq(this, other)
            % function isEqual = eq(this, other)
            %
            % Compares the enum to the other object
            
            try
                isEqual = double(m2plantUML.Super.AccessLevel.from(this)) == double(m2plantUML.Super.AccessLevel.from(other));
            catch ex
                switch ex.identifier
                    case 'm2plantUML:Super:AccessLevel:from:TypeError'
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
                isEqual = double(m2plantUML.Super.AccessLevel.from(this)) ~= double(m2plantUML.Super.AccessLevel.from(other));
            catch ex
                switch ex.identifier
                    case 'm2plantUML:Super:AccessLevel:from:TypeError'
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
            % - m2plantUML.Super.AccessLevel
            % - string          see method: fromNum
            % - numerical       see method: fromStr
            %
            % Following input will yield:
            % 
            %  Enum      | Numeric | String
            % ===========|=========|========================
            %  Public    |    0    | 'Public'
            %  Protected |    1    | 'Protected'
            %  Private   |    2    | 'Private'
            %
            
            % determine the type of the input
            if isa(val, 'm2plantUML.Super.AccessLevel')
                enum = val;
            elseif isnumeric(val)
                enum = m2plantUML.Super.AccessLevel.fromNum(val);
            elseif ischar(val)
                enum = m2plantUML.Super.AccessLevel.fromStr(val);
            else
                error('m2plantUML:Super:AccessLevel:from:TypeError',...
                    'Can not build enum from %s. Please have a look at the doc:\n\n%s',...
                    class(val), help('m2plantUML.Super.AccessLevel'))
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
            %  Public    |    0
            %  Protected |    1
            %  Private   |    2
            
            % check data type
            if ~isnumeric(val)
                error('m2plantUML:Super:AccessLevel:fromNum:TypeError',...
                    'Can not build enum from %s. Please have a look at the doc:\n\n%s',...
                    class(val), help('m2plantUML.Super.AccessLevel.fromNum'))
            end % if ~isnumeric(val)
            
            % get the enum
            switch val
                case 0 % Public
                    enum  = m2plantUML.Super.AccessLevel.Public;
                case 1 % Protected
                    enum  = m2plantUML.Super.AccessLevel.Protected;
                case 2 % Private
                    enum  = m2plantUML.Super.AccessLevel.Private;
                otherwise % find closest match
                    % fetch all names of the LogLevel
                    avTypes = enumeration('m2plantUML.Super.AccessLevel');
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
            %  Public    | 'Public'
            %  Protected | 'Protected'
            %  Private   | 'Private'
            
            % check data type
            if ~ischar(val)
                error('m2plantUML:Super:AccessLevel:fromStr:TypeError',...
                    'Can not build enum from {}. Please have a look at the doc:\n\n%s',...
                    class(val), help('m2plantUML.Super.AccessLevel'));
            end % if ~isnumeric(val)
            
            % get the enum
            switch lower(val)
                case 'public' % Public
                    enum  = m2plantUML.Super.AccessLevel.Public;
                case 'protected' % Protected
                    enum  = m2plantUML.Super.AccessLevel.Protected;
                case 'private' % Private
                    enum  = m2plantUML.Super.AccessLevel.Private;
                otherwise % find closest match
                    error('m2plantUML:Super:AccessLevel:fromStr:ValueError',...
                    'Can not find exact enum value for %s. Please have a look at the doc:\n\n%s',...
                    val, help('m2plantUML.Super.AccessLevel.fromStr'));
            end % switch val
            
        end % function enum = fromStr(val)
        
    end % methods (Static)
    
end % classdef AccessLevel < uint32