function DocStrLines = GetDocStrLines(DocStr)
% function DocStrLines = GetDocStrLines(DocStr)
%
% Call to get the lines of each docstring cleaned up.

% remove \r characters
DocStr = strrep(DocStr, char(13), '');

% split the doc string by its lines
DocStrLines = strsplit(DocStr, char(10));

% clean up each line
DocStrLines = cellfun(@strtrim, DocStrLines, 'Uniformoutput', 0);

end % function DocStrLines = GetDocStrLines(DocStr)