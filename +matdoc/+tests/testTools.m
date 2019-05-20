classdef testTools < matlab.unittest.TestCase
    
    %% PROPERTIES: ACCESS = PROTECTED
    properties (Access = protected)
        
    end % properties (Access = protected)
    
    %% PROPERTIES: CONSTANT
    properties (Constant)
        
    end % properties (Constant)
    
    %% METHODS: Setup
    methods (TestMethodSetup)
        
    end % methods (TestMethodSetup)
    
    %% METHODS: Teardown
    methods (TestMethodTeardown)
        
    end % methods (TestMethodTeardown)
    
    %% METHODS: TEST
    methods (Test)
        
        %% - test_isClassOrPackage(testCase)
        function test_isClassOrPackage(testCase)
            % function test_isClassOrPackage(testCase)
            %
            % This function will test ...
            
            % Let's test some existing classes and packages
            testCase.assertTrue(matdoc.tools.isClassOrPackage('handle'));
            testCase.assertTrue(matdoc.tools.isClassOrPackage('double'));
            testCase.assertTrue(matdoc.tools.isClassOrPackage('cell'));
            testCase.assertTrue(matdoc.tools.isClassOrPackage('matdoc'));
            testCase.assertTrue(matdoc.tools.isClassOrPackage('matdoc.tests'));
            testCase.assertTrue(matdoc.tools.isClassOrPackage('matdoc.Documentation'));
            testCase.assertTrue(matdoc.tools.isClassOrPackage('matdoc.uml.super'));
            testCase.assertTrue(matdoc.tools.isClassOrPackage('matdoc.uml.super.Base'));
            testCase.assertTrue(matdoc.tools.isClassOrPackage('matdoc.meta'));
            testCase.assertTrue(matdoc.tools.isClassOrPackage('matdoc.meta.Class'));
            testCase.assertTrue(matdoc.tools.isClassOrPackage('matdoc.meta.super.Container'));
            testCase.assertTrue(matdoc.tools.isClassOrPackage('matdoc.enums.AccessLevel'));
            
            % Let's add some typos the names. Th
            testCase.assertFalse(matdoc.tools.isClassOrPackage('duble'));
            testCase.assertFalse(matdoc.tools.isClassOrPackage('mtdoc.Documentation'));
            testCase.assertFalse(matdoc.tools.isClassOrPackage('Matdoc.Documentation'));
            
        end % function test_isClassOrPackage(testCase)
        
        %% - test_isBuiltIn(testCase)
        function test_isBuiltIn(testCase)
            % function test_isBuiltIn(testCase)
            %
            % This function will test ...
            
            % Let's test some built-in methods and classes
            testCase.assertTrue(matdoc.tools.isBuiltIn('handle'));
            testCase.assertTrue(matdoc.tools.isBuiltIn('double'));
            testCase.assertTrue(matdoc.tools.isBuiltIn('cell'));
            
            % Let's test some custom functions and classes
            testCase.assertFalse(matdoc.tools.isClassOrPackage('run_tests'));
            testCase.assertFalse(matdoc.tools.isClassOrPackage('matdoc.tools.isBuiltIn'));
            testCase.assertFalse(matdoc.tools.isClassOrPackage('matdoc.tools.faststrsplit'));
            testCase.assertFalse(matdoc.tools.isClassOrPackage('matdoc.tools.string2hash'));
            testCase.assertFalse(matdoc.tools.isClassOrPackage('matdoc.tools.metaFromStr'));
            
        end % function test_isBuiltIn(testCase)
        
        %% - test_faststrsplit(testCase)
        function test_faststrsplit(testCase)
            % function test_faststrsplit(testCase)
            %
            % This function will test ...
            
            % Let's test some different cases and compare it to the output
            % of strsplit
            theStr = '';
            thePattern = ' ';
            testCase.assertEqual(...
                matdoc.tools.faststrsplit(theStr, thePattern),...
                strsplit(theStr, thePattern)...
                );
            theStr = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
            thePattern = ' ';
            testCase.assertEqual(...
                matdoc.tools.faststrsplit(theStr, thePattern),...
                strsplit(theStr, thePattern)...
                );
            theStr = 'matdoc.uml.super.Base';
            thePattern = '.';
            testCase.assertEqual(...
                matdoc.tools.faststrsplit(theStr, thePattern),...
                strsplit(theStr, thePattern)...
                );
            
        end % function test_faststrsplit(testCase)
        
        %% - test_isUmlRelation(testCase)
        function test_isUmlRelation(testCase)
            % function test_isUmlRelation(testCase)
            %
            % This function will test ...
            
            
            % Let's test some stuff which is valid syntax
            testCase.assertTrue(matdoc.tools.isUmlRelation('matdoc.Documentation <|-- matdoc.Configuration'));
            testCase.assertTrue(matdoc.tools.isUmlRelation('matdoc.Documentation *-- matdoc.Configuration'));
            testCase.assertTrue(matdoc.tools.isUmlRelation('matdoc.Documentation o-- matdoc.Configuration'));
            testCase.assertTrue(matdoc.tools.isUmlRelation('matdoc.Documentation .. matdoc.Configuration'));
            testCase.assertTrue(matdoc.tools.isUmlRelation('matdoc.Documentation -- matdoc.Configuration'));
            testCase.assertTrue(matdoc.tools.isUmlRelation('matdoc.Documentation <|.. matdoc.Configuration'));
            testCase.assertTrue(matdoc.tools.isUmlRelation('matdoc.Documentation --> matdoc.Configuration'));
            testCase.assertTrue(matdoc.tools.isUmlRelation('matdoc.Documentation ..> matdoc.Configuration'));
            testCase.assertTrue(matdoc.tools.isUmlRelation('matdoc.Documentation ..|> matdoc.Configuration'));
            testCase.assertTrue(matdoc.tools.isUmlRelation('matdoc.Documentation <--* matdoc.Configuration'));
            testCase.assertTrue(matdoc.tools.isUmlRelation('matdoc.Documentation #-- matdoc.Configuration'));
            testCase.assertTrue(matdoc.tools.isUmlRelation('matdoc.Documentation x-- matdoc.Configuration'));
            testCase.assertTrue(matdoc.tools.isUmlRelation('matdoc.Documentation }-- matdoc.Configuration'));
            testCase.assertTrue(matdoc.tools.isUmlRelation('matdoc.Documentation +-- matdoc.Configuration'));
            testCase.assertTrue(matdoc.tools.isUmlRelation('matdoc.Documentation ^-- matdoc.Configuration'));
            testCase.assertTrue(matdoc.tools.isUmlRelation('matdoc.Documentation "1" *-- "many" matdoc.Configuration : contains safas'));
            testCase.assertTrue(matdoc.tools.isUmlRelation('matdoc.Documentation o-- matdoc.Configuration : aggregation'));
            testCase.assertTrue(matdoc.tools.isUmlRelation('matdoc.Documentation --> "1" matdoc.Configuration'));
            testCase.assertTrue(matdoc.tools.isUmlRelation('matdoc.Documentation - matdoc.Configuration : drives >'));
            testCase.assertTrue(matdoc.tools.isUmlRelation('matdoc.Documentation *- matdoc.Configuration : have 4 >'));
            testCase.assertTrue(matdoc.tools.isUmlRelation('matdoc.Documentation -- matdoc.Configuration : < owns'));
            
            % now let's mess up the sintax a bit to check if it can be detected as
            % invalid
            testCase.assertFalse(matdoc.tools.isUmlRelation(''));
            testCase.assertFalse(matdoc.tools.isUmlRelation('matdoc.Documentation'));
            testCase.assertFalse(matdoc.tools.isUmlRelation('matdoc.Documentation matdoc.Configuration'));
            testCase.assertFalse(matdoc.tools.isUmlRelation('matdoc.Documentation<|-- matdoc.Configuration'));
            testCase.assertFalse(matdoc.tools.isUmlRelation('matdoc.Documentation <|--matdoc.Configuration'));
            testCase.assertFalse(matdoc.tools.isUmlRelation('matdoc.Documentation<|--matdoc.Configuration'));
            testCase.assertFalse(matdoc.tools.isUmlRelation('matdoc.Documentation 1 *-- "many" matdoc.Configuration : contains'));
            testCase.assertFalse(matdoc.tools.isUmlRelation('matdoc.Documentation "1" *-- many" matdoc.Configuration : contains'));
            testCase.assertFalse(matdoc.tools.isUmlRelation('matdoc.Documentation "1" *-- "many" matdoc.Configuration: contains'));
            testCase.assertFalse(matdoc.tools.isUmlRelation('matdoc.Documentation "1" *-- "many" matdoc.Configuration :contains'));
            testCase.assertFalse(matdoc.tools.isUmlRelation('matdoc.Documentation "1" *-- "many" matdoc.Configuration contains'));
            testCase.assertFalse(matdoc.tools.isUmlRelation('matdoc.Documentation "1" *-- "many" NonExistingClass : contains'));
            testCase.assertFalse(matdoc.tools.isUmlRelation('NonExistingClass "1" *-- "many" matdoc.Configuration contains'));
            
            
        end % function test_isUmlRelation(testCase)
        
    end % methods (Test)
    
end % classdef testTools < handle
