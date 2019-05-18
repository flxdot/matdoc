# m2plantUML.Configuration: Examples

The sections below will show you how each of the configuration work and the output is changed.

The following strings are valid settings:
 - HideEnumerationMember
 - HideEvents
 - HideMethods
 - HideProperties
 - IgnoreBuiltInClass
 - IngoreBuiltInMethodInheritance
 - IngoreBuiltInPropertyInheritance
 - MethodInheritanceHint
 - PropertyDescription
 - PropertyInheritanceHint

## Default Behaviour

The behavior of each setting, the class diagram of `m2plantUML.Meta.Class` and `m2plantUML.Enums.AccessLevel` is used. Below you'll the output with the default settings:

```matlab
theUML = m2plantUML.UML({...
   'm2plantUML.Meta.Class',...
   'm2plantUML.Enums.AccessLevel'...
    });
theUML.toFile('\doc\uml-examples\export-class.txt');
```
![export-class.png](m2plantUML\doc\uml-examples\export-class.png)
The UML output: **[export-class.txt](m2plantUML\doc\uml-examples\export-class.txt)**

## Properties

### HideEnumerationMember

Flag: true or false
 Default: false
 If set the UML won't contain any information about enumeration
 members

*Default: **false***

#### Example

```matlab
theUML = m2plantUML.UML({...
   'm2plantUML.Meta.Class',...
   'm2plantUML.Enums.AccessLevel'...
    },...
    'HideEnumerationMember', true...
    );
theUML.toFile('doc\uml-examples\export-class-HideEnumerationMember-true.txt');
```
![export-class-HideEnumerationMember-true.png](doc\uml-examples\export-class-HideEnumerationMember-true.png)
The UML output: **[export-class-HideEnumerationMember-true.txt](doc\uml-examples\export-class-HideEnumerationMember-true.txt)**

### HideEvents

Flag: true or false
 Default: false
 If set the UML won't contain any information about events

*Default: **false***

#### Example

```matlab
theUML = m2plantUML.UML({...
   'm2plantUML.Meta.Class',...
   'm2plantUML.Enums.AccessLevel'...
    },...
    'HideEvents', true...
    );
theUML.toFile('doc\uml-examples\export-class-HideEvents-true.txt');
```
![export-class-HideEvents-true.png](doc\uml-examples\export-class-HideEvents-true.png)
The UML output: **[export-class-HideEvents-true.txt](doc\uml-examples\export-class-HideEvents-true.txt)**

### HideMethods

Flag: true or false
 Default: false
 If set the UML won't contain any information about methods

*Default: **false***

#### Example

```matlab
theUML = m2plantUML.UML({...
   'm2plantUML.Meta.Class',...
   'm2plantUML.Enums.AccessLevel'...
    },...
    'HideMethods', true...
    );
theUML.toFile('doc\uml-examples\export-class-HideMethods-true.txt');
```
![export-class-HideMethods-true.png](doc\uml-examples\export-class-HideMethods-true.png)
The UML output: **[export-class-HideMethods-true.txt](doc\uml-examples\export-class-HideMethods-true.txt)**

### HideProperties

Flag: true or false
 Default: false
 If set the UML won't contain any information about properties

*Default: **false***

#### Example

```matlab
theUML = m2plantUML.UML({...
   'm2plantUML.Meta.Class',...
   'm2plantUML.Enums.AccessLevel'...
    },...
    'HideProperties', true...
    );
theUML.toFile('doc\uml-examples\export-class-HideProperties-true.txt');
```
![export-class-HideProperties-true.png](doc\uml-examples\export-class-HideProperties-true.png)
The UML output: **[export-class-HideProperties-true.txt](doc\uml-examples\export-class-HideProperties-true.txt)**

### IgnoreBuiltInClass

Flag: true or false 
 Default: false
 If set the uml export will not contain refrences to built-in
 classes

*Default: **false***

#### Example

```matlab
theUML = m2plantUML.UML({...
   'm2plantUML.Meta.Class',...
   'm2plantUML.Enums.AccessLevel'...
    },...
    'IgnoreBuiltInClass', true...
    );
theUML.toFile('doc\uml-examples\export-class-IgnoreBuiltInClass-true.txt');
```
![export-class-IgnoreBuiltInClass-true.png](doc\uml-examples\export-class-IgnoreBuiltInClass-true.png)
The UML output: **[export-class-IgnoreBuiltInClass-true.txt](doc\uml-examples\export-class-IgnoreBuiltInClass-true.txt)**

### IngoreBuiltInMethodInheritance

Flag: true or false 
 Default: true
 If set the uml export will not contain methods inheritated from
 built-in classes

*Default: **true***

#### Example

```matlab
theUML = m2plantUML.UML({...
   'm2plantUML.Meta.Class',...
   'm2plantUML.Enums.AccessLevel'...
    },...
    'IngoreBuiltInMethodInheritance', false...
    );
theUML.toFile('doc\uml-examples\export-class-IngoreBuiltInMethodInheritance-false.txt');
```
![export-class-IngoreBuiltInMethodInheritance-false.png](doc\uml-examples\export-class-IngoreBuiltInMethodInheritance-false.png)
The UML output: **[export-class-IngoreBuiltInMethodInheritance-false.txt](doc\uml-examples\export-class-IngoreBuiltInMethodInheritance-false.txt)**

