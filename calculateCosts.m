%Calculate the respectives costs for each node

function map = calculateCosts(map,initialC)
  cost = []; 
  for node = map
    counter = 1; 
    for adjNode = node.adj
      cost = [cost calculateWeight(initialC, node.config(counter)) ]; 
      counter = counter +1;
      

      
    

endfunction
