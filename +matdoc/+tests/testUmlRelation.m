classdef testUmlRelation < matlab.unittest.TestCase
   
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
        
        %% - test_Type(testCase)
        function test_Type(testCase)
            % function test_Type(testCase)
            % 
            % This function will test the fromStr() and getPlantUML()
            % methods of the matdoc.uml.relation.Type class.
            
            % define the possible arrow heads
            avTipHeads = {'', 'o', '*', '#', 'x'};
            avTipHeadsLeft = horzcat({'<|', '<', '}'}, avTipHeads);
            avTipHeadsRight = horzcat({'|>', '>', '{'}, avTipHeads);
            avBodies = {'--', '..'};
            
            TipCntLeft = length(avTipHeadsLeft);
            TipCntRight = length(avTipHeadsRight);
            BodyCnt = length(avBodies);
            
            % test every possible 
            for iBody = 1:BodyCnt
                curBody = avBodies{iBody};
                for iLeft = 1:TipCntLeft
                    curLeftTip = avTipHeadsLeft{iLeft};
                    for iRight = 1:TipCntRight
                        curRightTip = avTipHeadsRight{iLeft};
                        
                        % build the uml string
                        umlStr = sprintf('%s%s%s', curLeftTip, curBody, curRightTip);
                        
                        % get the current type
                        curType = matdoc.uml.relation.Type.fromStr(umlStr);
                        
                        testCase.assertEqual(curType.getPlantUML(), umlStr);
                        
                    end % for iRight = 1:TipCntRight
                end % for iLeft = 1:TipCntLeft
            end % for iBody = 1:BodyCnt
            
        end % function test_Type_fromStr(testCase)
        
    end % methods (Test)
    
end % classdef testUmlRelation < handle
