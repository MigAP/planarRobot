% Equality constrains of the problem 

function G = equal(Cp,H,l)
  Cp = [Cp;H]; 
  Cp = vect2mat(Cp); 
  Xp = Cp(:,1);
  Yp = Cp(:,2); 
  l = l'; 
  Xminus = [0; Xp(1:end-1)];
  Yminus = [0; Yp(1:end-1)];
  G = (Xp-Xminus).^2 + (Yp-Yminus).^2 - l.^2; 

endfunction
