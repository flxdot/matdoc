classdef Property < matdoc.sphinx.super.Base
    
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
            
            sphinxDocStr = sprintf('%s- **%s**', identStr, this.Name);
            
            % print description?
            if this.Configuration.PropertyDescription
                descr = matdoc.sphinx.tools.DocStrToRst(this.Description, 0);
                sphinxDocStr = sprintf('%s %s', sphinxDocStr, descr);
            end % if this.Configuration.PropertyDescription
%             
%             % prefix
%             prefix = sprintf('%s{field}', identStr);
%             if this.Constant
%                 prefix = sprintf('%s {static}', prefix);
%             end % if this.Constant
%             if this.Abstract
%                 prefix = sprintf('%s {abstract}', prefix);
%             end % if this.Abstract
%             
%             % acces level
%             switch this.GetAccess
%                 case 'private'
%                     AccessLevel = '-';
%                 case 'protected'
%                     AccessLevel = '#';
%                 otherwise
%                     AccessLevel = '+';
%             end % switch this.GetAccess
%             
%             % name
%             sphinxDocStr = sprintf('%s %s %s', prefix, AccessLevel, this.Name);
%             
%             % print inheritance hint?
%             if this.Configuration.PropertyInheritanceHint && ...
%                     ~strcmp(this.metaObj.DefiningClass.Name, this.Parent.Name)
%                 sphinxDocStr = sprintf('%s < %s', sphinxDocStr, this.metaObj.DefiningClass.Name);
%             end % if this.Configuration.PropertyInheritanceHint
%             
%             % print description?
%             if this.Configuration.PropertyDescription
%                 sphinxDocStr = sprintf('%s\n%s%s\n%s', sphinxDocStr, identStr, this.Description, identStr);
%             end % if this.Configuration.PropertyDescription
            
        end % function sphinxDocStr = getSphinxDoc(this)
        
    end % methods
    
end % classdef Property < handle
