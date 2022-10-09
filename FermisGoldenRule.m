% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     golden.m   solves the diff. equations for the Fermi Golden Rule
%     Made by Atomic Physics, Bergen, L. Kocbach  Okt 20.-Nov 15. 1996
%     This version is contained in one m-file. Other versions exist.
%
%     There is a quite extensive help inside. To start, press the
%   > CALC button. The slider can be used to move in time. 
%
%   > Problem: golden will not start, nothing happens.
%     Solution:   enter the command:     clear all
%     This occurs when you crashed golden or in similar
%     situations.
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

if ( ~exist('GoldenRuleFl') ) 
    GoldenRuleFl=0;
end;
if GoldenRuleFl==0
  if exist('HelpfigNumber')
   if HelpfigNumber~=3335, delete(HelpfigNumber);end;
  end;
  clear A To0 pp2   Bstop  V0 pp3   Cdone axHndl  runner       
  clear E0 calling  s1 EnerBut count  s2  ...  
  GOLDCALC  defolt s3  GOLDCONT deltaE s4  GOLDHELP energ t ...    
  GOLDINIT frmPos t0 GTf from0  tfinal GTfL gV0  titleStr ...    
  GTs gnnn tocalc  GTsL gtfin todestroy GUIbuild  gth tout ...  
  GVi h uu GViL helpStr1 vect Gnn helpStr2  vv ...   
  GnnL helpStr3 vvv GoMore  helpStr4 xpos  
  clear HelpfigNumber hlp xx ...    
  OnWhat k youtPausing  kgt yp ReDo kk ypos STf kmax yv ...   
  STs matr yy SVi nn zzz SlidK nnn Snn onestep TextStrs pp1   
 
  GoldenRuleFl=1;
  GOLDINIT=1; GOLDCALC=2; GOLDCONT=3; GOLDHELP=4;GUIbuild=6;
  calling=0;
  todestroy=0;onestep=0; from0=0; runner=0;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  Cdone=0;
  % 
  % Based on the Expo help function
  % 
  HelpfigNumber=3335;
     TextStrs=[ 'About'
                'Using'
                'Use 2'
                'Hints'];
   helpStr1= ...                                                        
	['  The Golden Rule Simulator solves   '  
	 '  time-dependent Schrodinger equation'
	 '                                     '
	 '  The hamiltonian matrix has a form  '
	 '                                     '
	 '   [ E   V   V   V   V   V   V   V   '
	 '     V  -n   0   0   0   0   0   0   '
	 '     V   0 -n+1  0   0   0   0   0   '
	 '     V   0   0  -n+2 0   0   0   0   '
	 '     V   0   0   0   E   0   0   0   '
	 '     V   0   0   0   0   n-2 0   0   '
	 '     V   0   0   0   0   0  n-1  0   '
	 '     V   0   0   0   0   0   0   n ] '
	 '                                     '	 	 
	 '  -----------------------------------'
	 '                                     '
	 '  The purpose is to show how the     '
	 '  probability flows to quasicontinuum'];
   helpStr2= ...
	['  TO START: PRESS the Button CALC !! '  
	 '  When started, it solves the TDSE.  '    
	 '  After the solution is finished, it '
	 '  repeats showing the solution.      '
	 '  1. Stop button during the solution '
	 '     stops the solution at the given '
	 '     time. It immediately shows it,  '
	 '     i.e. there is still motion.     '
	 '  2. Stop button during showing phase'
	 '     stops the animation at a given t'
	 '     It can be made to move pressing '
	 '     the button <cont>.              '	 
	 '  3. The button <cont> resumes the   '
	 '     animation.                      '
	 '  4. Button <t=0> moves the animation'
	 '     at the start. If during calc.,  '
	 '     works as stop; Animation is set '
	 '     to t=0. If no motion, one step. '];
   helpStr3= ...
	['  5. Popul(ation) shows the amplitude'
	 '    squared of the static solution   '
	 '  6. CALC(ulate): use the current    ' 
	 '     parameters and repeat the calc. '
	 '     or start the first time!!!      '
	 '  7. tmax= shows the value used til  '
	 '    now. To set a new value, enter   '
	 '    it in the editable field <tm> and'
	 '    hit Return                       '
	 '  8. dt=  and dt as in 7.            '
	 '  9. Vint= and Vi, as 7.             '
	 '  10. Std.Val sets all values to the '
	 '      initial ones.                  '
	 '  11. The slider stops animation and '
	 '     moves it to the selected time.  '  
	 '  12. The vertical slider (right)    '
	 '     changes the scale of population '	 
	 '     display.                        '
	 '-------------------------------------'
	 '                                     ']; 
   helpStr4= ...	 
	['Hints:                               '
         ' Try to run with small values of nn  '
         ' It will show that you do not get    '
         ' smooth decay if the number is not   '
         ' large enough.                       '
         '                                     '
         ' Try to run with large number of nn  '
         ' Then the energy range gets wider    '
         '                                     '
         ' Try to run with tm large (above 150)'
         ' You will observe reccurrence!       '
         ' It is very nice with very large tm  '
         ' You can reduce computation if dt~0.5'
	 '-------------------------------------'];	
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %
  % Model parameters
  %
    V0=0.08;          %% strength of the coupling
    E0=1;             %% The discrete state energy
    deltaE=0.05;      %% Spacing between the quasicontinuum
    h=0.2;            %% Time step
    t0=0;             %% Time origin 
    tfinal=10;        %% Time end
    nn=30;            %% Number of states parameter  
    nnn=2*nn+2;       %% Total number of states
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  gV0=V0;  gnnn=nn; gtfin=tfinal; gth=h; 
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

          calling=GOLDINIT;  golden;
          calling=GUIbuild;  golden;
