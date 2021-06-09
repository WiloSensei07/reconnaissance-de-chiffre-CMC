function [ll, prior_matrix, transition_matrix, observation_matrix] = train_HMM(data, states, count, it_sp, it_bw, type)

%% current log likelihood
ll = -Inf;
           
%%
for k = 1:it_sp
    
    %% Initialisation
    prior_matrix_0 = rand(1, states);
    transition_matrix_0  = rand(states, states);
    observation_matrix_0 = rand(states, count);
    
    if (type == 1) % left-right model
        for i = 1:states
            for j = 1:(i - 1)
                transition_matrix_0(i, j) = 0;
            end
        end
        prior_matrix_0(1) = 1;
    end
    
            
    prior_matrix_0 = mk_stochastic(prior_matrix_0);
    transition_matrix_0 = mk_stochastic(transition_matrix_0);
    observation_matrix_0 = mk_stochastic(observation_matrix_0);
             
    %% train HMM
    [LL, prior_matrix_0, transition_matrix_0, observation_matrix_0] = learn_dhmm(data, prior_matrix_0, transition_matrix_0, observation_matrix_0, it_bw, 1e-4, 0);
               
    %% if current log likelihood is better than previous maximum
    if (LL(end) > ll)
        % store matrices
        ll = LL(end);
        prior_matrix = prior_matrix_0;
        transition_matrix = transition_matrix_0;
        observation_matrix = observation_matrix_0;
    end
            
end