### IngoreBuiltInPropertyInheritance

Flag: true or false
 Default: true
 If set the uml export will not contain properties inheritated 
 from built-in classes

*Default: **true***

#### Example

```matlab
theUML = m2plantUML.UML({...
   'm2plantUML.Meta.Class',...
   'm2plantUML.Enums.AccessLevel'...
    },...
    'IngoreBuiltInPropertyInheritance', false...
    );
theUML.toFile('doc\uml-examples\export-class-IngoreBuiltInPropertyInheritance-false.txt');
```
![export-class-IngoreBuiltInPropertyInheritance-false.png](doc\uml-examples\export-class-IngoreBuiltInPropertyInheritance-false.png)
The UML output: **[export-class-IngoreBuiltInPropertyInheritance-false.txt](doc\uml-examples\export-class-IngoreBuiltInPropertyInheritance-false.txt)**

### MethodInheritanceHint

Flag: true or false
 Default: true
 If set the UML will contain information about inhertitated
 methods at the end of the line

*Default: **true***

#### Example

```matlab
theUML = m2plantUML.UML({...
   'm2plantUML.Meta.Class',...
   'm2plantUML.Enums.AccessLevel'...
    },...
    'MethodInheritanceHint', false...
    );
theUML.toFile('doc\uml-examples\export-class-MethodInheritanceHint-false.txt');
```
![export-class-MethodInheritanceHint-false.png](doc\uml-examples\export-class-MethodInheritanceHint-false.png)
The UML output: **[export-class-MethodInheritanceHint-false.txt](doc\uml-examples\export-class-MethodInheritanceHint-false.txt)**

### PropertyDescription

Flag: true or false
 Default: false
 If set the description of each property will be added to the UML
 diagram

*Default: **false***

#### Example

```matlab
theUML = m2plantUML.UML({...
   'm2plantUML.Meta.Class',...
   'm2plantUML.Enums.AccessLevel'...
    },...
    'PropertyDescription', true...
    );
theUML.toFile('doc\uml-examples\export-class-PropertyDescription-true.txt');
```
![export-class-PropertyDescription-true.png](doc\uml-examples\export-class-PropertyDescription-true.png)
The UML output: **[export-class-PropertyDescription-true.txt](doc\uml-examples\export-class-PropertyDescription-true.txt)**

### PropertyInheritanceHint

Flag: true or false
 Default: true
 If set the UML will contain information about inhertitated
 properties at the end of the line

*Default: **true***

#### Example

```matlab
theUML = m2plantUML.UML({...
   'm2plantUML.Meta.Class',...
   'm2plantUML.Enums.AccessLevel'...
    },...
    'PropertyInheritanceHint', false...
    );
theUML.toFile('doc\uml-examples\export-class-PropertyInheritanceHint-false.txt');
```
![export-class-PropertyInheritanceHint-false.png](doc\uml-examples\export-class-PropertyInheritanceHint-false.png)
The UML output: **[export-class-PropertyInheritanceHint-false.txt](doc\uml-examples\export-class-PropertyInheritanceHint-false.txt)**

## Special Settings

### IngoreBuiltInInheritance

IngoreBuiltInMethodInheritance and IngoreBuiltInPropertyInheritance combined.

#### Example

```matlab
theUML = m2plantUML.UML({...
   'm2plantUML.Meta.Class',...
   'm2plantUML.Enums.AccessLevel'...
    },...
    'IngoreBuiltInInheritance', true...
    );
theUML.toFile('doc\uml-examples\export-class-PropertyInheritanceHint-false.txt');
```
![export-class-PropertyInheritanceHint-false.png](doc\uml-examples\export-class-PropertyInheritanceHint-false.png)
The UML output: **[export-class-PropertyInheritanceHint-false.txt](doc\uml-examples\export-class-PropertyInheritanceHint-false.txt)**

### InheritanceHint

MethodInheritanceHint and PropertyInheritanceHint combined.

#### Example

```matlab
theUML = m2plantUML.UML({...
   'm2plantUML.Meta.Class',...
   'm2plantUML.Enums.AccessLevel'...
    },...
    'InheritanceHint', true...
    );
theUML.toFile('doc\uml-examples\export-class-PropertyInheritanceHint-false.txt');
```
![export-class-PropertyInheritanceHint-false.png](doc\uml-examples\export-class-PropertyInheritanceHint-false.png)
The UML output: **[export-class-PropertyInheritanceHint-false.txt](doc\uml-examples\export-class-PropertyInheritanceHint-false.txt)**

### OnlyRelationship

Hiddes all methods, properties, events and enumeration members to let the user focus on the relation between the classes. This can be helfull when the Diagram is very large or fairly complicated.

#### Example

```matlab
theUML = m2plantUML.UML({...
   'm2plantUML.Meta.Class',...
   'm2plantUML.Enums.AccessLevel'...
    },...
    'OnlyRelationship', true...
    );
theUML.toFile('doc\uml-examples\export-class-PropertyInheritanceHint-false.txt');
```
![export-class-PropertyInheritanceHint-false.png](doc\uml-examples\export-class-PropertyInheritanceHint-false.png)
The UML output: **[export-class-PropertyInheritanceHint-false.txt](doc\uml-examples\export-class-PropertyInheritanceHint-false.txt)**