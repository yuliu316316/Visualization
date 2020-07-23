function Y = selb(M1, M2)
%Y = selb(M1, M2, mp) coefficient selection for base image
%
%    M1  - coefficients A
%    M2  - coefficients B
% 
%    Y   - combined coefficients

%    (Oliver Rockinger 16.08.99)

um = 3;
S1 = conv2(es2(M1.*M1, floor(um/2)), ones(um), 'valid'); 
S2 = conv2(es2(M2.*M2, floor(um/2)), ones(um), 'valid');
w1=S1./(S1+S2+1e-15);
w2=1-w1;
Y = w1.*M1 + w2.*M2; 
    

