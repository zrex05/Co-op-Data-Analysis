function n = KK_RexTransform(~,~,~)
% Kramer Kronig relations giving real refractive indices for wave numbers
% "v",imaginary refractive indices "k", and anchor point "anch"
% The anchor point is the real refractive index at infinite frequency/zero
% wavelength
% The sum of "anch", and the two components that make up the odd and even
% vertices are the real refractive indices.
anch = ;
%% 
k = [];
v = [];
h=abs(v(1)-v(2));
Io=zeros(length(k),1);                             % preallocate matrix
for l=1:2:length(k)                                % odd indices
    Io(l)=(2./(pi)).*h.*sum(k(2:2:end)./(v(2:2:end)-v(l).*ones(length(k(2:2:end)),1))+k(2:2:end)./(v(2:2:end)+v(l).*ones(length(k(2:2:end)),1)));
end
 
Ie=zeros(length(k),1);
for l=2:2:length(k)                                % even indices
    Ie(l)=(2./(pi)).*h.*sum(k(1:2:end)./(v(1:2:end)-v(l).*ones(length(k(1:2:end)),1))+k(1:2:end)./(v(1:2:end)+v(l).*ones(length(k(1:2:end)),1)));
end
% The sum of anch, and the two components that make up the odd and even
% vertices are the real refractive indices.
n=(anch+Io+Ie);
 
% For data presentation, w are the wavelength values respective to k
% exn are the real refractive indices that are used for reference
w = [];
exn = [];
plot(w,n,w,exn,w,k)
title('Real Refractive Index vs. Wavelength')
xlabel('Wavelength (nm)')
ylabel('Real Refractive Index')
legend('Calculated n','Experimental n','k')
axis([])
end
