classdef Relation < matdoc.uml.super.WithPlantUML
    % RELATION Represents a class relation
    % This class can be instanciated by the static methods from(string) or
    % with the constructor: Relation(LeftClass_, RelationType_, RightClass_, varargin)
    %
    % 
    % Following patterns may occure:
    % Class01 <|-- Class02
    % Class03 *-- Class04
    % Class05 o-- Class06
    % Class07 .. Class08
    % Class09 -- Class10
    % Class11 <|.. Class12
    % Class13 --> Class14
    % Class15 ..> Class16
    % Class17 ..|> Class18
    % Class19 <--* Class20
    % Class21 #-- Class22
    % Class23 x-- Class24
    % Class25 }-- Class26
    % Class27 +-- Class28
    % Class29 ^-- Class30
    %
    % Something more sophisticated
    % Class01 "1" *-- "many" Class02 : contains
    % Class03 o-- Class04 : aggregation
    % Class05 --> "1" Class06
    % Driver - Car : drives >
    % Car *- Wheel : have 4 >
    % Car -- Person : < owns
    %
    %
    % So the general pattern here is the following:
    % {LeftClassName} [optional]"{LeftAnnotation}" {RelationArrow} [optional]{"RightAnnotation"} {RightClassName} [optional]: {RelationAnnotation}
    %
    %% PROPERTIES: PUBLIC
    properties
        
        % The Name of the class on the left hand side of the relation
        LeftClassName;
        
        % The Name of the class on the right hand side of the relation
        RightClassName;
        
        % The type of the relation (represented by the RelationArrow)
        RelationType;
        
        % The annotation at the left end of the RelationArrow
        LeftAnnotation;
        
        % The annotation at the right end of the RelationArrow
        RightAnnotation;
        
        % The annotation displayed at the center of the RelationArrow
        RelationAnnotation;
        
    end % properties
    
    %% PROPERTIES: SETACCESS = PROTECTED
    properties (SetAccess = protected)
        
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
        function this = Relation(LeftClassName_, RelationType_, RightClassName_, varargin)
            % function this = Relation(LeftClassName_, RelationType_, RightClassName_, varargin)
            %
            % LeftClassName_: Name of the Class on the left side of the
            % relation
            %
            % RelationType_: Type of relation
            %
            % RightClassName_: Name of the Class on the right side of the
            % relation
            %
            % Optional input arguments are key value pairs:
            % 'LeftAnnotation', 'my annotation for the left point of the arrow'
            % 'RightAnnotation', 'my annotation for the right point of the arrow'
            % 'RelationAnnotation', 'my annotation for the center of the arrow'
            
            % store the inputs
            this.LeftClassName = LeftClassName_;
            this.RelationType = RelationType_;
            this.RightClassName = RightClassName_;
            
            % process the optional input arguments
            if ~isempty(varargin)
                for idx = 1:2:floor(length(varargin)/2)*2
                    switch lower(varargin{idx})
                        case 'leftannotation'
                            this.LeftAnnotation = varargin{idx + 1};
                        case 'rightannotation'
                            this.RightAnnotation = varargin{idx + 1};
                        case 'relationannotation'
                            this.RelationAnnotation = varargin{idx + 1};
                        otherwise
                            if ischar(varargin{idx})
                            error('matdoc:uml:relation:Relation:UnkownArgument',...
                                'Unkown argument ''%s''.', varargin{idx});
                            else % if ischar(varargin{idx})
                                error('matdoc:uml:relation:Relation:UnkownArgument',...
                                    'Unkown argument of type ''%s''.', class(varargin{idx}));
                            end % if ischar(varargin{idx})
                    end % switch lower(varargin{idx})
                end % for idx = 1:2:floor(length(varargin)/2)*2
            end % if ~isempty(varargin)
            
        end % function this = ColumnDataDisplay()
        
        %% - umlStr = getPlantUML(this, ident_)
        function umlStr = getPlantUML(this, ident_)
            % function umlStr = getPlantUML(this, ident_)
            %
            % Returns the UML Relation string of this relation
            
            
            % process input %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if nargin < 2 || isempty(ident_)
                ident_ = 0;
            end % if nargin < 2 || isempty(ident_)
            if ~isnumeric(ident_)
                error('matdoc:uml:Package:getPlantUML:TypeError',...
                    'Input ident_ has to be numeric.');
            end % if ~isnumeric(ident_)
            
            % build the identStr
            identStr = char(32 * ones(1, ident_));
            
            % get Annotation Strings %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            if isempty(this.LeftAnnotation)
                AnnoTationLeft = '';
            else % if isempty(this.LeftAnnotation)
                AnnoTationLeft = sprintf(' "%s"', this.LeftAnnotation);
            end % if isempty(this.LeftAnnotation)
            if isempty(this.RightAnnotation)
                AnnotationRight = '';
            else % if isempty(this.RightAnnotation)
                AnnotationRight = sprintf('"%s" ', this.RightAnnotation);
            end % if isempty(this.RightAnnotation)
            if isempty(this.RelationAnnotation)
                AnnotationRelation = '';
            else % if isempty(this.RelationAnnotation)
                AnnotationRelation = sprintf(' : %s', this.RelationAnnotation);
            end % if isempty(this.RelationAnnotation)
            
            % Build the complete string %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            umlStr = sprintf('%s%s%s %s %s%s%s',...
                identStr,...
                this.LeftClassName,...
                AnnoTationLeft,...
                this.RelationType.getPlantUML(),...
                AnnotationRight,...
                this.RightClassName,...
                AnnotationRelation...
                );
            
        end % function umlStr = getPlantUML(this, ident_)
        
    end % methods
    
    %% METHODS: PROTECTED
    methods (Access = protected)
        
        
    end % methods (Access = protected)
    
    %% METHODS: STATIC
    methods (Static)
        
        %% - theRelation = fromStr(string)
        function theRelation = fromStr(string)
            % function theRelation = fromStr(string)
            %
            % Call to create an instance of the Relation class based on a
            % given UML relation string.
            % If the format is not recognized the function will throw an
            % matdoc:uml:relation:Relation:fromStr:FormatError exception.
            
            % is realy a string?
            if ~ischar(string)
                error('matdoc:uml:relation:Relation:fromStr:FormatError',...
                    'This function is desined to evaluate strings (as the name suggests). You where trying to call it with an argument of type ''%s''. RTMF! :-)', class(string));
            end % if ~ischar(string)
            
            % First of all let's split the string with my custom fast string split,
            % which
            stringParts = matdoc.tools.faststrsplit(string, ' ');
            partCnt = length(stringParts);
            
            % check the length of the parts. There should be at least 3.
            if partCnt < 3
                error('matdoc:uml:relation:Relation:fromStr:FormatError',...
                    'The relation string has to have at least 3 parts seperated by a whitespace.');
            end % if partCnt < 3
            
            % Get Left ClassName %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            ClassLeft = stringParts{1};
            if ~matdoc.tools.isClassOrPackage(ClassLeft)
                error('matdoc:uml:relation:Relation:fromStr:FormatError',...
                    'Could not find class or package ''%s''. Are you sure it is spelled right or it is accessible in the matlab search path?.', ClassLeft);
            end % if ~matdoc.tools.isClassOrPackage(ClassLeft)
            
            ClassRighthIdx = 3;
            
            % Left Annotation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % look for the first annotation
            AnnoDelimPos = strfind(stringParts{2}, '"');
            hasLeftAnno = false;
            LeftAnno = '';
            if any(AnnoDelimPos)
                % check if the annotation did contain white spaces
                if length(AnnoDelimPos) == 2
                    % two white spaces in the 2nd part.
                    
                    LeftAnno = stringParts{2};
                    hasLeftAnno = LeftAnno(1) == '"' && LeftAnno(end) == '"';
                    if hasLeftAnno
                        LeftAnno = LeftAnno(2:end-1);
                    else % if hasLeftAnno
                        LeftAnno = '';
                    end % if hasLeftAnno
                else % if length(strfind(x, stringParts{2})) == 2
                    % only one white space in the first part. now let's see
                    % where whe can find the next annotation delimiter
                    hasLeftAnno = false;
                    for idx = 3:partCnt
                        if any(strfind(stringParts{idx}, '"'))
                            hasLeftAnno = true;
                            break;
                        end % if any(strfind(stringParts{idx}, '"'))
                    end % for idx = 3:partCnt
                    
                    % was the closing tag found?
                    if ~hasLeftAnno
                        error('matdoc:uml:relation:Relation:fromStr:FormatError',...
                            'Looks like the left Annotation is not closed with a matching ''"'' character.');
                    else
                        LeftAnno = strrep(strtrim(sprintf('%s ', stringParts{2:idx})), '"', '');
                        stringParts{2} = LeftAnno;
                        stringParts = horzcat(stringParts(1:2), stringParts(idx+1:end));
                        partCnt = length(stringParts);
                    end % if ~found
                    
                end % if length(strfind(x, stringParts{2})) == 2
            end % if any(strfind(x, stringParts{2}))
            
            % Get the relation arrow %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if hasLeftAnno
                RelationArrow = stringParts{3};
            else % if hasLeftAnnotation
                RelationArrow = stringParts{2};
            end % if hasLeftAnnotation
            
            % get relation type from relation arrow
            try
                RelType = matdoc.uml.relation.Type.fromStr(RelationArrow);
            catch ex
                switch ex.identifier
                    case 'matdoc:uml:relation:Type:fromStr:FormatError'
                        error('matdoc:uml:relation:Relation:fromStr:FormatError', ex.message);
                    otherwise
                        rethrow(ex);
                end % switch ex.identifier
            end % try
            
            % Right Annotation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % look for the second annotation
            if hasLeftAnno
                RightAnnoPos = 4;
            else % if hasLeftAnnotation
                RightAnnoPos = 3;
            end % if hasLeftAnnotation
            AnnoDelimPos = strfind(stringParts{RightAnnoPos}, '"');
            hasRightAnno = false;
            RightAnno = '';
            if any(AnnoDelimPos)
                % check if the annotation did contain white spaces
                if length(AnnoDelimPos) == 2
                    % two white spaces in the 2nd part.
                    
                    RightAnno = stringParts{RightAnnoPos};
                    hasRightAnno = RightAnno(1) == '"' && RightAnno(end) == '"';
                    if hasRightAnno
                        RightAnno = RightAnno(RightAnnoPos:end-1);
                    else % if hasLeftAnno
                        RightAnno = '';
                    end % if hasLeftAnno
                else % if length(strfind(x, stringParts{2})) == 2
                    % only one white space in the first part. now let's see
                    % where whe can find the next annotation delimiter
                    hasRightAnno = false;
                    for idx = RightAnnoPos+1:partCnt
                        if any(strfind(stringParts{idx}, '"'))
                            hasRightAnno = true;
                            break;
                        end % if any(strfind(stringParts{idx}, '"'))
                    end % for idx = RightAnnoPos+1:partCnt
                    
                    % was the closing tag found?
                    if ~hasRightAnno
                        error('matdoc:uml:relation:Relation:fromStr:FormatError',...
                            'Looks like the left Annotation is not closed with a matching ''"'' character.');
                    else
                        RightAnno = strrep(strtrim(sprintf('%s ', stringParts{RightAnnoPos:idx})), '"', '');
                        stringParts{2} = RightAnno;
                        stringParts = horzcat(stringParts(1:RightAnnoPos), stringParts(idx+1:end));
                        partCnt = length(stringParts);
                    end % if ~found
                    
                end % if length(strfind(x, stringParts{RightAnnoPos})) == 2
            end % if any(strfind(x, stringParts{RightAnnoPos}))
            
            % Get Left ClassName %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            ClassRighthIdx = ClassRighthIdx + double(hasLeftAnno) + double(hasRightAnno);
            ClassRight = stringParts{ClassRighthIdx};
            if ~matdoc.tools.isClassOrPackage(ClassRight)
                error('matdoc:uml:relation:Relation:fromStr:FormatError',...
                    'Could not find class or package ''%s''. Are you sure it is spelled right or it is accessible in the matlab search path?.', ClassLeft);
            end % if ~matdoc.tools.isClassOrPackage(ClassRight)
            
            % RelationAnnotation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            RelationAnno = '';
            if partCnt > ClassRighthIdx
                
                % check for colon operator
                if ~strcmp(stringParts{ClassRighthIdx + 1}, ':')
                    error('matdoc:uml:relation:Relation:fromStr:FormatError',...
                        'Please check your string again. It looks like you wanted to specify a RelationAnnotation but missed the '':'': %s', string);
                end % if ~strcmp(stringParts{ClassRighthIdx + 1}, ':')
                
                % get the relation annotation
                if partCnt > ClassRighthIdx + 1
                    RelationAnno = strtrim(sprintf('%s ', stringParts{ClassRighthIdx + 2:end}));
                end % if partCnt > ClassRighthIdx + 1
                
            end % if partCnt > ClassRighthIdx
            
            % Call constructor %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            theRelation = matdoc.uml.relation.Relation(...
                ClassLeft,... LeftClassName_
                RelType,... RelationType_
                ClassRight,... RightClassName_
                'LeftAnnotation', LeftAnno,...
                'RightAnnotation', RightAnno,...
                'RelationAnnotation', RelationAnno...
                );
            
        end % function theRelation = fromStr(string)
        
    end % methods (Static)
    
end % classdef Relation < handle