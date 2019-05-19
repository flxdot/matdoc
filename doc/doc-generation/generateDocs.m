% Configuration Exampels %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
write_Configuration_examples()

% UML Diagram from README.MD %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
theDoc = matdoc.Documentation({...
   'matdoc.Configuration',... a class we want to document
   'matdoc.Documentation',... another class we want to document
   'matdoc.enums',... a package we want to document
   'matdoc.meta.super',... jet another package we want to document
    });
theDoc.UmlToFile('doc\uml-examples\uml-diagram.txt');