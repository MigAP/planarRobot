% Optimization inequality function 
function H = inequality(Cp,H,Ck,rmin)
  Cp = [Cp;H]; 
  Cp = vect2mat(Cp); 
  Ck = vect2mat(Ck); 

  Xp = Cp(:,1);
  Yp = Cp(:,2);

  Xk = Ck(:,1);
  Yk = Ck(:,2); 

  H = (2*rmin)^2*ones(size(Xp)) - (Xp-Xk).^2 + (Yp-Yk).^2; 
   
endfunction
