function [in] = function2

in = '0';
while (exist(in) == 0)
    disp('Nah');
    in = input('What dat name?', 's');
end

end

% function [fname] = function2()
% fname = '0';
% while (exist(fname) == 0)
%      disp('Nah');
%      fname = input('What dat name?', 's');
% end
% 
% end

