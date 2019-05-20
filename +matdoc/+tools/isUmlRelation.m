function tf = isUmlRelation(string)
% function tf = isUmlRelation(string)
%
% This function will check if the given string defines an plantUML
% relation.
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

% if the code detects that the string is not a valid relation it will
% change the value to false and return
try
    matdoc.uml.relation.Relation.fromStr(string);
catch ex
    switch ex.identifier
        case 'matdoc:uml:relation:Relation:fromStr:FormatError'
            tf = false;
            return;
        otherwise
            rethrow(ex);
    end % switch ex.identifier
end % try

% seem like it could create the class. Theirefore this is valid
tf = true;
return;
% 
% % First of all let's split the string with my custom fast string split,
% % which
% stringParts = matdoc.tools.faststrsplit(string, ' ');
% partCnt = length(stringParts);
% 
% % check the length of the parts. There should be at least 3.
% if partCnt < 3
%    tf = false;
%    return
% end
% 
% % Get Left ClassName %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ClassLeft = stringParts{1};
% if ~matdoc.tools.isClassOrPackage(ClassLeft)
%     tf = false;
%     return
% end % if ~matdoc.tools.isClassOrPackage(ClassLeft)
% 
% ClassRighthIdx = 3;
% 
% % Check for Annotations %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % LeftAnnotation
% LeftAnnotation = stringParts{2};
% hasLeftAnnotation = LeftAnnotation(1) == '"' && LeftAnnotation(end) == '"';
% 
% % Right Annotation
% if hasLeftAnnotation
%     RightAnnotation = stringParts{4};
% else % if hasLeftAnnotation
%     RightAnnotation = stringParts{3};
% end % if hasLeftAnnotation
% hasRightAnnotation = RightAnnotation(1) == '"' && RightAnnotation(end) == '"';
% 
% % Get Left ClassName %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ClassRighthIdx = ClassRighthIdx + double(hasLeftAnnotation) + double(hasRightAnnotation);
% ClassRight = stringParts{ClassRighthIdx};
% if ~matdoc.tools.isClassOrPackage(ClassRight)
%     tf = false;
%     return
% end % if ~matdoc.tools.isClassOrPackage(ClassRight)
% 
% % check RelationAnnotation
% if partCnt > ClassRighthIdx
%     
%     % check for colon operator
%     if ~strcmp(stringParts{ClassRighthIdx + 1}, ':')
%         tf = false;
%         return;
%     end % if ~strcmp(stringParts{ClassRighthIdx + 1}, ':')
%     
%     % no need to check for futher existance. the RelationAnnotation might
%     % be an empty string.
%     
% end % if partCnt > ClassRighthIdx

end % function tf = isUmlRelation(string)