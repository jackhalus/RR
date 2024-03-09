function RR_Dad_Jokes(i_max)
% Modifies a random sequence of integers generated by Matlab's randi command to
% eliminate integers that appear as the n+1=8 most recent integers in the sequence.
% Each integer corresponds to a "joke" in a "dictionary".
% TEST: RR_Dad_Jokes      % tells one joke drawn randomly from the dictionary
%       RR_Dad_Jokes(64)  % tells 64 jokes, without recent repeats
% TODO: replace the "jokes" below with jokes that are actually funny.
%       (left as an exercise by the discerning reader...)
%% Renaissance Repository, https://github.com/tbewley/RR (Renaissance Robotics, Chapter 2)
%% Copyright 2024 by Thomas Bewley, published under BSD 3-Clause License.

if nargin<1, i_max=1; end
told=[]; rng('shuffle'), j=randi([0,15]); n=7; for i=1:i_max 
  while ~isempty(find(told(max(end-n,1):end)==j)), j=randi([0,15]); end
  told=[told,j];
end
if i_max>8, told, end

dictionary=[...
"Why doesn’t anybody talk to circles? Because there's no point.";...
"You know what seems odd?  Numbers that can’t be evenly divided by two.";...
"Why are elevator jokes so good? Because they work on many levels.";...
"What do you call a factory that makes products that are just OK? A satisfactory.";...
"Why do seagulls fly over the ocean? Because if they flew over the bay, they'd be called bagels";...
"I only know 25 letters of the alphabet. I don't know y.";...
"What is the only alphabet in the world with 52 letters? Canadian. A, eh? B, eh? C, eh? ...";...
"What's the best thing about Switzerland? I don't know, but the flag is a big plus.";...
"When does a joke become a dad joke?  When it becomes apparent.";...
"If you see a crime happen at the Apple store, what does it make you?  An iWitness.";...
"What did one hat say to the other? Stay here! I'm going on ahead.";...
"There are 3 kinds of people in the world: those who can count, and those who can't.";...
"There are 2 types of people in the world: those who divide the world into 2 types of people, and those like me.";...
"A farmer counted 396 cows in his field.  But when he rounded them up, he had 400.";...
"I ordered a chicken and an egg from Amazon. I'll let you know.";...
"Do you wanna box for your leftovers? No, but I'll wrestle you for them."];

for i=1:i_max; disp(dictionary(told(i)+1)), if i<i_max, pause, end, end
end
