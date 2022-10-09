function [fname]=fun2

fname=input('Give me the name of an image','s');
while exist(fname)==0
    fname=input('Give me the name of an image','s');
end