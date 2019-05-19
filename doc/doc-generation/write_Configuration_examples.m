function write_Configuration_examples()

% create the UML Object %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
theDoc = matdoc.Documentation({...
    'matdoc.Meta.Class',...
    'matdoc.Enums.AccessLevel',...
    }...
    );

% create the UML Object %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
theDocCfg = matdoc.Documentation({...
    'matdoc.Configuration',...
    }...
    );
cfgMeta = theDocCfg.UmlObjects{1};
cfgProps = sort(cfgMeta.PropertyList([cfgMeta.PropertyList(:).SetAccess] == 'public'));
specialSettings = {'IngoreBuiltInInheritance', 'InheritanceHint', 'OnlyRelationship'};

% export default diagram
fileName = 'export-class';
exportPath = fullfile('doc', 'uml-examples');
linkPath = fullfile('uml-examples');
theDoc.UmlToFile(fullfile(exportPath, sprintf('%s.txt', fileName)));

% Build the Doc string

DocStr = sprintf('# matdoc.Configuration: Examples');
DocStr = sprintf('%s\n\nThe configuration of the UML export is generally controlled by the public properties.', DocStr);
DocStr = sprintf('%s\n\nThe following properties can be set:', DocStr);
for iProp = 1:length(cfgProps)
    DocStr = sprintf('%s\n - %s', DocStr, cfgProps(iProp).Name);
end
DocStr = sprintf('%s\n\nThere are also some special settings which can be used as a short cut and only in combination with a value of `true`:', DocStr);
for iSett = 1:length(specialSettings)
    DocStr = sprintf('%s\n - %s', DocStr, specialSettings{iSett});
end
DocStr = sprintf('%s\n\n## Default Behaviour', DocStr);
DocStr = sprintf('%s\n\nThe behavior of each setting, the class diagram of `matdoc.Meta.Class` and `matdoc.Enums.AccessLevel` is used. Below you''ll the output with the default settings:', DocStr);
DocStr = sprintf('%s\n\n```matlab', DocStr);
DocStr = sprintf('%s\ntheDoc = matdoc.Documentation({...\n   ''matdoc.Meta.Class'',...\n   ''matdoc.Enums.AccessLevel''...\n    });\ntheDoc.UmlToFile(''\\doc\\uml-examples\\export-class.txt'');', DocStr);
DocStr = sprintf('%s\n```', DocStr);
DocStr = sprintf('%s\n![export-class.png](uml-examples/export-class.png)', DocStr);
DocStr = sprintf('%s\n\nThe UML output: **[export-class.txt](uml-examples/export-class.txt)**', DocStr);


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
    theDoc.Configuration.reset();
    
    % set the oppostite of the current default property
    theDoc.Configuration.(curProp.Name) = ~curProp.DefaultValue;
    
    % export the uml again
    theDoc.UmlToFile(fullfile(exportPath, umlFileTxt));
    
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
    DocStr = sprintf('%s\ntheDoc = matdoc.Documentation({...\n   ''matdoc.Meta.Class'',...\n   ''matdoc.Enums.AccessLevel''...\n    },...\n    ''%s'', %s...\n    );\ntheDoc.UmlToFile(''%s'');', DocStr, curPropName, bool2str(~curProp.DefaultValue), fullfile(exportPath, umlFileTxt));
    DocStr = sprintf('%s\n```', DocStr);
    DocStr = sprintf('%s\n![%s](uml-examples/%s)', DocStr, umlFilePng, umlFilePng);
    DocStr = sprintf('%s\n\nThe UML output: **[%s](uml-examples/%s)**', DocStr, umlFileTxt, umlFileTxt);
    
end % for iProp = 1:length(CfgProps)

% Generate a section for each special setting %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DocStr = sprintf('%s\n\n## Special Settings', DocStr);
specialDescription = {...
    'IngoreBuiltInMethodInheritance and IngoreBuiltInPropertyInheritance combined.',... IngoreBuiltInInheritance
    'MethodInheritanceHint and PropertyInheritanceHint combined.',... InheritanceHint
    'Hiddes all methods, properties, events and enumeration members to let the user focus on the relation between the classes. This can be helfull when the Diagram is very large or fairly complicated.',... OnlyRelationship
    };
for iSett = 1:length(specialSettings)
    % get the name of the current setting
    curSett = specialSettings{iSett};
    
    % build name of the files to export
    umlFile = sprintf('%s-%s-true', fileName, curSett);
    umlFileTxt = sprintf('%s.txt', umlFile);
    umlFilePng = sprintf('%s.png', umlFile);
    
    % Export UML %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % reset the settings
    theDoc.Configuration.reset();
    
    % set the oppostite of the current default property
    theDoc.Configuration.setSetting(curSett, true);
    
    % export the uml again
    theDoc.UmlToFile(fullfile(exportPath, umlFileTxt));
    
    % Write Documentation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % headline
    DocStr = sprintf('%s\n\n### %s', DocStr, curSett);
    
    % desciption
    DocStr = sprintf('%s\n\n%s', DocStr, specialDescription{iSett});
    
    % example
    DocStr = sprintf('%s\n\n#### Example', DocStr);
    DocStr = sprintf('%s\n\n```matlab', DocStr);
    DocStr = sprintf('%s\ntheDoc = matdoc.Documentation({...\n   ''matdoc.Meta.Class'',...\n   ''matdoc.Enums.AccessLevel''...\n    },...\n    ''%s'', %s...\n    );\ntheDoc.UmlToFile(''%s'');', DocStr, curSett, bool2str(true), fullfile(exportPath, umlFileTxt));
    DocStr = sprintf('%s\n```', DocStr);
    DocStr = sprintf('%s\n![%s](uml-examples/%s)', DocStr, umlFilePng, umlFilePng);
    DocStr = sprintf('%s\n\nThe UML output: **[%s](uml-examples/%s)**', DocStr, umlFileTxt, umlFileTxt);
    
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