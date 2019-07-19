classdef Package < matdoc.sphinx.super.Base
   
    %% METHODS: PUBLIC
    methods
        
        %% - sphinxDocStr = getSphinxDoc(ident_)
        function sphinxDocStr = getSphinxDoc(this, ident_)
            % function sphinxDocStr = getSphinxDoc(this, ident_)
            %
            % Returns the plantUML representation of this meta object.
            % Note: This method will be called by the getter of the
            % plantUML property of the matdoc.sphinx.super.Base.
            
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
            
            % start the package tag
            sphinxDocStr = '';
            
            % get all classes contained by this package %%%%%%%%%%%%%%%%%%%
            for iObj = 1:length(this.ClassList)
                sphinxDocStr = sprintf('%s\n\n%s',...
                    sphinxDocStr,...
                    this.ClassList(iObj).getSphinxDoc(ident_ + matdoc.sphinx.super.Base.SPHINX_IDENT)...
                    );
            end % for iObj = 1:length(this.ClassList)
            
            % close the package tag
            sphinxDocStr = sprintf('%s%s', identStr, sphinxDocStr);
            
        end % function sphinxDocStr = getSphinxDoc(this)
        
    end %  methods
    
end % classdef Package < handle
