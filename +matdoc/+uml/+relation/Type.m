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
            
            % Left Arrow %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            % Right Arrow %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            % Body %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            % Create Instance of class %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            theType = matdoc.uml.relation.Type();
            
        end % function theType = fromStr(string)
        
    end % methods (Static)
    
end % classdef Type < handle