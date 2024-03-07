function [D,b]=RC_BSTrotateR(D,d)
% function [D,b]=RC_BSTrotateR(D,d)
% Apply a right rotation to a RC_BST at record d (see Figure 7.7).  (RC_BSTrotateL is similar.)
% Renaissance Codebase, https://github.com/tbewley/RC/NRchap07
% Copyright 2023 by Thomas Bewley, distributed under BSD 3-Clause License. 
% See also RC_BSTinitialize, RC_BSTinsert, RC_BSTrotateLR, RC_BSTrotateL, RC_BSTbalance, RC_BSTenumerate,
% RC_BSTsuccessor.  Verify with RC_BSTtest.

b=D(d,end-3); a=D(b,end-3); c=D(b,end-1); e=D(d,end-1); p=D(d,end-2);
if a>0, Dag=D(a,end);                else, Dag=-1; end 
if c>0, Dcg=D(c,end); D(c,end-2)=-d; else, Dcg=-1; end 
if e>0, Deg=D(e,end);                else, Deg=-1; end 
D(d,end-3)=c; D(d,end-2)=+b; D(d,end)=max(Dcg+1,Deg+1);
D(b,end-1)=d; D(b,end-2)=p;  D(b,end)=max(Dag+1,D(d,end)+1);
s=sign(p); p=abs(p); if p>0, D(p,end-2+s)=b; end
while p>0, a=D(p,end-3); if a>0, Dag=D(a,end); else, Dag=-1; end
           c=D(p,end-1); if c>0, Dcg=D(c,end); else, Dcg=-1; end, g=max(Dag+1,Dcg+1);
           if g<D(p,end), D(p,end)=g; p=abs(D(p,end-2)); else, p=0; end, end
end % function RC_BSTrotateR                               
