function Y = selc(M1, M2)
%Y = selc(M1, M2, ap) coefficinet selection for highpass components 
%
%    M1  - coefficients A
%    M2  - coefficients B
%
%    Y   - combined coefficients

%    (Oliver Rockinger 16.08.99)

 % Burts method
 um = 3; th = .75;
 % compute salience 
 S1 = conv2(es2(M1.*M1, floor(um/2)), ones(um), 'valid'); 
 S2 = conv2(es2(M2.*M2, floor(um/2)), ones(um), 'valid');  
 % compute match 
 MA = conv2(es2(M1.*M2, floor(um/2)), ones(um), 'valid');  
 MA = 2 * MA ./ (S1 + S2 + eps);
 % selection 
 m1 = MA > th; m2 = S1 > S2; 
 w1 = (0.5 - 0.5*(1-MA) / (1-th));
 Y  = (~m1) .* ((m2.*M1) + ((~m2).*M2));  
 Y  = Y + (m1 .* ((m2.*M1.*(1-w1))+((m2).*M2.*w1) + ((~m2).*M2.*(1-w1))+((~m2).*M1.*w1)));


 



