# matdoc.Configuration: Examples

The configuration of the UML export is generally controlled by the public properties.

The following properties can be set:
 - HideEnumerationMember
 - HideEvents
 - HideInheritance
 - HideMethods
 - HideProperties
 - IgnoreBuiltInClass
 - IgnoreBuiltInMethodInheritance
 - IgnoreBuiltInPropertyInheritance
 - IgnoreTests
 - MethodInheritanceHint
 - PropertyDescription
 - PropertyInheritanceHint
 - SafeUmlExport

There are also some special settings which can be used as a short cut and only in combination with a value of `true`:
 - IgnoreBuiltInInheritance
 - InheritanceHint
 - OnlyRelationship

## Default Behaviour

The behavior of each setting, the class diagram of `matdoc.meta.Class` and `matdoc.enums.AccessLevel` is used. Below you'll the output with the default settings:

```matlab
theDoc = matdoc.Documentation({...
   'matdoc.meta.Class',...
   'matdoc.enums.AccessLevel'...
    });
theDoc.UmlToFile('\doc\uml-examples\export-class.txt');
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
   'matdoc.meta.Class',...
   'matdoc.enums.AccessLevel'...
    },...
    'HideEnumerationMember', true...
    );
theDoc.UmlToFile('doc\uml-examples\export-class-HideEnumerationMember-true.txt');
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
   'matdoc.meta.Class',...
   'matdoc.enums.AccessLevel'...
    },...
    'HideEvents', true...
    );
theDoc.UmlToFile('doc\uml-examples\export-class-HideEvents-true.txt');
```
![export-class-HideEvents-true.png](uml-examples/export-class-HideEvents-true.png)

The UML output: **[export-class-HideEvents-true.txt](uml-examples/export-class-HideEvents-true.txt)**

### HideInheritance

Flag: true or false
 Default: false
 If set the UML won't contain any information about inheritances
 If you specify inheritances your self, they will still be
 displayed!

*Default: **false***

#### Example

```matlab
theDoc = matdoc.Documentation({...
   'matdoc.meta.Class',...
   'matdoc.enums.AccessLevel'...
    },...
    'HideInheritance', true...
    );
theDoc.UmlToFile('doc\uml-examples\export-class-HideInheritance-true.txt');
```
![export-class-HideInheritance-true.png](uml-examples/export-class-HideInheritance-true.png)

The UML output: **[export-class-HideInheritance-true.txt](uml-examples/export-class-HideInheritance-true.txt)**

### HideMethods

Flag: true or false
 Default: false
 If set the UML won't contain any information about methods

*Default: **false***

#### Example

```matlab
theDoc = matdoc.Documentation({...
   'matdoc.meta.Class',...
   'matdoc.enums.AccessLevel'...
    },...
    'HideMethods', true...
    );
theDoc.UmlToFile('doc\uml-examples\export-class-HideMethods-true.txt');
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
   'matdoc.meta.Class',...
   'matdoc.enums.AccessLevel'...
    },...
    'HideProperties', true...
    );
theDoc.UmlToFile('doc\uml-examples\export-class-HideProperties-true.txt');
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
   'matdoc.meta.Class',...
   'matdoc.enums.AccessLevel'...
    },...
    'IgnoreBuiltInClass', true...
    );
theDoc.UmlToFile('doc\uml-examples\export-class-IgnoreBuiltInClass-true.txt');
```
![export-class-IgnoreBuiltInClass-true.png](uml-examples/export-class-IgnoreBuiltInClass-true.png)

The UML output: **[export-class-IgnoreBuiltInClass-true.txt](uml-examples/export-class-IgnoreBuiltInClass-true.txt)**

### IgnoreBuiltInMethodInheritance

Flag: true or false
 Default: true
 If set the uml export will not contain methods inheritated from
 built-in classes

*Default: **true***

#### Example

```matlab
theDoc = matdoc.Documentation({...
   'matdoc.meta.Class',...
   'matdoc.enums.AccessLevel'...
    },...
    'IgnoreBuiltInMethodInheritance', false...
    );
theDoc.UmlToFile('doc\uml-examples\export-class-IgnoreBuiltInMethodInheritance-false.txt');
```
![export-class-IgnoreBuiltInMethodInheritance-false.png](uml-examples/export-class-IgnoreBuiltInMethodInheritance-false.png)

The UML output: **[export-class-IgnoreBuiltInMethodInheritance-false.txt](uml-examples/export-class-IgnoreBuiltInMethodInheritance-false.txt)**

### IgnoreBuiltInPropertyInheritance

Flag: true or false
 Default: true
 If set the uml export will not contain properties inheritated
 from built-in classes

*Default: **true***

#### Example

```matlab
theDoc = matdoc.Documentation({...
   'matdoc.meta.Class',...
   'matdoc.enums.AccessLevel'...
    },...
    'IgnoreBuiltInPropertyInheritance', false...
    );
theDoc.UmlToFile('doc\uml-examples\export-class-IgnoreBuiltInPropertyInheritance-false.txt');
```
![export-class-IgnoreBuiltInPropertyInheritance-false.png](uml-examples/export-class-IgnoreBuiltInPropertyInheritance-false.png)