else  
  %
  %
  %
if todestroy==1, GoldenRuleFl=0; end;
if calling==GUIbuild  
  %%%%%%   GRAPHICS and GUI  %%%%%%
   axHndl=figure(  'position',[16 64 1008 420], ...  
        'Name', 'Fermi Golden Rule Simulator ' , ...
        'NumberTitle','off');  
   
   set(axHndl,'Interruptible','yes'); 
   runner=0;
  %
      frmPos=[0 0 66 410];
      vvv=uicontrol( ...
        'Style','frame', ...
        'Units','pixels', ...
        'Position',frmPos, ...
	'BackgroundColor',[0.5 0.1 0.2]);	
  %
  % Finish the Program, close all windows
  %
   Bstop = uicontrol('style','push','string','close',...
    'position',[3 5  60 20], ...
    'callback', [ 'if runner==0,delete(gcf),else,'...
     'todestroy=1; fdestroy=gcf; runner=0;GoldenRuleFl=0;' ...
     'if(HelpfigNumber~=3335), delete(HelpfigNumber);end;' ... 
       ' HelpfigNumber=3335;  end; GoldenRuleFl=0;' ],...
    'Interruptible','yes');
  %
  % Stop animation or stop calculation
  %
   Pausing = uicontrol('style','push','string','stop ',...
    'position',[3 30  60 20], ...
    'callback', ' runner=0; tocalc=0;' ,...
    'Interruptible','yes'); 
    tocalc=1;
  %
  % Go to t=0
  %
   To0 = uicontrol('style','push','string','t=0 ',...
    'position',[3 105  60 20], ...
    'callback', [' if (Cdone==1)&tocalc==1,runner=0; tocalc=0; kmax=k-1;  else'...
               ' from0=1; '...
               ' if (Cdone==1)&runner==0, onestep=1;'...
               '  calling=GOLDCONT; golden; end; end;'] ,...
    'Interruptible','yes'); 
    tocalc=1;  
  %
  % Continue animation
  %
   GoMore = uicontrol('style','push','string',' cont ',...
  'position',[3 55  60 20], ...
  'callback', [' if (Cdone==1)&(runner==0)&(todestroy==0)&(tocalc==0),'...
  'runner=1; calling=GOLDCONT; golden; end; ' ],...
  'Interruptible','yes');  
  %
  % help
  %
  titleStr='Golden Rule Simulator';OnWhat='Golden Rule';
   hlp= uicontrol('Style','push','Position',...
     [3 80  60 20],...  
     'Callback',...
     'calling=GOLDHELP; golden; ',...
     'String',' Help ');
  %
  % Plot Eigenenergies
  %
   EnerBut=uicontrol('style','push','string','Popul.',...
  'position',[3 130  60 20], ...
  'callback', [ 'if Cdone==1,figure(axHndl); subplot(2,1,1);' ...
                'plot(xpos,ypos,''o''); end'],...  
  'Interruptible','yes'); 
  %
  %   Do the Calculation
  %     
   ReDo=uicontrol('style','push','string',' CALC ',...
    'position',[3 155  60 20], ...
    'callback', [ 'if runner==0,tocalc=1; runner=1; nn=10; '...
    'calling=GOLDINIT; golden; ' ... 
    ' figure(axHndl); subplot(2,1,1);cla;subplot(2,1,2);cla;'...
    'calling=GOLDCALC; golden; end'],...  
    'Interruptible','yes');
  %
  %  Tfinal
  %
  STf=uicontrol('Style','text',...
   'Position',[3 205  60 20],'String',['tmax=' num2str(tfinal)]);
  set(STf,'String',['tm=' num2str(tfinal)]);   
  GTfL=uicontrol('Style','text',...
   'Position',[3 180  25 20],'String',['tm']);
  GTf= uicontrol('Style','edit','Position',...
    [28 180  35 20],...
    'Callback',['gtfin=str2num(get(GTf,''String''));'...
    'set(GTf,''String'',num2str(gtfin));'],...
    'String','       '); %% init:  tfinal=gtfin;    
  %
  %  h: tstep
  %
  STs=uicontrol('Style','text',...
   'Position',[3 255  60 20],'String',['d t=' num2str(h)]);
  set(STs,'String',['dt=' num2str(h)]);   
  GTsL=uicontrol('Style','text',...
   'Position',[3 230  25 20],'String',['dt']);
  GTs= uicontrol('Style','edit','Position',...
    [28 230  35 20],...
    'Callback',['gth=str2num(get(GTs,''String''));'...
    'set(GTs,''String'',num2str(gth));'],...
    'String','       '); %% init:  h=gth;   
  %
  %  Vint  interaction strength
  %
  SVi=uicontrol('Style','text',...
   'Position',[3 305  60 20],'String',['Vi=' num2str(V0)]);
  set(SVi,'String',['Vint=' num2str(V0)]);
  GViL=uicontrol('Style','text',...
   'Position',[3 280  25 20],'String',['Vi' ]);
  GVi= uicontrol('Style','edit','Position',...
    [28 280  35 20],...
    'Callback',['gV0=str2num(get(GVi,''String''));'...
    'set(GVi,''String'',num2str(gV0));'],...
    'String','       ');  %%  init:  V0=gV0;  
  %
  %  n/2   number of states
  %
  Snn=uicontrol('Style','text',...
   'Position',[3 355  60 20],'String',['nn=' num2str(nn)]);
  set(Snn,'String',['n1/2=' num2str(nn)]);

  GnnL=uicontrol('Style','text',...
   'Position',[3 330  25 20],'String',['nn' ]);

  Gnn= uicontrol('Style','edit','Position',...
    [28 330  35 20],...
    'Callback',['gnnn=str2num(get(Gnn,''String''));'...
    'set(Gnn,''String'',num2str(gnnn));'],...
    'String','       ');    %%  init:   nn=gnnn;           
   defolt=uicontrol('style','push','string','Std.Val',...
  'position',[3 380  60 20], ...
  'callback', 'gV0=0.08;  gnnn=30; gtfin=10; gth=0.2;',...
  'Interruptible','yes');  

  HeighTxt=uicontrol('Style','text','Units','normalized',...
   'Position',[0.92 0.43 0.06 0.05],'String',num2str(konst));
  set(HeighTxt,'String', num2str(konst));

  HeigSli = uicontrol('style','slider',...
  'min',1,'max',nn*0.8,...
   'Units','normalized', ...
   'value',konst,    ...
  'position',[0.94,0.5,0.02,0.45],...
  'callback',[  '  konst=get(HeigSli,''value'');'...
                '  set(HeighTxt,''String'', num2str(konst));' ...
                '  ypos=konst*vect(1,:).*vect(1,:);']);   

  SlidK=uicontrol('style','slider');
  set(SlidK,'min',0,'max',0,...
   'Units','normalized', ...
  'position',[0.1,0.005,0.85,0.03],...
  'callback',...
  ['runner=0;if Cdone==1 ,  kgt=get(SlidK,''value'');'...
   'if(kgt<k), from0=1; runner=0; onestep=1;calling=GOLDCONT; golden;  end;'...
   'k=kgt;runner=0; onestep=1; calling=GOLDCONT; golden; end;']);
