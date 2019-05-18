function write_Configuration_examples()

% create the UML Object %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
theUML = m2plantUML.UML({...
    'm2plantUML.Meta.Class',...
    'm2plantUML.Enums.AccessLevel',...
    }...
    );

% create the UML Object %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
theUMLCfg = m2plantUML.UML({...
    'm2plantUML.Configuration',...
    }...
    );
cfgMeta = theUMLCfg.UmlObjects{1};
cfgProps = sort(cfgMeta.PropertyList([cfgMeta.PropertyList(:).SetAccess] == 'public'));

% export default diagram
fileName = 'export-class';
exportPath = fullfile('doc', 'uml-examples');
theUML.toFile(fullfile(exportPath, sprintf('%s.txt', fileName)));

% Build the Doc string

DocStr = sprintf('# m2plantUML.Configuration: Examples');
DocStr = sprintf('%s\n\nThe sections below will show you how each of the configuration work and the output is changed.', DocStr);
DocStr = sprintf('%s\n\nThe following strings are valid settings:', DocStr);
for iProp = 1:length(cfgProps)
    DocStr = sprintf('%s\n - %s', DocStr, cfgProps(iProp).Name);
end

DocStr = sprintf('%s\n\n## Default Behaviour', DocStr);
DocStr = sprintf('%s\n\nThe behavior of each setting, the class diagram of `m2plantUML.Meta.Class` and `m2plantUML.Enums.AccessLevel` is used. Below you''ll the output with the default settings:', DocStr);
DocStr = sprintf('%s\n\n```matlab', DocStr);
DocStr = sprintf('%s\ntheUML = m2plantUML.UML({...\n   ''m2plantUML.Meta.Class'',...\n   ''m2plantUML.Enums.AccessLevel''...\n    });\ntheUML.toFile(''\\doc\\uml-examples\\export-class.txt'');', DocStr);
DocStr = sprintf('%s\n```', DocStr);
DocStr = sprintf('%s\n![export-class.png](m2plantUML\\doc\\uml-examples\\export-class.png)', DocStr);
DocStr = sprintf('%s\nThe UML output: **[export-class.txt](m2plantUML\\doc\\uml-examples\\export-class.txt)**', DocStr);


% Generate a section for each property %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DocStr = sprintf('%s\n\n## Properties', DocStr);
for iProp = 1:length(cfgProps)
    curProp = cfgProps(iProp);
    curPropName = curProp.Name;
    
    % build name of the files to export
    umlFile = sprintf('%s-%s-%s', fileName, curProp.Name, bool2str(~curProp.DefaultValue));
    umlFileTxt = sprintf('%s.txt', umlFile);
    umlFilePng = sprintf('%s.png', umlFile);
    
    % Export UML %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % reset the settings
    theUML.Configuration.reset();
    
    % set the oppostite of the current default property
    theUML.Configuration.(curProp.Name) = ~curProp.DefaultValue;
    
    % export the uml again
    theUML.toFile(fullfile(exportPath, umlFileTxt));
    
    % Write Documentation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % headline
    DocStr = sprintf('%s\n\n### %s', DocStr, curPropName);
    
    % desciption
    dscr = strsplit(curProp.Description, ' ');
    DocStr = sprintf('%s\n\n%s', DocStr, strtrim(sprintf('%s ', dscr{:})));
    
    % default value
    DocStr = sprintf('%s\n\n*Default: **%s***', DocStr, bool2str(curProp.DefaultValue));
    
    % example
    DocStr = sprintf('%s\n\n#### Example', DocStr);
    DocStr = sprintf('%s\n\n```matlab', DocStr);
    DocStr = sprintf('%s\ntheUML = m2plantUML.UML({...\n   ''m2plantUML.Meta.Class'',...\n   ''m2plantUML.Enums.AccessLevel''...\n    },...\n    ''%s'', %s...\n    );\ntheUML.toFile(''%s'');', DocStr, curPropName, bool2str(~curProp.DefaultValue), fullfile(exportPath, umlFileTxt));
    DocStr = sprintf('%s\n```', DocStr);
    DocStr = sprintf('%s\n![%s](%s)', DocStr, umlFilePng, fullfile(exportPath, umlFilePng));
    DocStr = sprintf('%s\nThe UML output: **[%s](%s)**', DocStr, umlFileTxt, fullfile(exportPath, umlFileTxt));
    
end % for iProp = 1:length(CfgProps)

% Generate a section for each special setting %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DocStr = sprintf('%s\n\n## Special Settings', DocStr);
specialSettings = {'IngoreBuiltInInheritance', 'InheritanceHint', 'OnlyRelationship'};
specialDescription = {...
    'IngoreBuiltInMethodInheritance and IngoreBuiltInPropertyInheritance combined.',... IngoreBuiltInInheritance
    'MethodInheritanceHint and PropertyInheritanceHint combined.',... InheritanceHint
    'Hiddes all methods, properties, events and enumeration members to let the user focus on the relation between the classes. This can be helfull when the Diagram is very large or fairly complicated.',... OnlyRelationship
    };
for iSett = 1:length(specialSettings)
    % get the name of the current setting
    curSett = specialSettings{iSett};
    
    % Export UML %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % reset the settings
    theUML.Configuration.reset();
    
    % set the oppostite of the current default property
    theUML.Configuration.setSetting(curSett, true);
    
    % export the uml again
    theUML.toFile(fullfile(exportPath, sprintf('%s-%s-true.txt', fileName, curSett)));
    
    % Write Documentation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % headline
    DocStr = sprintf('%s\n\n### %s', DocStr, curSett);
    
    % desciption
    DocStr = sprintf('%s\n\n%s', DocStr, specialDescription{iSett});
    
    % example
    DocStr = sprintf('%s\n\n#### Example', DocStr);
    DocStr = sprintf('%s\n\n```matlab', DocStr);
    DocStr = sprintf('%s\ntheUML = m2plantUML.UML({...\n   ''m2plantUML.Meta.Class'',...\n   ''m2plantUML.Enums.AccessLevel''...\n    },...\n    ''%s'', %s...\n    );\ntheUML.toFile(''%s'');', DocStr, curSett, bool2str(true), fullfile(exportPath, umlFileTxt));
    DocStr = sprintf('%s\n```', DocStr);
    DocStr = sprintf('%s\n![%s](%s)', DocStr, umlFilePng, fullfile(exportPath, umlFilePng));
    DocStr = sprintf('%s\nThe UML output: **[%s](%s)**', DocStr, umlFileTxt, fullfile(exportPath, umlFileTxt));
    
end % for iSett = 1:length(specialSettings)

% Write the Configuration-examples.md %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[fid, fopen_err] = fopen(fullfile(pwd, 'doc', 'Configuration-examples.md'), 'w');
if fid > 0
    fwrite(fid, DocStr);
    fclose(fid);
else
    error('Could not open Configuration-examples.md for writting:\n\%s', fopen_err);
end
end

function str = bool2str(bool)
if bool
    str = 'true';
else
    str = 'false';
end
end