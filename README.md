# Welcome to matdoc

matdoc is a package to deliver solutions to document your matlab code more automaded.

## Main Features

* Export of plantUML pseudo code for classes and packages

## Installation / Deployment

Clone and add the root folder to the matlab search path.

## Usage

## Configuration

The output will be configured via additional arguments to the [matdoc.Documentation](+matdoc/Documentation.m) constructor. The settings have to be passed as key value pairs.

````matlab
theDoc = matdoc.Documentation({...
   'matdoc.Meta.Class',...
   'matdoc.Enums.AccessLevel'...
    },...
    'IgnoreBuiltInClass', true...  <-- additional configuration arguments
    );
```

Alternatively the configuration may be edited directly via the properties of the config:

theDoc = matdoc.Documentation({...
   'matdoc.Meta.Class',...
   'matdoc.Enums.AccessLevel'...
    });
theDoc.Configuration.IgnoreBuiltInClass = true;
```

For further reference about the available settings please have a look at the **[Configuration Examples](doc/Configuration-examples.md)**.
