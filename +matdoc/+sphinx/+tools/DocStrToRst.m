function docStrOut = DocStrToRst(docStrIn, ident_)
% function docStrOut = DocStrToRst(docStrIn, ident_)
%
% Reformates the docstring to be displayed properly in the rst files

% process input %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if nargin < 2 || isempty(ident_)
    ident_ = 0;
end % if nargin < 2 || isempty(ident_)
if ~isnumeric(ident_)
    error('matdoc:sphinx:Package:getSphinxDoc:TypeError',...
        'Input ident_ has to be numeric.');
end % if ~isnumeric(ident_)

% make sure its a scalar integer value
ident_ = abs(round(ident_(1)));

% build the identStr
identStr = char(32 * ones(1, ident_));

% build the sphinx string %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% get each line from the doc string
lines = matdoc.sphinx.tools.GetDocStrLines(docStrIn);

if isempty(lines)
    docStrOut = '';
    return
end % if isempty(lines)

docStrOut = lines{1};
newLine = false;
for iLine = 2:length(lines)
    curLine = lines{iLine};
    if isempty(curLine)
        if newLine
            continue;
        end % if newLine
        docStrOut = sprintf('%s\n', docStrOut);
        newLine = true;
    else % if isempty(curLine)
        if newLine
            docStrOut = sprintf('%s%s%s', docStrOut, identStr, lines{iLine});
        else % if newLine
            docStrOut = sprintf('%s %s', docStrOut, lines{iLine});
        end % if newLine
        newLine = false;
    end % if ~isempty(curLine)
end % for iLine = 2:length(lines)

docStrOut = sprintf('%s%s', identStr, strtrim(docStrOut));

end % function DocStrOut = DocStrToRst(DocStrIn)