%% LOOPS

%Compute the sum 1 through 5 without using sum function, but using a loop:

%Set total to 0
%Set n to 1
%Execute Add n to total (total equals 1) - 1st iteration
%Set n to 2
%Execute Add n to total (total equals 1) - 2nd iteration
%Set n to 3 and so on

%% FOR-LOOPS

%this is in fact done by a for-loop, only implicitly
u = [5 4 8 8 2];
v = [5 5 7 8 8];
w = u -v

%the same with an explicitly loop
for ii = 1:lenght(u)
    w(ii) = u(ii) - v(ii);
end


%% NESTING LOOPS

% implicit loop, see mul.m for explicit loop
A = randi(10,3,4)
P = A.*A

% see mul and asterisks

%% WHILE LOOPS

% good when you are not sure how many iterations you need
% schematically similar to an if-statement
% see possum and approx_sqrt


%% BREAK STATEMENTS

% See BreakExamples, BadBreak, GoodBreak

% There is also a continue statement, but its rarely used

%% LOGICAL INDEXING

%unique to matlab

%a typical solution
w = [];
jj = 0;
for ii = 1:lenght(v)
    if v(ii) >= 0
        jj = jj + 1;
        w(jj) = v(ii);  %double indexing
    end
end

%a possible matlab solution:
w = [];
for ii = 1:lenght(v)
    if v(ii) >= 0
        w = [w v(ii)];  % we are appending v(ii) to w
    end
end

%logical indexing solution:

w = v(v >= 0); %

% logical arrays:

[4 -1 7 5 3] > [5 -9 6 5 -3] %gives a logical vector as an output

c = [2>1, 2<1, ~(3>2 && 4>5)] %also gives a logical vector

% using a builtin function:

h = logical([1 -2 0 0 9.12 -2])

% logical indexing:

a = 1:3
a(c) % returns the values of a for which c has a logical value of true

rng(0);
r = randi(10,1,6)
h
r(h)

% an application: remove negative values
v = [56, 34, -2, 7, 29, 53, 30, -3, 5, 45]
keepers = v >= 0
w = v(keepers)

% NOTA BENE: one line command for above. (This is very useful!)
w = v(v>=0)

% Omitting values from v that are associated with a confidence value less than 10: 
confidence = [100 97 11 12 76 76 80 9 4 98]
v_10 = v(confidence >= 10)

% another application:
v0 = [50 35 -8 5 30 49 30 0 10 50]
v_bigger = v(v <v0)

% note that the base vector is not changed! Logical indexing is on the
% right side of =, produces a subset of elements.

% If you want to affect the original vector: logical indexing on the left
% side, change a subset of elements. 

%Replace negative values with zeros:
v = [56, 34, -2, 7, 29, 53, 30, -3, 5, 45]
v(v<0) = 0

%
v = [56, 34, -2, 7, 29, 53, 30, -3, 5, 45]
v(v<0) = [100 200]

% Using both left and right logical indexing:
v = [56, 34, -2, 7, 29, 53, 30, -3, 5, 45]
v(v<0) = v(v<0) + 100 % 100 added only to the two elements that are 
                        %produced by the right logical indexing

% Logical indexing for matrices

% Logical indexing right side transforms arrays ALWAYS into a col vector
A = [1 2 3;4 5 6]
B = A(A>2)              %transformed into a column vector by stacking the columns of the array

A_colmajor = A(:)
C = A_colmajor(A_colmajor>2) 

% Logical indexing left side:
rng(0); A = randn(5)
A(A<0) = 0

rng(0); A = randn(5)
A(A<0) = 101:108        %these are assigned in the column major order

rng(0); A = randn(5);
A(A<0) = 101:108'       %tranposing makes no difference

% note that the number of values to be changed must equal the number of the
% replacement values, otherwise this will not work

% Logical indexing on both sides:
rng(0); A = randn(5);
A(A>0.1) = sqrt(A(A>0.1)) % the same amount of elements has to "fed and eaten" by the logical indexing on both sides

% Multiple arrays and logical indexing:

A = [89 82 11 53;33 5 59 42]
B = [34 44 52 64;62 73 58 99]
A((A>B)) = A(A>B) - B(A>B)    

%% PREALLOCATION

% How to time a function?

tic; sum(1:1e3); toc
tic; sum(1:1e8); toc

% See noprealloc, prealloc

% Preallocation means allocating the needed amount of memory for a function
% It should be used always if you know the dimensions of a big array


