function Cmat = vect2mat(Cvec)
  Xp = Cvec(1:2:end);
  Yp = Cvec(2:2:end); 
  Cmat = [Xp,Yp]; 
endfunction
