function n = KK_RexTransform(~,~,~)
% Kramer Kronig relations giving imaginary refractive indices for wave numbers
% "v",real values "n", and anchor point "anch"
% The anchor point is the real refractive index at infinite frequency/zero
% wavelength
% The sum of anch, and the two components that make up the odd and even
% vertices are the real refractive indices.
anch = ;
%% 
n = [];
v = [];
h=abs(v(1)-v(2));
Io=zeros(length(n),1);                             % preallocate matrix
for l=1:2:length(n)                                % odd indices
    Io(l)=(-2./(pi)).*h.*sum(n(2:2:end)./(v(2:2:end)-v(l).*ones(length(n(2:2:end)),1))+n(2:2:end)./(v(2:2:end)+v(l).*ones(length(n(2:2:end)),1)));
end
 
Ie=zeros(length(n),1);
for l=2:2:length(n)                                % even indices
    Ie(l)=(-2./(pi)).*h.*sum(n(1:2:end)./(v(1:2:end)-v(l).*ones(length(n(1:2:end)),1))+n(1:2:end)./(v(1:2:end)+v(l).*ones(length(n(1:2:end)),1)));
end
% The sum of anch, and the two components that make up the odd and even
% vertices are the real refractive indices.
k=(anch+Io+Ie);
 
% For data presentation, w are the wavelength values respective to k
% exk are the real refractive indices that are used for reference
exk = [];
w = [];
plot(w,k,w,exk,w,n)
title('Imaginary Refractive Index vs. Wavelength')
xlabel('Wavelength (nm)')
ylabel('Real Refractive Index')
legend('Calculated k','Experimental k','n')
axis([])
end
