clc
clear all
A=[5 -1 1];
B=[8 4 2];
C=[-2;-9;-3];
ansa=A*C;
ansb=A-B;
ansc=3*A;
ansd=A.*B;
anse=B.^A;
ansf=B*C;
Part3_ans={ansa ansb ansc;ansd anse ansf};
disp(['The result of a is ' num2str(Part3_ans{1,1})])
disp(['The result of b is ' num2str(Part3_ans{1,2})])
disp(['The result of c is ' num2str(Part3_ans{1,3})])
disp(['The result of d is ' num2str(Part3_ans{2,1})])
disp(['The result of e is ' num2str(Part3_ans{2,2})])
disp(['The result of f is ' num2str(Part3_ans{2,3})])