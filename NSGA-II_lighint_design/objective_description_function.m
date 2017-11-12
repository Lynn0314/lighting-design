function [number_of_objectives, number_of_decision_variables, min_range_of_decesion_variable, max_range_of_decesion_variable] = objective_description_function()

%% function [number_of_objectives, number_of_decision_variables, min_range_of_decesion_variable, max_range_of_decesion_variable] = objective_description_function()
% This function is used to completely describe the objective functions and
% the range for the decision variable space etc. The user is prompted for
% inputing the number of objectives, numebr of decision variables, the
% maximum and minimum range for each decision variable and finally the
% function waits for the user to modify the evaluate_objective function to
% suit their need.

%  Copyright (c) 2009, Aravind Seshadri
%  All rights reserved.
%
%  Redistribution and use in source and binary forms, with or without 
%  modification, are permitted provided that the following conditions are 
%  met:
%
%     * Redistributions of source code must retain the above copyright 
%       notice, this list of conditions and the following disclaimer.
%     * Redistributions in binary form must reproduce the above copyright 
%       notice, this list of conditions and the following disclaimer in 
%       the documentation and/or other materials provided with the distribution
%      
%  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
%  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
%  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
%  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE 
%  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
%  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
%  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
%  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
%  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
%  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
%  POSSIBILITY OF SUCH DAMAGE.

g = sprintf('Input the number of objective: ');
% Obtain the number of objective function
number_of_objectives = 2;
if number_of_objectives < 2
    error('This is a multi-objective optimization function hence the minimum number of objectives is two');
end
g = sprintf('\nInput the number of decision variables: ');
% Obtain the number of decision variables
number_of_decision_variables = 5;
clc
range = ones(number_of_decision_variables,2);
range(1,1) = -20;%纵横向的角度都设置为�?��20�?
range(2,1) = -20;
range(3,1) = 0.1; %小功率LED灯，要满足频率要求，�?��>15HZ,l<1.48m
range(4,1) = 4;%隧道设计高度�?.5m,�?��设置�?
range(5,1) = 0;%车道宽度�?m，在中间建立坐标系，即灯具横向最远为4.5m

range(1,2) = 20;%纵横向的角度都设置为�?��20�?
range(2,2) = 20;
range(3,2) = 2; %小功率LED灯，要满足频率要求，�?��>15HZ,l<1.48m
range(4,2) = 4.5;%隧道设计高度�?.5m
range(5,2) = 4.5;%车道宽度�?m，在中间建立坐标系，即灯具横向最远为4.5m
for i = 1 : number_of_decision_variables
    clc
    g = sprintf('\nInput the minimum value for decision variable %d : ', i);
    % Obtain the minimum possible value for each decision variable
    min_range_of_decesion_variable(i) = range(i,1);
    g = sprintf('\nInput the maximum value for decision variable %d : ', i);
    % Obtain the maximum possible value for each decision variable
    max_range_of_decesion_variable(i) = range(i,2);
    clc
end
g = sprintf('\n Now edit the function named "evaluate_objective" appropriately to match your needs.\n Make sure that the number of objective functions and decision variables match your numerical input. \n Make each objective function as a corresponding array element. \n After editing do not forget to save. \n Press "c" and enter to continue... ');
% Prompt the user to edit the evaluate_objective function and wait until
% 'c' is pressed.
%   