%%
%%
end     %%%  GUI part
%%
%%
if(calling==GOLDINIT)
   clear yv;clear  yy ; clear  xx;clear  yp;clear  vv;
   clear zzz;clear A;clear tout;clear yout; clear energ;
   clear yv;clear  yy ; clear  xx;
   clear  yp;clear  vv;  clear  yv;
   clear s1;
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   %    V0=0.08;          %% strength of the coupling
        E0=1;             %% The discrete state energy
        deltaE=0.05;      %% Spacing between the quasicontinuum
   %    h=0.2;            %% Time step
        t0=0;             %% Time origin 
   %    tfinal=10;        %% Time end
   %    nn=30;            %% Number of states parameter  
   %    nnn=2*nn+2;       %% Total number of states
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   V0=gV0;  nn=gnnn; tfinal=gtfin; h=gth;nnn=2*nn+2;
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   tout(500)=0;           % Time storage  (500 steps...)
   yout(nnn,500)=0;       % Probabilities storage
   yy(nnn)=0;             % Amplitudes at a given time
   vv=yy; yp=yy;
   yy=yy';s1=yy;s2=yy;s3=yy;
   yy(1)=1;
   konst=4;  %  The scale of display vertical
   %
   % Model construction
   %
   A(nnn,nnn)=0;           % A is the Hamiltonian
   A(1,1)=E0;
   A(1+nn+1,1+nn+1)=E0;
   for kk=1:nn
     A(1+nn+1-kk,1+nn+1-kk)=E0-deltaE*kk;
     A(1+nn+1+kk,1+nn+1+kk)=E0+deltaE*kk;
   end
   for kk=2:nnn
     A(kk,1)=V0;
     A(1,kk)=V0;
   end
   [vect matr ]=eig(A);  %  Diagonalize the Hamiltonian
   xpos=9+nn+(diag(matr)-E0)/deltaE;xpos=xpos';
   ypos=konst*vect(1,:).*vect(1,:);
                      % xpos and ypos are for showing 
                      % the static spectrum (shown by dots
   %energy differences
   energ=diag(A)-A(1,1); %  Used in Runge-Kutta
   zzz=energ;
%%%
%%%
end;       %%%%%    end   goldinit part
%%%
%%%
% 
if(calling==GOLDCALC)
%   
 figure(axHndl);hold off;
 subplot(2,1,1); 
% if(Cdone==0)
 %  pos1=get(gca,'position');
%   pos1(1)=1.1*pos1(1);
%   set(gca,'position',pos1);
% end;
 hold off;  
    axis([0,nnn+10,0,1]); hold on
 figure(axHndl);
 subplot(2,1,2); hold off;
%  if(Cdone==0)
 %  pos2=get(gca,'position');
  % pos2(1)=1.1*pos2(1);
  % set(gca,'position',pos2);
% end;
    axis([0,tfinal,0,1])
    xlabel('t');
    ylabel('|a2|^2');    
  hold on
  set(axHndl, 'BackingStore','on');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(STf,'String',['tmax=' num2str(tfinal)]);  
set(Snn,'String',['n1/2=' num2str(nn)]);
set(SVi,'String',['Vint=' num2str(V0)]);
set(STs,'String',['d t=' num2str(h)]);
set(HeigSli,'max',nn*0.8,'value',konst);
set(HeighTxt,'String', num2str(konst));   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%%%%%  SOLUTION OF TDSE
    t=t0;k=0;
    while (t < tfinal)& runner==1      %%  until the tfinal
      %%% Runge Kutta steps
      s1 = 0*yy ;
          zzz=V0*exp(i*energ*t);
          s1(2:nnn)=-i*zzz(2:nnn)*yy(1);
          s1(1)=-i*(zzz(2:nnn))'*yy(2:nnn);
      s2 = 0*yy ;
      uu=(yy+h*s1*0.5);      
          zzz=V0*exp(i*energ*(t+h*0.5));
          s2(2:nnn)=-i*zzz(2:nnn)*uu(1);
          s2(1)=-i*zzz(2:nnn)'*uu(2:nnn);
      s3 = 0*yy ;
      uu=(yy+h*s2*0.5);      
          %% zzz=V0*exp(i*energ*(t+0.5*h));
          s3(2:nnn)=-i*zzz(2:nnn)*uu(1);
          s3(1)=-i*zzz(2:nnn)'*uu(2:nnn);
      s4= 0*yy ; 
      uu=(yy+h*s3);          
          zzz=V0*exp(i*energ*(t+h));
          s4(2:nnn)=-i*zzz(2:nnn)*uu(1);
          s4(1)=-i*zzz(2:nnn)'*uu(2:nnn);
      t = t + h;
      yy = yy + h*(s1 + 2*s2 + 2*s3 + s4)/6;
      %%% Runge Kutta steps done
      k = k+1;
      tout(k) = t;
      yout(:,k) = conj(yy).*yy;
      %
      %%%    Start plotting
      %
      if(k==1)
          figure(axHndl);
         subplot(2,1,1);hold off;
           xx=9:nnn+8; xx(1)=3;  
           xx=[xx;xx;xx];xx=reshape(xx,3*nnn,1);
           yp=conj(yy).*yy;
           yp(2:nnn)=konst*yp(2:nnn);
           yv=[vv;yp';vv];yv=reshape(yv,3*nnn,1);
           figure(axHndl);
           pp1=  plot(xx,yv,'-');hold on;
           figure(axHndl);
           plot(xpos,ypos,'.');
            set(pp1,'erase','background'); 
            set(pp1,'interruptible','yes');
      else
         subplot(2,1,1);
           yp=conj(yy).*yy;
           yp(2:nnn)=konst*yp(2:nnn);
           yv=[vv;yp';vv];yv=reshape(yv,3*nnn,1);
         set(pp1,'Ydata', yv );          
      end
      drawnow 
      if(k==2)
         figure(axHndl);
         subplot(2,1,2);hold off;
           pp2=line([tout(k-1),tout(k)],[yout(1,k-1),yout(1,k)]); 
           set(pp2,'erase','none');   
           pp3=line( [tout(1) tout(2)] ,[1 1]);     
           set(pp3,'erase','none'); 
            set(pp2,'interruptible','yes');
            set(pp3,'interruptible','yes');
            drawnow; 
      end
      % Continue plotting     
      if(k>2)
         set(pp2,'Xdata',tout(1:k),'Ydata',yout(1,1:k)); 
         drawnow 
         set(pp3,'Xdata',[ tout(1) tout(k)]);
        drawnow 
      end 
      %%%    Plotting step finished 
      if todestroy==1 
       delete(fdestroy); runner=0; 
       if(HelpfigNumber~=3335) delete(HelpfigNumber);
       end; 
       HelpfigNumber=3335;GoldenRuleFl=0;
      end;     
   end   % while
runner=1; tocalc=0; Cdone=1;  
%%
%%  Repeated animations
%% 
    kmax=k;
    if todestroy==0
     set(SlidK,'min',0,'max',kmax-2)
     set(SlidK,'Units','normalized', ...
     'position',[0.1 0.005 0.85*kmax/(tfinal/h) 0.03])
    end;
    t=t0;k=0;
    if(todestroy==0) 
      calling=GOLDCONT; golden; 
      if(HelpfigNumber~=3335) delete(HelpfigNumber);
      end; 
      HelpfigNumber=3335;      
    end; 
    if todestroy==1, GoldenRuleFl=0; end;     
%%%
%%%
end;       %%%%%    end   goldcalc part
%%%
%%%

if calling==GOLDCONT


 while (runner==1 | onestep==1 )  % if not stopped
    runner=runner;
    if k>kmax-1,k=0;end;
    if(from0==1) k=0;from0=0; end;  
      k = k+1;
      % Start plotting
      if(k==1 & ( onestep==1 | runner==1 ) )
         figure(axHndl);
         subplot(2,1,1);hold off;
           xx=9:nnn+8; xx(1)=3;  
           xx=[xx;xx;xx];xx=reshape(xx,3*nnn,1);
           yp=yout(:,k);
           yp(2:nnn)=konst*yp(2:nnn);
           yv=[vv;yp';vv];yv=reshape(yv,3*nnn,1);
           pp1=  plot(xx,yv,'-');hold on;          
            set(pp1,'erase','background'); 
      else
        if( runner==1 | onestep==1 )
           yp=yout(:,k);
           yp(2:nnn)=konst*yp(2:nnn);
           yv=[vv;yp';vv];yv=reshape(yv,3*nnn,1);
         set(pp1,'Ydata', yv );
        end;           
      end
      drawnow 
      if(k==2 | onestep==1 )
         figure(axHndl);
         subplot(2,1,2);      
           set(pp3,'erase','normal')                   
           set(pp3,'Xdata',tout(1:2)); 
           set(pp3,'erase','none');  
           
           set(pp2,'erase','normal')                   
           set(pp2,'Xdata',tout(1:k),'Ydata',yout(1,1:k)); 
           set(pp2,'erase','none');
      end
      % Continue plotting     
      if(k>2)
         set(pp2,'Xdata',tout(1:k),'Ydata',yout(1,1:k)); 
         set(pp3,'Xdata',[ tout(1) tout(k)]);
        drawnow 
     end;
   onestep=0;  from0=0; %%  for the t=0 function  
   if todestroy==1, delete(fdestroy); runner=0; 
     if(HelpfigNumber~=3335) delete(HelpfigNumber);
     end;  HelpfigNumber=3335;GoldenRuleFl=0; 
   end;           
   end   % while  k
  end   % if not stopped

%%%
%%%
end;       %%%%%    end   goldcont part
%%%
%%%
if calling == GOLDHELP

% HELPFN1 Utility function for displaying help text conveniently.
%       Modified by L. Kocbach, Nov. 1996
%       modified to work also on student edition, removed gco
%       Modification: removing the specific Expomap calls
%       Adding a string to change the title
%       titleStr,OnWhat,helpStr1,helpStr2,helpStr3
% Based on HELPFUN Utility function
%	Ned Gulley, 6-21-93
%	Copyright (c) 1984-94 by The MathWorks, Inc.
%
numPages=4;


% If the Help Window has already been created, bring it to the front

newHelpWindowFlag=HelpfigNumber==3335;
figNumber=HelpfigNumber;

if newHelpWindowFlag,
    position=[50 30 520 440];
    HelpfigNumber=figure( ...
        'Name',['MATLAB Info Window on ' OnWhat ], ...
        'NumberTitle','off', ...
        'NextPlot','new', ...
	'Visible','off', ...
	'Position',position, ...
	'Colormap',[]);
    figNumber=HelpfigNumber;
    %===================================
    % Set up the Help Window
    top=0.95;
    left=0.05;
    right=0.75;
    bottom=0.05;
    labelHt=0.05;
    spacing=0.005;

    % First, the Text Window frame
    frmBorder=0.02;
    frmPos=[left-frmBorder bottom-frmBorder ...
        (right-left)+2*frmBorder (top-bottom)+2*frmBorder];
    uicontrol( ...
        'Style','frame', ...
        'Units','normalized', ...
        'Position',frmPos, ...
	'BackgroundColor',[0.5 0.5 0.5]);
    % Then the text label
    labelPos=[left top-labelHt (right-left) labelHt];
    ttlHndl=uicontrol( ...
	'Style','text', ...
        'Units','normalized', ...
        'Position',labelPos, ...
        'BackgroundColor',[0.5 0.5 0.5], ...
        'ForegroundColor',[1 1 1], ...
        'String',titleStr);
    % Then the editable text field (of which there are three)
    % Store the text field's handle two places: once in the figure
    % UserData and once in the button's UserData.

    for count=1:4,
    	helpStr=eval(['helpStr',num2str(count)]);
    	txtPos=[left bottom (right-left) top-bottom-labelHt-spacing];
    	txtHndlList(count)=uicontrol( ...
    	    'Style','edit', ...
    	    'Units','normalized', ...
    	    'Max',20, ...
    	    'String',helpStr, ...
    	    'BackgroundColor',[1 1 1], ...
	    'Visible','off', ...
    	    'Position',txtPos);
    end;
    
    
    set(txtHndlList(1),'Visible','on');

    %====================================
    % Information for all buttons
    labelColor=[0.8 0.8 0.8];
    top=0.95;
    bottom=0.05;
    yInitPos=0.80;
    left=0.80;
    btnWid=0.15;
    btnHt=0.10;
    % Spacing between the button and the next command's label
    spacing=0.05;

    %====================================
    % The CONSOLE frame
    frmBorder=0.02;
    yPos=bottom-frmBorder;
    frmPos=[left-frmBorder yPos btnWid+2*frmBorder 0.9+2*frmBorder];
    uicontrol( ...
        'Style','frame', ...
        'Units','normalized', ...
        'Position',frmPos, ...
	'BackgroundColor',[0.5 0.5 0.5]);

    %====================================
    % All required BUTTONS
    for count=1:4
	% The PAGE button
	labelStr=TextStrs(count,:);
	% The callback will turn off ALL text fields and then turn on
	% only the one referred to by the button.
	callbackStr= ...
	   ['txtHndl=txtHndlList(' num2str(count) ');' ...
	    'hndlList=get(gcf,''UserData'');' ...
	    'set(hndlList(2:5),''Visible'',''off'');' ...
	    'set(txtHndl,''Visible'',''on'');'];
	btnHndlList(count)=uicontrol( ...
    	    'Style','pushbutton', ...
    	    'Units','normalized', ...
    	    'Position',[left top-btnHt-(count-1)*(btnHt+spacing) btnWid btnHt], ...
    	    'String',labelStr, ...
	    'UserData',txtHndlList(count), ...
	    'Visible','off', ...
    	    'Callback',callbackStr);
    end;

    %====================================
    % The CLOSE button
    callbackStr= ...
	'delete(gcf); HelpfigNumber=3335;';
    uicontrol( ...
        'Style','pushbutton', ...
        'Units','normalized', ...
        'Position',[left 0.05 btnWid 0.10], ...
        'String','Close', ...
        'Callback',callbackStr);

    hndlList=[ttlHndl txtHndlList btnHndlList];
        
    set(figNumber,'UserData',hndlList)
else
   figure(HelpfigNumber);
end;

% Now that we've determined the figure number, we can install the
% Desired strings.
hndlList=get(figNumber,'UserData');
ttlHndl=hndlList(1);
txtHndlList=hndlList(2:5);
btnHndlList=hndlList(6:9);
set(ttlHndl,'String',titleStr);
set(txtHndlList(2:4),'Visible','off');
set(txtHndlList(1),'Visible','on');
set(txtHndlList(1),'String',helpStr1);
set(txtHndlList(2),'String',helpStr2);
set(txtHndlList(3),'String',helpStr3);
set(txtHndlList(4),'String',helpStr4);

set(btnHndlList(1:numPages),'Visible','on');


set(HelpfigNumber,'Visible','on');
%%%
%%%
end;       %%%%%    end   goldhelp part
%%%
%%%
if todestroy==1, GoldenRuleFl=0; end;

end;   %%  of the whole else ...