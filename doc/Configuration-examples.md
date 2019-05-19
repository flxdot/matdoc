# matdoc.Configuration: Examples

The configuration of the UML export is generally controlled by the public properties.

The following properties can be set:
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

There are also some special settings which can be used as a short cut and only in combination with a value of `true`:
 - IngoreBuiltInInheritance
 - InheritanceHint
 - OnlyRelationship

## Default Behaviour

The behavior of each setting, the class diagram of `matdoc.Meta.Class` and `matdoc.Enums.AccessLevel` is used. Below you'll the output with the default settings:

```matlab
theDoc = matdoc.Documentation({...
   'matdoc.Meta.Class',...
   'matdoc.Enums.AccessLevel'...
    });
theDoc.toFile('\doc\uml-examples\export-class.txt');
```
![export-class.png](uml-examples/export-class.png)

The UML output: **[export-class.txt](uml-examples/export-class.txt)**

## Properties

### HideEnumerationMember

Flag: true or false
 Default: false
 If set the UML won't contain any information about enumeration
 members

*Default: **false***

#### Example

```matlab
theDoc = matdoc.Documentation({...
   'matdoc.Meta.Class',...
   'matdoc.Enums.AccessLevel'...
    },...
    'HideEnumerationMember', true...
    );
theDoc.toFile('doc\uml-examples\export-class-HideEnumerationMember-true.txt');
```
![export-class-HideEnumerationMember-true.png](uml-examples/export-class-HideEnumerationMember-true.png)

The UML output: **[export-class-HideEnumerationMember-true.txt](uml-examples/export-class-HideEnumerationMember-true.txt)**

### HideEvents

Flag: true or false
 Default: false
 If set the UML won't contain any information about events

*Default: **false***

#### Example

```matlab
theDoc = matdoc.Documentation({...
   'matdoc.Meta.Class',...
   'matdoc.Enums.AccessLevel'...
    },...
    'HideEvents', true...
    );
theDoc.toFile('doc\uml-examples\export-class-HideEvents-true.txt');
```
![export-class-HideEvents-true.png](uml-examples/export-class-HideEvents-true.png)

The UML output: **[export-class-HideEvents-true.txt](uml-examples/export-class-HideEvents-true.txt)**

### HideMethods

Flag: true or false
 Default: false
 If set the UML won't contain any information about methods

*Default: **false***

#### Example

```matlab
theDoc = matdoc.Documentation({...
   'matdoc.Meta.Class',...
   'matdoc.Enums.AccessLevel'...
    },...
    'HideMethods', true...
    );
theDoc.toFile('doc\uml-examples\export-class-HideMethods-true.txt');
```
![export-class-HideMethods-true.png](uml-examples/export-class-HideMethods-true.png)

The UML output: **[export-class-HideMethods-true.txt](uml-examples/export-class-HideMethods-true.txt)**

### HideProperties

Flag: true or false
 Default: false
 If set the UML won't contain any information about properties

*Default: **false***

#### Example

```matlab
theDoc = matdoc.Documentation({...
   'matdoc.Meta.Class',...
   'matdoc.Enums.AccessLevel'...
    },...
    'HideProperties', true...
    );
theDoc.toFile('doc\uml-examples\export-class-HideProperties-true.txt');
```
![export-class-HideProperties-true.png](uml-examples/export-class-HideProperties-true.png)

The UML output: **[export-class-HideProperties-true.txt](uml-examples/export-class-HideProperties-true.txt)**

### IgnoreBuiltInClass

Flag: true or false
 Default: false
 If set the uml export will not contain refrences to built-in
 classes

*Default: **false***

#### Example

```matlab
theDoc = matdoc.Documentation({...
   'matdoc.Meta.Class',...
   'matdoc.Enums.AccessLevel'...
    },...
    'IgnoreBuiltInClass', true...
    );
theDoc.toFile('doc\uml-examples\export-class-IgnoreBuiltInClass-true.txt');
```
![export-class-IgnoreBuiltInClass-true.png](uml-examples/export-class-IgnoreBuiltInClass-true.png)

The UML output: **[export-class-IgnoreBuiltInClass-true.txt](uml-examples/export-class-IgnoreBuiltInClass-true.txt)**

### IngoreBuiltInMethodInheritance

Flag: true or false
 Default: true
 If set the uml export will not contain methods inheritated from
 built-in classes

*Default: **true***

#### Example

```matlab
theDoc = matdoc.Documentation({...
   'matdoc.Meta.Class',...
   'matdoc.Enums.AccessLevel'...
    },...
    'IngoreBuiltInMethodInheritance', false...
    );
theDoc.toFile('doc\uml-examples\export-class-IngoreBuiltInMethodInheritance-false.txt');
```
![export-class-IngoreBuiltInMethodInheritance-false.png](uml-examples/export-class-IngoreBuiltInMethodInheritance-false.png)

The UML output: **[export-class-IngoreBuiltInMethodInheritance-false.txt](uml-examples/export-class-IngoreBuiltInMethodInheritance-false.txt)**

