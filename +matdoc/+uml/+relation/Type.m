classdef Type < handle
   
    %% PROPERTIES: PUBLIC
    properties
        
        % Left tip of the relation arrow
        LeftTip;
        
        % Left tip of the relation arrow
        RightTip;
        
        % Body of the arrow
        Body;
        
    end % properties
    
    %% PROPERTIES: SETACCESS = PROTECTED
    properties (SetAccess = protected)
        
        % Direction of the relation
        Direction;
        
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
        function this = Type(LeftTip_, RightTip_, Body_)
            % function this = Type(LeftTip_, RightTip_, Body_)
            %
            % LeftTip_: The type of arrow head on the left tip
            % RightTip_: The type of arrow head on the right tip
            % Body_: The type of body
            
            this.LeftTip = LeftTip_;
            this.RightTip = RightTip_;
            this.Body = Body_;
            
        end % function this = ColumnDataDisplay()
        
        %% - umlStr = getPlantUML(ident_)
        function umlStr = getPlantUML(this, ident_)
            % function umlStr = getPlantUML(this, ident_)
            %
            % Returns the plantUML representation of this meta object.
            % Note: This method will be called by the getter of the
            % plantUML property of the matdoc.uml.super.Base.
            
            % process input %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if nargin < 2 || isempty(ident_)
                ident_ = 0;
            end % if nargin < 2 || isempty(ident_)
            if ~isnumeric(ident_)
                error('matdoc:uml:Package:getPlantUML:TypeError',...
                    'Input ident_ has to be numeric.');
            end % if ~isnumeric(ident_)
            
            % make sure its a scalar integer value
            ident_ = abs(round(ident_(1)));
            
            % build the identStr
            identStr = char(32 * ones(1, ident_));
            
            % build the UML string %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            switch this.Direction
                case matdoc.uml.relation.Direction.To
                    umlStr = sprintf('%s%s',...
                        this.Body.getPlantUML(),...
                        this.RightTip.getPlantUML(matdoc.uml.relation.Direction.To)...
                        );
                case matdoc.uml.relation.Direction.From
                    umlStr = sprintf('%s%s',...
                        this.LeftTip.getPlantUML(matdoc.uml.relation.Direction.From),...
                        this.Body.getPlantUML()...
                        );
                case matdoc.uml.relation.Direction.Bidirectional
                    umlStr = sprintf('%s%s%s',...
                        this.LeftTip.getPlantUML(matdoc.uml.relation.Direction.From),...
                        this.Body.getPlantUML(),...
                        this.RightTip.getPlantUML(matdoc.uml.relation.Direction.To)...
                        );
                otherwise
                    umlStr = this.Body.getPlantUML();
            end % switch val
            
            % add the indentation
            umlStr = sprintf('%s%s', identStr, umlStr);
            
        end % function umlStr = getPlantUML(this, direction)
        
        %% - val = get.Direction()
        function val = get.Direction(this)
            % function val = get.Direction(this)
            %
            % The getter method will return the private member of the property
            % set.
            
            % check the arrow tips on both ends to determine the direction
            % of the relation
            leftNone = this.LeftTip == matdoc.uml.relation.arrow.Head.None;
            rightNone = this.RightTip == matdoc.uml.relation.arrow.Head.None;
            
            if leftNone && rightNone
                val = matdoc.uml.relation.Direction.None;
            elseif leftNone 
                val = matdoc.uml.relation.Direction.To;
            elseif rightNone
                val = matdoc.uml.relation.Direction.From;
            else
                val = matdoc.uml.relation.Direction.Bidirectional;
            end % if leftNone && rightNone
            
        end % function val = get.Direction(this)

    end % methods
    
    %% METHODS: PROTECTED
    methods (Access = protected)
        
    end % methods (Access = protected)
    
    %% METHODS: STATIC
    methods (Static)
        
        %% - theType = fromStr(string)
        function theType = fromStr(string)
            % function theType = fromStr(string)
            %
            % Creates an instance of the type class based on the passed
            % string argument.
            
            % is realy a string?
            if ~ischar(string)
                error('matdoc:uml:relation:Type:fromStr:FormatError',...
                    'This function is desined to evaluate strings (as the name suggests). You where trying to call it with an argument of type ''%s''. RTMF! :-)', class(string));
            end % if ~ischar(string)
            
            % Seperate the body from the arrows. The body will only contain
            % '-' or '.' characters
            Arrows = strsplit(string, {'.', '-'}, 'CollapseDelimiters', false);
            
            % Left Arrow %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            try
                theLeftTip = matdoc.uml.relation.arrow.Head.fromStr(Arrows{1});
            catch ex
                switch ex.identifier
                    case 'matdoc:uml:relation:arrow:Head:fromStr:ValueError'
                        error('matdoc:uml:relation:Type:fromStr:FormatError',...
                            'Could not figure out what the right tip of the relation ''%s'' is. Syntax error?', string);
                    otherwise
                        rethrow(ex);
                end % switch ex.identifier
            end % try
            
            % Right Arrow %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            try
                theRightTip = matdoc.uml.relation.arrow.Head.fromStr(Arrows{end});
            catch ex
                switch ex.identifier
                    case 'matdoc:uml:relation:arrow:Head:fromStr:ValueError'
                        error('matdoc:uml:relation:Type:fromStr:FormatError',...
                            'Could not figure out what the left tip of the relation ''%s'' is. Syntax error?', string);
                    otherwise
                        rethrow(ex);
                end % switch ex.identifier
            end % try
            
            % Body %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            BodyStr = strrep(strrep(string, Arrows{1}, ''), Arrows{end}, '');
            try
                theBody = matdoc.uml.relation.arrow.Body.fromStr(BodyStr);
            catch ex
                switch ex.identifier
                    case 'matdoc:uml:relation:arrow:Body:fromStr:ValueError'
                        error('matdoc:uml:relation:Type:fromStr:FormatError',...
                            'Could not figure out what the body of the relation ''%s'' is. Syntax error?', string);
                    otherwise
                        rethrow(ex);
                end % switch ex.identifier
            end % try
            
            % Create Instance of class %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            theType = matdoc.uml.relation.Type(...
                theLeftTip,... LeftTip_
                theRightTip,... RightTip_
                theBody... Body_
                );
            
        end % function theType = fromStr(string)
        
    end % methods (Static)
    
end % classdef Type < handle