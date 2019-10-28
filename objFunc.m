%Objective functinon to be minimized
function norm = objFunc(Cp,H,Ck)
  Ck = vect2mat(Ck);
  Cp = [Cp;H];  
  Cp = vect2mat(Cp); 

  Xk = Ck(:,1);
  Yk = Ck(:,2);

  Xp = Cp(:,1);
  Yp = Cp(:,2);

  X = (Xp-Xk).^2;
  Y = (Yp-Yk).^2;
  norm = sum(X) + sum(Y); 
  
endfunction
