classdef Method < matdoc.sphinx.super.Base
    
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
            subIdentStr = char(32 * ones(1, ident_ + matdoc.sphinx.super.Base.SPHINX_IDENT));
            
            % build the sphinx string %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            % prefix
            if this.Static
                prefix = '.. py:staticmethod::';
            elseif this.Abstract
                prefix = '.. py:abstractmethod::';
            else
                prefix = '.. py:method::';
            end
            
            % method signature
            OutputCnt = length(this.OutputNames);
            switch OutputCnt
                case 0
                    Outputs = '';
                case 1
                    Outputs = sprintf('%s = ', this.OutputNames{1});
                otherwise
                    Outputs = sprintf('%s, ', this.OutputNames{:});
                    Outputs = sprintf('[%s] = ', Outputs(1:end-2));
            end
            InputCnt = length(this.InputNames);
            switch InputCnt
                case 0
                    Inputs = '';
                otherwise
                    Inputs = sprintf('%s, ', this.InputNames{:});
                    Inputs = Inputs(1:end-2);
            end
            MethodSignature = sprintf('%s%s(%s)', Outputs, this.Name, Inputs);
            
            % combine everything
            sphinxDocStr = sprintf('%s%s %s', identStr, prefix, MethodSignature);
            
            % add the doc string
            if this.Configuration.MethodDescription
                % get description
                if ~isempty(this.DetailedDescription)
                    descr = this.DetailedDescription;
                elseif ~isempty(this.Description)
                    descr = this.Description;
                elseif isempty(this.DefiningClass)
                    descr = help(this.Name);
                else
                    descr = help(sprintf('%s.%s', this.DefiningClass.Name, this.Name));
                end % if ~isempty(this.DetailedDescription)
                
                % format the description
                descr = matdoc.sphinx.tools.MethodDocStrToRst(descr, ident_ + matdoc.sphinx.super.Base.SPHINX_IDENT);
                
                % inputs
                for iIn = 1:InputCnt
                    descr = sprintf('%s\n\n%s:param %s:', descr, subIdentStr, this.InputNames{iIn});
                end % for iIn = 1:InputCnt
                
                % outputs
                if this.isConstructor
                    descr = sprintf('%s\n\n%s:returns %s:', descr, subIdentStr, this.Name);
                else % if this.isConstructor
                    for iIn = 1:OutputCnt
                        descr = sprintf('%s\n\n%s:return %s:', descr, subIdentStr, this.OutputNames{iIn});
                    end % for iIn = 1:InputCnt
                end % if this.isConstructor
                
                % add description to the end of the doc string
                sphinxDocStr = sprintf('%s\n\n%s', sphinxDocStr, descr);
            end % if this.Configuration.MethodDescription
            
        end % function sphinxDocStr = getSphinxDoc(this)
        
    end %  methods
    
end % classdef Method < handle
