function X=RR_rand(M,N,P)
% function X=RR_rand(M,N,P) or X=RR_rand([M N P]) or X=RR_rand(size(A))
% Pseudorandomly generate a scalar, vector (length M), matrix (size MxN), or rank-3 array (size MxNxP),
% each entry of which is a real number uniformly distributed on the open interval (0,1)
% INPUTS: M,N,P = dimension(s) of output array (OPTIONAL, default M=N=P=1)
% OUTPUT: X     = scalar, vector, matrix, or rank-3 array of random numbers on (0,1)
% TEST: X=RR_rand(10,10)                   % 10x10 array of real numbers on (0,1)
%         Min=min(min(X)), Max=max(max(X)) 
%       Y=-2+4*RR_rand(10000);             % 10000 real numbers on (-2,2)
%         histogram(Y,[-2:0.2:2],'Normalization','probability')      
%% Renaissance Repository, https://github.com/tbewley/RR (Renaissance Robotics, Chapter 2)
%% Copyright 2024 by Thomas Bewley, published under BSD 3-Clause License.

% Calculate M, N, and P from input data
if nargin==1 & length(M)>1, N=M(2); if length(M)>2, P=M(3); end, M=M(1); end
if ~exist('M'), M=1; end, if ~exist('N'), N=1; end, if ~exist('P'), P=1; end

% Then, select a M*N*P random uint32 integer on [0,K] using RR_PCG32, add 1, normalize
% by K+2 [where K=intmax('uint32')], and reshape into the desired matrix form

X=reshape(double(RR_PCG32(M*N*P)+1)/4294967297,M,N,P);
