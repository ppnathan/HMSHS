function [ G ] = msgDecoder(rmtAdd, rmtPort, lclPort)
%UNTITLED Summary of this function goes here
%decodes message from remote computer and returns an array with 
%yaw,pitch,roll,exp,time in this order.
%
%   Detailed explanation goes here
%   rmtAdd = ipv4 address of remote computer as text e.g '128.0.0.0'
%   rmtPort = port number of remote computer as text 
%   lclPort = port number of this (local) computer as text 
%   G = 5x1 vector with yaw,pitch,roll,exp,time values
%   exp: 0 - both eyes closed,1 = right eye open, 2 = left eye open, 3 =
%   both eyes open.
%   negative yaw occurs when you turn your head right when facing the
%   kinect.
%   negative pitch occurs when you turn your head downwards when facing the
%   kinect.
%   negative roll occurs when you rotate your head with a negative angle
%   with respect to the x-axis.

%typechecking(note this is minmal error checking, if your ip address etc
%is wrong, code could still blow up).

check = isa(rmtAdd,'char') || isa(rmtPort,'char')||isa(lclPort,'char');

if check ~= 1
    G = 7*ones(5,1);
    return;
end

% initialize variables
u = udp(rmtAdd,rmtPort,'LocalPort',lclPort,'Timeout',0.5,'DatagramTerminateMode','off');
i = 1;
A = zeros(512,1);
G = 7*ones(5,1);

%open port and read available 16 bytes
 fopen(u);
%if u can't be bound return all sevens
% if fileID ~= 1
%     return;
% end
[A, count] =  fread(u,16,'int8');

%if nothing read return all sevens
if count == 0
    return;
end

%close and clean up connection
fclose(u);
delete(u);
clear u;

%reconstruct bytes received (this loop is for first 4 elements)
k =1;
for i = 1:2:8

x = int8(A(i));
y = int8(A(i+1));

bytepack = int16(x);
bytepack = bitshift(bytepack,8);

z = typecast(bitor(bytepack,(bitand(int16(y),255))),'int16');
z = swapbytes(z);
G(k) = z;
k = k+1;
end;

% reconstruct time value 
i = i+1;
a = typecast(bitshift(int64(A(i+1)),56),'uint64');
b = bitshift(typecast(bitshift(int64(A(i+2)),56),'uint64'),-8) ;
c = bitshift(typecast(bitshift(int64(A(i+3)),56),'uint64'),-16);
d = bitshift(typecast(bitshift(int64(A(i+4)),56),'uint64'),-24);
e = bitshift(typecast(bitshift(int64(A(i+5)),56),'uint64'),-32);
f = bitshift(typecast(bitshift(int64(A(i+6)),56),'uint64'),-40);
g = bitshift(typecast(bitshift(int64(A(i+7)),56),'uint64'),-48);
h = bitshift(typecast(bitshift(int64(A(i+8)),56),'uint64'),-56);

q = bitor(a,b);
q = bitor(q,c);
q = bitor(q,d);
q = bitor(q,e);
q = bitor(q,f);
q = bitor(q,g);
q = bitor(q,h);
typecast(q,'int64');
q = swapbytes(q);

G(k) =q;
end

