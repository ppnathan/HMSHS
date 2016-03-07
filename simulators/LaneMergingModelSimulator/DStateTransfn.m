function prob = DStateTransfn(qq, q, sigma)

humanDriver = ceil(q/3);
humanDriverNext = ceil(qq/3);
autonomousDriverNext = mod(qq - 1, 3)+1;

prob =  (humanDriver == humanDriverNext) * (autonomousDriverNext == sigma);

end