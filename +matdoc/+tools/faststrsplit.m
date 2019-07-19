function parts = faststrsplit(string, pattern)
% function parts = faststrsplit(string, pattern)
%
% A faster implementation of the strsplit algorithm. There are offcourse
% some limitation. For example you should only use it with single letter
% patterns and the patterns should not occure conescutively within the
% string.

% try to find the pattern
patternIdx = strfind(string, pattern);

% if the pattern could not be found return the string as cell
if isempty(patternIdx)
    parts = {string};
    return
end % if isempty(patternIdx)

% so how long is the pattern any how?
patternLen = length(pattern);

% how many pattern have been found?
patternCnt = length(patternIdx);

parts{1, 1} = string(1:patternIdx(1)-1);
for iSec = 1:patternCnt
    % calculate the start and end index of the current section
    sIdx = patternIdx(iSec) + patternLen;
    try
        eIdx = patternIdx(iSec + 1)-1;
    catch
        eIdx = length(string);
    end
    % store the section
    parts{1, iSec + 1} = string(sIdx:eIdx);
end % for iSec = 1:length(patternIdx)

end % function faststrsplit(string, pattern)