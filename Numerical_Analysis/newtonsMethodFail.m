% M. Neilan
% This program applies Newton's method to the function f(x) = arctan(x)
% with initial guess x0 = 1.39174520027073.  This results in a
% non-convergent (oscillating) sequence.


function newtonsMethodFail

clf;
clc;

fh = @(x)atan(x);
fhp =@(x)1./(1+x.^2);

tol = 1E-10;
MaxIter = 20;

a =-2;
b = 2;

%xk=;
xk = 1.39174520027073; %=initialguess


A = a-0.1;
B = b+0.1;



X = A:0.01:B;
F = fh(X);
C = min(F)-0.1;
D = max(F)+0.1;

if (fh(a)*fh(b)>0)
    fprintf('Error: f(a)f(b)>0.\nAborting program\n');
    return
end

%plot function with initial guess;
plot(X,F,'LineWidth',1.5);

axis([A,B,C,D]);
hold on
plot(X,zeros(size(X)),'-k'); %plot x-axis

fkplot = plot(xk,fh(xk),'+k','MarkerSize',10);

fktext = text(xk,fh(xk),'\uparrow f(x_k)',...
    'VerticalAlignment','Top',...
    'FontSize',16);

xkplot = plot(xk,0,'+k','MarkerSize',10);
xktext = text(xk,0,'\downarrow x_k',...
    'VerticalAlignment','Bottom',...
    'FontSize',16);

pause;

% for i=1:MaxIter
%     
%     Y = fhp(xk).*(X-xk)+fh(xk).*ones(1,length(X));
%     
%     tangent = plot(X,Y);
%     
%     pause;
%     
%     delete(xkplot)
%     delete(xktext)
%     delete(fkplot);
%     delete(fktext);
%     
%     xknew = xk-fh(xk)/fhp(xk);
%     
%     if abs(xknew-xk)<tol
%         
%         clf;
%         clc;
%         
%         fh = @(x)atan(x);
%         fhp =@(x)1./(1+x.^2);
%         
%         tol = 1E-10;
%         MaxIter = 20;
%         
%         a =-2;
%         b = 2;
%         
%         %xk=0.1;
%         xk = 1.39174520027073; %=initialguess
%         
%         
%         A = a-0.1;
%         B = b+0.1;
%         
%         
%         
%         X = A:0.01:B;
%         F = fh(X);
%         C = min(F)-0.1;
%         D = max(F)+0.1;
%         
%         if (fh(a)*fh(b)>0)
%             fprintf('Error: f(a)f(b)>0.\nAborting program\n');
%             return
%         end
%         
%         %plot function with initial guess;
%         plot(X,F,'LineWidth',1.5);
%         
%         axis([A,B,C,D]);
%         hold on
%         plot(X,zeros(size(X)),'-k'); %plot x-axis
%         
%         fkplot = plot(xk,fh(xk),'+k','MarkerSize',10);
%         
%         fktext = text(xk,fh(xk),'\uparrow f(x_k)',...
%             'VerticalAlignment','Top',...
%             'FontSize',16);
%         
%         xkplot = plot(xk,0,'+k','MarkerSize',10);
%         xktext = text(xk,0,'\downarrow x_k',...
%             'VerticalAlignment','Bottom',...
%             'FontSize',16);
%         
%         pause;
        
        for i=1:MaxIter
            
            Y = fhp(xk).*(X-xk)+fh(xk).*ones(1,length(X));
            
            tangent = plot(X,Y);
            
            pause;
            
            delete(xkplot)
            delete(xktext)
            delete(fkplot);
            delete(fktext);
            
            xknew = xk-fh(xk)/fhp(xk);
            
            if abs(xknew-xk)<tol
                break;
            else
                xk = xknew;
            end
            
            
            
            xkplot = plot(xk,0,'+k','MarkerSize',10);
            xktext = text(xk,0,'\downarrow x_k',...
                'VerticalAlignment','Bottom',...
                'FontSize',16);
            
            pause;
            
            
            
            fkplot = plot(xk,fh(xk),'+k','MarkerSize',10);
            fktext = text(xk,fh(xk),'\uparrow f(x_k)',...
                'VerticalAlignment','Top',...
                'FontSize',16);
            
            pause;
            delete(tangent);
        end
    end
%end
        
        % if (i<MaxIter)
        %     fprintf('Approximate root: %7.6f\n', xknew);
        %     fprintf('Number of iterations: %d\n', i);
        %     fprintf('f(xk) = %5.4e\n', fh(xknew));
        % else
        %     fprintf('Failed to find a root after %d iterations\n', i);
        % endol
        %         break;
        %     else
        %         xk = xknew;
        %     end
        %
        %
        %
        %     xkplot = plot(xk,0,'+k','MarkerSize',10);
        %     xktext = text(xk,0,'\downarrow x_k',...
        %         'VerticalAlignment','Bottom',...
        %         'FontSize',16);
        %
        %     pause;
        %
        %
        %
        %     fkplot = plot(xk,fh(xk),'+k','MarkerSize',10);
        %     fktext = text(xk,fh(xk),'\uparrow f(x_k)',...
        %         'VerticalAlignment','Top',...
        %         'FontSize',16);
        %
        %     pause;
        %     delete(tangent);
        % end
        %
        % if (i<MaxIter)
        %     fprintf('Approximate root: %7.6f\n', xknew);
        %     fprintf('Number of iterations: %d\n', i);
        %     fprintf('f(xk) = %5.4e\n', fh(xknew));
        % else
        %     fprintf('Failed to find a root after %d iterations\n', i);
        % end