### IngoreBuiltInPropertyInheritance

Flag: true or false
 Default: true
 If set the uml export will not contain properties inheritated
 from built-in classes

*Default: **true***

#### Example

```matlab
theDoc = matdoc.Documentation({...
   'matdoc.Meta.Class',...
   'matdoc.Enums.AccessLevel'...
    },...
    'IngoreBuiltInPropertyInheritance', false...
    );
theDoc.toFile('doc\uml-examples\export-class-IngoreBuiltInPropertyInheritance-false.txt');
```
![export-class-IngoreBuiltInPropertyInheritance-false.png](uml-examples/export-class-IngoreBuiltInPropertyInheritance-false.png)

The UML output: **[export-class-IngoreBuiltInPropertyInheritance-false.txt](uml-examples/export-class-IngoreBuiltInPropertyInheritance-false.txt)**

### MethodInheritanceHint

Flag: true or false
 Default: true
 If set the UML will contain information about inhertitated
 methods at the end of the line

*Default: **true***

#### Example

```matlab
theDoc = matdoc.Documentation({...
   'matdoc.Meta.Class',...
   'matdoc.Enums.AccessLevel'...
    },...
    'MethodInheritanceHint', false...
    );
theDoc.toFile('doc\uml-examples\export-class-MethodInheritanceHint-false.txt');
```
![export-class-MethodInheritanceHint-false.png](uml-examples/export-class-MethodInheritanceHint-false.png)

The UML output: **[export-class-MethodInheritanceHint-false.txt](uml-examples/export-class-MethodInheritanceHint-false.txt)**

### PropertyDescription

Flag: true or false
 Default: false
 If set the description of each property will be added to the UML
 diagram

*Default: **false***

#### Example

```matlab
theDoc = matdoc.Documentation({...
   'matdoc.Meta.Class',...
   'matdoc.Enums.AccessLevel'...
    },...
    'PropertyDescription', true...
    );
theDoc.toFile('doc\uml-examples\export-class-PropertyDescription-true.txt');
```
![export-class-PropertyDescription-true.png](uml-examples/export-class-PropertyDescription-true.png)

The UML output: **[export-class-PropertyDescription-true.txt](uml-examples/export-class-PropertyDescription-true.txt)**

### PropertyInheritanceHint

Flag: true or false
 Default: true
 If set the UML will contain information about inhertitated
 properties at the end of the line

*Default: **true***

#### Example

```matlab
theDoc = matdoc.Documentation({...
   'matdoc.Meta.Class',...
   'matdoc.Enums.AccessLevel'...
    },...
    'PropertyInheritanceHint', false...
    );
theDoc.toFile('doc\uml-examples\export-class-PropertyInheritanceHint-false.txt');
```
![export-class-PropertyInheritanceHint-false.png](uml-examples/export-class-PropertyInheritanceHint-false.png)

The UML output: **[export-class-PropertyInheritanceHint-false.txt](uml-examples/export-class-PropertyInheritanceHint-false.txt)**

## Special Settings

### IngoreBuiltInInheritance

IngoreBuiltInMethodInheritance and IngoreBuiltInPropertyInheritance combined.

#### Example

```matlab
theDoc = matdoc.Documentation({...
   'matdoc.Meta.Class',...
   'matdoc.Enums.AccessLevel'...
    },...
    'IngoreBuiltInInheritance', true...
    );
theDoc.toFile('doc\uml-examples\export-class-IngoreBuiltInInheritance-true.txt');
```
![export-class-IngoreBuiltInInheritance-true.png](uml-examples/export-class-IngoreBuiltInInheritance-true.png)

The UML output: **[export-class-IngoreBuiltInInheritance-true.txt](uml-examples/export-class-IngoreBuiltInInheritance-true.txt)**

### InheritanceHint

MethodInheritanceHint and PropertyInheritanceHint combined.

#### Example

```matlab
theDoc = matdoc.Documentation({...
   'matdoc.Meta.Class',...
   'matdoc.Enums.AccessLevel'...
    },...
    'InheritanceHint', true...
    );
theDoc.toFile('doc\uml-examples\export-class-InheritanceHint-true.txt');
```
![export-class-InheritanceHint-true.png](uml-examples/export-class-InheritanceHint-true.png)

The UML output: **[export-class-InheritanceHint-true.txt](uml-examples/export-class-InheritanceHint-true.txt)**

### OnlyRelationship

Hiddes all methods, properties, events and enumeration members to let the user focus on the relation between the classes. This can be helfull when the Diagram is very large or fairly complicated.

#### Example

```matlab
theDoc = matdoc.Documentation({...
   'matdoc.Meta.Class',...
   'matdoc.Enums.AccessLevel'...
    },...
    'OnlyRelationship', true...
    );
theDoc.toFile('doc\uml-examples\export-class-OnlyRelationship-true.txt');
```
![export-class-OnlyRelationship-true.png](uml-examples/export-class-OnlyRelationship-true.png)

The UML output: **[export-class-OnlyRelationship-true.txt](uml-examples/export-class-OnlyRelationship-true.txt)**