classdef Body < uint32
    % Body Defines the type of mold
    %
    %   Supported types are
    %    - Solid
    %    - Dashed
    %
    %   If you want to obtain this enum based on a value please check the
    %   docs of following static methods:
    %     - enum = from(val)
    %     - enum = fromNum(val)
    %     - enum = fromStr(val)
    %
    
    %% ENUMERATION
    enumeration
        
        % Solid
        Solid  (0)
        % Dashed
        Dashed (1)
        
    end % enumeration
    
    %% METHODS: PUBLIC
    methods
        
        %% - umlStr = getPlantUML()
        function umlStr = getPlantUML(this)
            % function umlStr = getPlantUML(this)
            %
            % Returns the plantUML representation of this meta object.
            % Note: This method will be called by the getter of the
            % plantUML property of the matdoc.uml.super.Base.
            
            % build the UML string %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            switch this
                case matdoc.uml.relation.arrow.Body.Dashed
                    umlStr = '..';
                otherwise
                    umlStr = '--';
            end % switch val
            
        end % function umlStr = getPlantUML(this)
        
        %% - isEqual = eq(this, other)
        function isEqual = eq(this, other)
            % function isEqual = eq(this, other)
            %
            % Compares the enum to the other object
            
            try
                isEqual = double(matdoc.uml.relation.arrow.Body.from(this)) == double(matdoc.uml.relation.arrow.Body.from(other));
            catch ex
                switch ex.identifier
                    case 'matdoc:uml:relation:arrow:Body:from:TypeError'
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
                isEqual = double(matdoc.uml.relation.arrow.Body.from(this)) ~= double(matdoc.uml.relation.arrow.Body.from(other));
            catch ex
                switch ex.identifier
                    case 'matdoc:uml:relation:arrow:Body:from:TypeError'
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
            % Call to obtain Body enumeration based on either of
            % the following data types:
            % - matdoc.uml.relation.Body
            % - string          see method: fromNum
            % - numerical       see method: fromStr
            %
            % Following input will yield:
            % 
            %  Enum   | Numeric | String
            % ========|=========|========================
            %  Solid  |    0    | 'Solid', '-', '--'
            %  Dashed |    1    | 'Dashed', '.', '..'
            %
            
            % determine the type of the input
            if isa(val, 'matdoc.uml.relation.arrow.Body')
                enum = val;
            elseif isnumeric(val)
                enum = matdoc.uml.relation.arrow.Body.fromNum(val);
            elseif ischar(val)
                enum = matdoc.uml.relation.arrow.Body.fromStr(val);
            else
                error('matdoc:uml:relation:arrow:Body:from:TypeError',...
                    'Can not build enum from %s. Please have a look at the doc:\n\n%s',...
                    class(val), help('matdoc.uml.relation.Body'))
            end
            
        end % function enum = from(val)
        
        %% - enum = fromNum(val)
        function enum = fromNum(val)
            % function enum = fromNum(val)
            %
            % Call to obtain Body enumeration based on the given
            % numeric value.
            %
            %  Enum   | Numeric
            % ========|=========
            %  Solid  |    0
            %  Dashed |    1
            
            % check data type
            if ~isnumeric(val)
                error('matdoc:uml:relation:arrow:Body:fromNum:TypeError',...
                    'Can not build enum from %s. Please have a look at the doc:\n\n%s',...
                    class(val), help('matdoc.uml.relation.arrow.Body.fromNum'))
            end % if ~isnumeric(val)
            
            % get the enum
            switch val
                case 0 % Solid
                    enum  = matdoc.uml.relation.arrow.Body.Solid;
                case 1 % Dashed
                    enum  = matdoc.uml.relation.arrow.Body.Dashed;
                otherwise % find closest match
                    % fetch all names of the LogLevel
                    avTypes = enumeration('matdoc.uml.relation.Body');
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
            % Call to obtain Body enumeration based on the given
            % numeric value.
            %
            % Input is evaluated case insensitive
            % 
            %  Enum   | String
            % ========|=========================
            %  Solid  | 'Solid', '-', '--'
            %  Dashed | 'Dashed', '.', '..'
            
            % check data type
            if ~ischar(val)
                error('matdoc:uml:relation:arrow:Body:fromStr:TypeError',...
                    'Can not build enum from {}. Please have a look at the doc:\n\n%s',...
                    class(val), help('matdoc.uml.relation.Body'));
            end % if ~isnumeric(val)
            
            % get the enum
            switch lower(val)
                case {'solid', '-', '--'} % Solid
                    enum  = matdoc.uml.relation.arrow.Body.Solid;
                case {'dashed', '.', '..'} % Dashed
                    enum  = matdoc.uml.relation.arrow.Body.Dashed;
                otherwise % find closest match
                    error('matdoc:uml:relation:arrow:Body:fromStr:ValueError',...
                    'Can not find exact enum value for %s. Please have a look at the doc:\n\n%s',...
                    val, help('matdoc.uml.relation.arrow.Body.fromStr'));
            end % switch val
            
        end % function enum = fromStr(val)
        
    end % methods (Static)
    
end % classdef Body < uint32