The UML output: **[export-class-IgnoreBuiltInPropertyInheritance-false.txt](uml-examples/export-class-IgnoreBuiltInPropertyInheritance-false.txt)**

### IgnoreTests

Flag: true or false
 Default: true
 If set the export will not contain any classes which are from the
 matlab unittesting framework or inheritated from the unit testing
 frame work

*Default: **true***

#### Example

```matlab
theDoc = matdoc.Documentation({...
   'matdoc.meta.Class',...
   'matdoc.enums.AccessLevel'...
    },...
    'IgnoreTests', false...
    );
theDoc.UmlToFile('doc\uml-examples\export-class-IgnoreTests-false.txt');
```
![export-class-IgnoreTests-false.png](uml-examples/export-class-IgnoreTests-false.png)

The UML output: **[export-class-IgnoreTests-false.txt](uml-examples/export-class-IgnoreTests-false.txt)**

### MethodInheritanceHint

Flag: true or false
 Default: true
 If set the UML will contain information about inhertitated
 methods at the end of the line

*Default: **true***

#### Example

```matlab
theDoc = matdoc.Documentation({...
   'matdoc.meta.Class',...
   'matdoc.enums.AccessLevel'...
    },...
    'MethodInheritanceHint', false...
    );
theDoc.UmlToFile('doc\uml-examples\export-class-MethodInheritanceHint-false.txt');
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
   'matdoc.meta.Class',...
   'matdoc.enums.AccessLevel'...
    },...
    'PropertyDescription', true...
    );
theDoc.UmlToFile('doc\uml-examples\export-class-PropertyDescription-true.txt');
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
   'matdoc.meta.Class',...
   'matdoc.enums.AccessLevel'...
    },...
    'PropertyInheritanceHint', false...
    );
theDoc.UmlToFile('doc\uml-examples\export-class-PropertyInheritanceHint-false.txt');
```
![export-class-PropertyInheritanceHint-false.png](uml-examples/export-class-PropertyInheritanceHint-false.png)

The UML output: **[export-class-PropertyInheritanceHint-false.txt](uml-examples/export-class-PropertyInheritanceHint-false.txt)**

### SafeUmlExport

Flag: true or fals
 Default: false
 If set the UML export will be done class wise instead of nesting
 classes into their packages. This can address issues when the
 classe diagram looks funky or classes are actually completly
 missing form diagram. This is mainly caused by naming conflicts
 when classes and packages have the same name.

*Default: **false***

#### Example

```matlab
theDoc = matdoc.Documentation({...
   'matdoc.meta.Class',...
   'matdoc.enums.AccessLevel'...
    },...
    'SafeUmlExport', true...
    );
theDoc.UmlToFile('doc\uml-examples\export-class-SafeUmlExport-true.txt');
```
![export-class-SafeUmlExport-true.png](uml-examples/export-class-SafeUmlExport-true.png)

The UML output: **[export-class-SafeUmlExport-true.txt](uml-examples/export-class-SafeUmlExport-true.txt)**

## Special Settings

### IgnoreBuiltInInheritance

IgnoreBuiltInMethodInheritance and IgnoreBuiltInPropertyInheritance combined.

#### Example

```matlab
theDoc = matdoc.Documentation({...
   'matdoc.meta.Class',...
   'matdoc.enums.AccessLevel'...
    },...
    'IgnoreBuiltInInheritance', true...
    );
theDoc.UmlToFile('doc\uml-examples\export-class-IgnoreBuiltInInheritance-true.txt');
```
![export-class-IgnoreBuiltInInheritance-true.png](uml-examples/export-class-IgnoreBuiltInInheritance-true.png)

The UML output: **[export-class-IgnoreBuiltInInheritance-true.txt](uml-examples/export-class-IgnoreBuiltInInheritance-true.txt)**

### InheritanceHint

MethodInheritanceHint and PropertyInheritanceHint combined.

#### Example

```matlab
theDoc = matdoc.Documentation({...
   'matdoc.meta.Class',...
   'matdoc.enums.AccessLevel'...
    },...
    'InheritanceHint', true...
    );
theDoc.UmlToFile('doc\uml-examples\export-class-InheritanceHint-true.txt');
```
![export-class-InheritanceHint-true.png](uml-examples/export-class-InheritanceHint-true.png)

The UML output: **[export-class-InheritanceHint-true.txt](uml-examples/export-class-InheritanceHint-true.txt)**

### OnlyRelationship

Hiddes all methods, properties, events and enumeration members to let the user focus on the relation between the classes. This can be helfull when the Diagram is very large or fairly complicated.

#### Example

```matlab
theDoc = matdoc.Documentation({...
   'matdoc.meta.Class',...
   'matdoc.enums.AccessLevel'...
    },...
    'OnlyRelationship', true...
    );
theDoc.UmlToFile('doc\uml-examples\export-class-OnlyRelationship-true.txt');
```
![export-class-OnlyRelationship-true.png](uml-examples/export-class-OnlyRelationship-true.png)

The UML output: **[export-class-OnlyRelationship-true.txt](uml-examples/export-class-OnlyRelationship-true.txt)**