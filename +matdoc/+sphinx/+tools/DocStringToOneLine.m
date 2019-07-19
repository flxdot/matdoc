function docStrOut = DocStringToOneLine(docStrInt)
% function docStrOut = DocStringToOneLine(docStrInt)
%
% Transforms any type of string into a one line doc string.

% get each line from the doc string
lines = matdoc.sphinx.tools.GetDocStrLines(docStrInt);

if isempty(lines)
    docStrOut = '';
    return
end % if isempty(lines)

docStrOut = lines{1};
for iLine = 2:length(lines)
    curLine = lines{iLine};
    if ~isempty(curLine)
        docStrOut = sprintf('%s %s', docStrOut, lines{iLine});
    end % if ~isempty(curLine)
end % for iLine = 2:length(lines)

end % function docStrOut = DocStringToOneLine(docStrInt)

