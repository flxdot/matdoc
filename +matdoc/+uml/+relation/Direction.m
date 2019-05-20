classdef Direction < uint32
    % Direction Defines the type of mold
    %
    %   Supported types are
    %    - None
    %    - From
    %    - To
    %    - Bidirectional
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
        None          (0)
        % From
        From          (1)
        % To
        To            (2)
        % Bidirectional
        Bidirectional (3)
        
    end % enumeration
    
    %% METHODS: PUBLIC
    methods
        
        %% - isEqual = eq(this, other)
        function isEqual = eq(this, other)
            % function isEqual = eq(this, other)
            %
            % Compares the enum to the other object
            
            try
                isEqual = double(matdoc.uml.relation.Direction.from(this)) == double(matdoc.uml.relation.Direction.from(other));
            catch ex
                switch ex.identifier
                    case 'matdoc:uml:relation:Direction:from:TypeError'
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
                isEqual = double(matdoc.uml.relation.Direction.from(this)) ~= double(matdoc.uml.relation.Direction.from(other));
            catch ex
                switch ex.identifier
                    case 'matdoc:uml:relation:Direction:from:TypeError'
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
            % Call to obtain Direction enumeration based on either of
            % the following data types:
            % - matdoc.uml.relation.Direction
            % - string          see method: fromNum
            % - numerical       see method: fromStr
            %
            % Following input will yield:
            % 
            %  Enum          | Numeric | String
            % ===============|=========|========================
            %  None          |    0    | 'None'
            %  From          |    1    | 'From', 'Left'
            %  To            |    2    | 'To', 'Right'
            %  Bidirectional |    3    | 'Bidirectional', 'FromTo', 'ToFrom', 'Both'
            %
            
            % determine the type of the input
            if isa(val, 'matdoc.uml.relation.Direction')
                enum = val;
            elseif isnumeric(val)
                enum = matdoc.uml.relation.Direction.fromNum(val);
            elseif ischar(val)
                enum = matdoc.uml.relation.Direction.fromStr(val);
            else
                error('matdoc:uml:relation:Direction:from:TypeError',...
                    'Can not build enum from %s. Please have a look at the doc:\n\n%s',...
                    class(val), help('matdoc.uml.relation.Direction'))
            end
            
        end % function enum = from(val)
        
        %% - enum = fromNum(val)
        function enum = fromNum(val)
            % function enum = fromNum(val)
            %
            % Call to obtain Direction enumeration based on the given
            % numeric value.
            %
            %  Enum          | Numeric
            % ===============|=========
            %  None          |    0
            %  From          |    1
            %  To            |    2
            %  Bidirectional |    3
            
            % check data type
            if ~isnumeric(val)
                error('matdoc:uml:relation:Direction:fromNum:TypeError',...
                    'Can not build enum from %s. Please have a look at the doc:\n\n%s',...
                    class(val), help('matdoc.uml.relation.Direction.fromNum'))
            end % if ~isnumeric(val)
            
            % get the enum
            switch val
                case 0 % None
                    enum  = matdoc.uml.relation.Direction.None;
                case 1 % From
                    enum  = matdoc.uml.relation.Direction.From;
                case 2 % To
                    enum  = matdoc.uml.relation.Direction.To;
                case 3 % Bidirectional
                    enum  = matdoc.uml.relation.Direction.Bidirectional;
                otherwise % find closest match
                    % fetch all names of the LogLevel
                    avTypes = enumeration('matdoc.uml.relation.Direction');
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
            % Call to obtain Direction enumeration based on the given
            % numeric value.
            %
            % Input is evaluated case insensitive
            % 
            %  Enum          | String
            % ===============|=========================
            %  None          | 'None'
            %  From          | 'From', 'Left'
            %  To            | 'To', 'Right'
            %  Bidirectional | 'Bidirectional', 'FromTo', 'ToFrom', 'Both'
            
            % check data type
            if ~ischar(val)
                error('matdoc:uml:relation:Direction:fromStr:TypeError',...
                    'Can not build enum from {}. Please have a look at the doc:\n\n%s',...
                    class(val), help('matdoc.uml.relation.Direction'));
            end % if ~isnumeric(val)
            
            % get the enum
            switch lower(val)
                case 'none' % None
                    enum  = matdoc.uml.relation.Direction.None;
                case {'from', 'left'} % From
                    enum  = matdoc.uml.relation.Direction.From;
                case {'to', 'right'} % To
                    enum  = matdoc.uml.relation.Direction.To;
                case {'bidirectional', 'fromto', 'tofrom', 'both'} % Bidirectional
                    enum  = matdoc.uml.relation.Direction.Bidirectional;
                otherwise % find closest match
                    error('matdoc:uml:relation:Direction:fromStr:ValueError',...
                    'Can not find exact enum value for %s. Please have a look at the doc:\n\n%s',...
                    val, help('matdoc.uml.relation.Direction.fromStr'));
            end % switch val
            
        end % function enum = fromStr(val)
        
    end % methods (Static)
    
end % classdef Direction < uint32