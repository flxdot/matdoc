% create the UML Object %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
theUML = m2plantUML.UML({...
    'm2plantUML.Meta.Class',...
    'm2plantUML.Enums.AccessLevel',...
    }...
    );

% export default diagram
fileName = 'export-class';
exportPath = fullfile('doc', 'uml-examples');
theUML.toFile(fullfile(exportPath, sprintf('%s.txt', fileName)));

% Get all possible properties and export the UML of those %%%%%%%%%%%%%%%%%
cfgMeta = meta.class.fromName('m2plantUML.Configuration');

for iProp = 1:length(cfgMeta.PropertyList)
    % get the current property
    curProp = cfgMeta.PropertyList(iProp);
    % change only public properties
    if ~strcmp(curProp.SetAccess, 'public')
        continue;
    end % if ~strcmp(curProp.SetAccess, 'public')
    
    % reset the settings
    theUML.Configuration.reset();
    
    % set the oppostite of the current default property
    theUML.Configuration.(curProp.Name) = ~curProp.DefaultValue;
    
    % export the uml again
    theUML.toFile(fullfile(exportPath, sprintf('%s-%s-%i.txt', fileName, curProp.Name, ~curProp.DefaultValue)));
end % for iProp = 1:length(cfgMeta.PropertyList)

% Export the special settings %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
specialSettings = {'IngoreBuiltInInheritance', 'InheritanceHint', 'OnlyRelationship'};
for iSett = 1:length(specialSettings)
    % get the name of the current setting
    curSett = specialSettings{iSett};
    
    % reset the settings
    theUML.Configuration.reset();
    
    % set the oppostite of the current default property
    theUML.Configuration.setSetting(curSett, true);
    
    % export the uml again
    theUML.toFile(fullfile(exportPath, sprintf('%s-%s-%i.txt', fileName, curSett, true)));
end
