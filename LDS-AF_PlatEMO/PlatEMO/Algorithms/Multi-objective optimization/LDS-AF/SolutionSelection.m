function y_i = SolutionSelection(Problem, Population, P, model, N_s, i)

Prnd  = nchoosek(P,2);
Prnd = [Prnd;Prnd];
Prnd(N_s/2+1:N_s,[1,2]) = Prnd(N_s/2+1:N_s,[2,1]);

for r = 1 : N_s
    candidate(r,:)           = OperatorDE(Problem, Population(i).dec, Population(Prnd(r,1)).dec, Population(Prnd(r,2)).dec);
end

c     = model.PredictClass(candidate);
[~,pos] = min(c);
y_i = candidate(pos,:);
