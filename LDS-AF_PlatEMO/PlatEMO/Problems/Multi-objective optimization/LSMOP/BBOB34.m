classdef BBOB34 < PROBLEM
    % <multi/many> <binary> <large/none>
    % The multi-objective knapsack problem
    
    %------------------------------- Reference --------------------------------
    % E. Zitzler and L. Thiele, Multiobjective evolutionary algorithms: A
    % comparative case study and the strength Pareto approach, IEEE
    % Transactions on Evolutionary Computation, 1999, 3(4): 257-271.
    %------------------------------- Copyright --------------------------------
    % Copyright (c) 2023 BIMK Group. You are free to use the PlatEMO for
    % research purposes. All publications which use this platform or any code
    % in the platform should acknowledge the use of "PlatEMO" and reference "Ye
    % Tian, Ran Cheng, Xingyi Zhang, and Yaochu Jin, PlatEMO: A MATLAB platform
    % for evolutionary multi-objective optimization [educational forum], IEEE
    % Computational Intelligence Magazine, 2017, 12(4): 73-87".
    %--------------------------------------------------------------------------
    
    properties(Access = private)
    
    end
    methods
        %% Default settings of the problem
        function Setting(obj)
            % Parameter setting
            obj.M = 2;
            if isempty(obj.D); obj.D = 100; end
            obj.encoding = ones(1,obj.D);
            obj.lower    = -5*ones(1,obj.D);
            obj.upper    = 5*ones(1,obj.D);
        end
        %% Calculate objective values
        function PopObj = CalObj(obj,PopDec)
            PopObj(1,:) = benchmarks(PopDec',8);
            PopObj(2,:) = benchmarks(PopDec',21);
            PopObj = PopObj';
        end
        %% Generate a point for hypervolume calculation
        function R = GetOptimum(obj,N)
            R = [-1.351300000000000e+02,3.106200000000000e+02];
        end
        %% Display a population in the objective space
        function DrawObj(obj,Population)
            Popobj(1,:) = benchmarks(Population.decs',8);
            Popobj(2,:) = benchmarks(Population.decs',21);
            Popobj = Popobj';
            Draw(Popobj,{'\it f\rm_1','\it f\rm_2','\it f\rm_3'});
        end

    end
end