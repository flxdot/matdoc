classdef Head < uint32
    % Head Defines the type of mold
    %
    %   Supported types are
    %    - None
    %    - Triangle
    %    - Diamond
    %    - DiamondFilled
    %    - Pointer
    %    - Square
    %    - X
    %    - OpenTriangle
    %    - Plus
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
        % Triangle
        Triangle      (1)
        % Diamond
        Diamond       (2)
        % DiamondFilled
        DiamondFilled (3)
        % Pointer
        Pointer       (4)
        % Square
        Square        (5)
        % X
        X             (6)
        % OpenTriangle
        OpenTriangle  (7)
        % Plus
        Plus          (8)
        
    end % enumeration
    
    %% METHODS: PUBLIC
    methods
        
        %% - umlStr = getPlantUML(direction)
        function umlStr = getPlantUML(this, direction)
            % function umlStr = getPlantUML(this, direction)
            %
            % Returns the plantUML representation of this meta object.
            % Note: This method will be called by the getter of the
            % plantUML property of the matdoc.uml.super.Base.
            
            % build the UML string %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            switch this
                case matdoc.uml.relation.arrow.Head.Triangle
                    switch direction
                        case matdoc.uml.relation.Direction.From
                            umlStr = '<|';
                        case matdoc.uml.relation.Direction.To
                            umlStr = '|>';
                        otherwise
                            error('matdoc:uml:relation:arrow:Head:getPlantUML:ValueError',...
                                'Input direction has to be either matdoc.uml.relation.Direction.From or matdoc.uml.relation.Direction.To.');
                    end % switch direction
                case matdoc.uml.relation.arrow.Head.Diamond
                    umlStr = 'o';
                case matdoc.uml.relation.arrow.Head.DiamondFilled
                    umlStr = '*';
                case  matdoc.uml.relation.arrow.Head.Pointer
                    switch direction
                        case matdoc.uml.relation.Direction.From
                            umlStr = '<';
                        case matdoc.uml.relation.Direction.To
                            umlStr = '>';
                        otherwise
                            error('matdoc:uml:relation:arrow:Head:getPlantUML:ValueError',...
                                'Input direction has to be either matdoc.uml.relation.Direction.From or matdoc.uml.relation.Direction.To.');
                    end % switch direction
                case matdoc.uml.relation.arrow.Head.Square
                    umlStr = '#';
                case matdoc.uml.relation.arrow.Head.X
                    umlStr = 'x';
                case matdoc.uml.relation.arrow.Head.OpenTriangle
                    switch direction
                        case matdoc.uml.relation.Direction.From
                            umlStr = '}';
                        case matdoc.uml.relation.Direction.To
                            umlStr = '{';
                        otherwise
                            error('matdoc:uml:relation:arrow:Head:getPlantUML:ValueError',...
                                'Input direction has to be either matdoc.uml.relation.Direction.From or matdoc.uml.relation.Direction.To.');
                    end % switch direction
                case matdoc.uml.relation.arrow.Head.Plus
                    umlStr = '+';
                otherwise  % None
                    umlStr = '';
            end % switch val
            
        end % function umlStr = getPlantUML(this, direction)
        
        %% - isEqual = eq(this, other)
        function isEqual = eq(this, other)
            % function isEqual = eq(this, other)
            %
            % Compares the enum to the other object
            
            try
                isEqual = double(matdoc.uml.relation.arrow.Head.from(this)) == double(matdoc.uml.relation.arrow.Head.from(other));
            catch ex
                switch ex.identifier
                    case 'matdoc:uml:relation:arrow:Head:from:TypeError'
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
                isEqual = double(matdoc.uml.relation.arrow.Head.from(this)) ~= double(matdoc.uml.relation.arrow.Head.from(other));
            catch ex
                switch ex.identifier
                    case 'matdoc:uml:relation:arrow:Head:from:TypeError'
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
            % Call to obtain Head enumeration based on either of
            % the following data types:
            % - matdoc.uml.relation.Head
            % - string          see method: fromNum
            % - numerical       see method: fromStr
            %
            % Following input will yield:
            % 
            %  Enum          | Numeric | String
            % ===============|=========|========================
            %  None          |    0    | 'None'
            %  Triangle      |    1    | 'Triangle', '<|', '|>', '^'
            %  Diamond       |    2    | 'Diamond', 'o'
            %  DiamondFilled |    3    | 'DiamondFilled', '*'
            %  Pointer       |    4    | 'Pointer', '<', '>'
            %  Square        |    5    | 'Square', '#'
            %  X             |    6    | 'X'
            %  OpenTriangle  |    7    | 'OpenTriangle', '{', '}'
            %  Plus          |    8    | 'Plus', '+'
            %
            
            % determine the type of the input
            if isa(val, 'matdoc.uml.relation.arrow.Head')
                enum = val;
            elseif isnumeric(val)
                enum = matdoc.uml.relation.arrow.Head.fromNum(val);
            elseif ischar(val)
                enum = matdoc.uml.relation.arrow.Head.fromStr(val);
            else
                error('matdoc:uml:relation:arrow:Head:from:TypeError',...
                    'Can not build enum from %s. Please have a look at the doc:\n\n%s',...
                    class(val), help('matdoc.uml.relation.Head'))
            end
            
        end % function enum = from(val)
        
        %% - enum = fromNum(val)
        function enum = fromNum(val)
            % function enum = fromNum(val)
            %
            % Call to obtain Head enumeration based on the given
            % numeric value.
            %
            %  Enum          | Numeric
            % ===============|=========
            %  None          |    0
            %  Triangle      |    1
            %  Diamond       |    2
            %  DiamondFilled |    3
            %  Pointer       |    4
            %  Square        |    5
            %  X             |    6
            %  OpenTriangle  |    7
            %  Plus          |    8
            
            % check data type
            if ~isnumeric(val)
                error('matdoc:uml:relation:arrow:Head:fromNum:TypeError',...
                    'Can not build enum from %s. Please have a look at the doc:\n\n%s',...
                    class(val), help('matdoc.uml.relation.arrow.Head.fromNum'))
            end % if ~isnumeric(val)
            
            % get the enum
            switch val
                case 0 % None
                    enum  = matdoc.uml.relation.arrow.Head.None;
                case 1 % Triangle
                    enum  = matdoc.uml.relation.arrow.Head.Triangle;
                case 2 % Diamond
                    enum  = matdoc.uml.relation.arrow.Head.Diamond;
                case 3 % DiamondFilled
                    enum  = matdoc.uml.relation.arrow.Head.DiamondFilled;
                case 4 % Pointer
                    enum  = matdoc.uml.relation.arrow.Head.Pointer;
                case 5 % Square
                    enum  = matdoc.uml.relation.arrow.Head.Square;
                case 6 % X
                    enum  = matdoc.uml.relation.arrow.Head.X;
                case 7 % OpenTriangle
                    enum  = matdoc.uml.relation.arrow.Head.OpenTriangle;
                case 8 % Plus
                    enum  = matdoc.uml.relation.arrow.Head.Plus;
                otherwise % find closest match
                    % fetch all names of the LogLevel
                    avTypes = enumeration('matdoc.uml.relation.Head');
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
            % Call to obtain Head enumeration based on the given
            % numeric value.
            %
            % Input is evaluated case insensitive
            % 
            %  Enum          | String
            % ===============|=========================
            %  None          | 'None'
            %  Triangle      | 'Triangle', '<|', '|>'
            %  Diamond       | 'Diamond', 'o'
            %  DiamondFilled | 'DiamondFilled', '*'
            %  Pointer       | 'Pointer', '<', '>'
            %  Square        | 'Square', '#'
            %  X             | 'X'
            %  OpenTriangle  | 'OpenTriangle', '{', '}'
            %  Plus          | 'Plus', '+'
            
            % check data type
            if ~ischar(val)
                error('matdoc:uml:relation:arrow:Head:fromStr:TypeError',...
                    'Can not build enum from {}. Please have a look at the doc:\n\n%s',...
                    class(val), help('matdoc.uml.relation.Head'));
            end % if ~isnumeric(val)
            
            % get the enum
            switch lower(val)
                case {'triangle', '<|', '|>', '^'} % Triangle
                    enum  = matdoc.uml.relation.arrow.Head.Triangle;
                case {'diamond', 'o'}  % Diamond
                    enum  = matdoc.uml.relation.arrow.Head.Diamond;
                case {'diamondfilled', '*'} % DiamondFilled
                    enum  = matdoc.uml.relation.arrow.Head.DiamondFilled;
                case {'pointer', '<', '>'} % Pointer
                    enum  = matdoc.uml.relation.arrow.Head.Pointer;
                case {'square', '#'} % Square
                    enum  = matdoc.uml.relation.arrow.Head.Square;
                case 'x',  % X
                    enum  = matdoc.uml.relation.arrow.Head.X;
                case {'opentriangle', '{', '}'} % OpenTriangle
                    enum  = matdoc.uml.relation.arrow.Head.OpenTriangle;
                case {'plus', '+'} % Plus
                    enum  = matdoc.uml.relation.arrow.Head.Plus;
                otherwise  % None
                    enum  = matdoc.uml.relation.arrow.Head.None;
            end % switch val
            
        end % function enum = fromStr(val)
        
    end % methods (Static)
    
end % classdef Head < uint32
