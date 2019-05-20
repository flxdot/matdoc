# Frequently Asked Questions

## matdoc

### Why is one of my classes missing in the uml diagram?

Well this might be caused by a naming conflict where a class may have the same name as a package. Let's visualisze that. If your folder/file layout contains anything similar to the example blow, try to set the  ***`SafeUmlExport`*** flag in the Configurations.

```
+Toolbox
  ...
  |- +Tools
       |- Hammer.m
       |- ScrewDriver.m
  |- Tools.m
```

Notice how there is a conflict between the class `Toolbox.Tools` (***File:*** *+Toolbox/Tools.m*) and the package `Toolbox.Tools` (***Folder:*** *+Toolbox/+Tools*).

## PlantUML

### Why does only half of my plant diagram showup? Or is cut at the right or bottom?

This is related to a limitation of the plantUML.jar. Please check the FAQ of plantUML:

[I want to generate huge diagrams! - plantuml.com](http://plantuml.com/de/faq)

### How to I optain vector graphics? (svg, eps)

See the command line options of plantUML.jar: http://plantuml.com/de/command-line