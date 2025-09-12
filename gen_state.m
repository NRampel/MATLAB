function [xystates] = gen_state(T,steps,x_mult,y_mult,xinit,yinit)
%this function uses T(time step intervals) num of steps, an x and y
%multiplier along with initial states to model an object's position over
%time using the input model
%   T       : Time interval
%   steps   : Number of steps
%   x_mult  : Multiplier for x input
%   y_mult  : Multiplier for y input
%   xinit   : Initial x state [position; velocity]
%   yinit   : Initial y state [position; velocity]

%A and B are created
A=[1,T;0,1]; 
Bx=[1,0;x_mult,1];
By=[1,0;y_mult,1];

%2 empty vectors are created to store each state 
xstates=zeros(2,steps);
ystates=zeros(2,steps);

%the initial positions are added to the state vectors
xstates(:,1)=xinit;
ystates(:,1)=yinit;

%loops through and solves for the next state based on the pervious state
for k=1:(steps-1)
    %create the random input vectors
    x_input=randn(2,1);
    y_input=randn(2,1);

    %calculate the next state
    xstates(:,k+1)=A*xstates(:,k)+Bx*x_input;
    ystates(:,k+1)=A*ystates(:,k)+By*y_input;
end

%combine the state vectors to return one single matrix
xystates=[xstates;ystates];
end