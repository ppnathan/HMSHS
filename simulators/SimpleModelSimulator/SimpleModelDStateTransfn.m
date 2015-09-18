function prob = SimpleModelDStateTransfn(qq, q, sigma)

Tq(:, :, 1) = [0.9 0.1;
               0.1 0.9];
Tq(:, :, 2) = [0.9 0.8; 
               0.1 0.2];
           
prob = Tq(qq, q, sigma);
end