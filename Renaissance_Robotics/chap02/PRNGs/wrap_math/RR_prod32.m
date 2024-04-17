function [p,c]=RR_prod32(x,y)
% function [p,c]=RR_prod32(x,y)
% INPUTS:  x, y are each uint32 (or single,double)
% OUTPUTS: p=x*y is uint32
%          c=carry part (uint32, can ignore for wrap on uint32 overflow)
% TEST: x=intmax('uint32'), y=3, [p,c]=RR_prod32(x,y)
%% Renaissance Repository, https://github.com/tbewley/RR (Renaissance Robotics, Chapter 2)
%% Copyright 2024 by Thomas Bewley, published under BSD 3-Clause License.

t=uint64(x)*uint64(y);  % Note: intermediate math is uint64
p=uint32(bitand(t,0xFFFFFFFFu64)); c=uint32(bitsra(t,32));
