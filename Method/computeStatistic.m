function S = computeStatistic(seq, statistic)
    if strcmpi(statistic, 'mean')
        S = mean(seq); return;
    end
    if strcmpi(statistic, 'std')
        S = std(seq); return;
    end
    if strcmpi(statistic, 'stdbymean')
        S = std(seq) ./ (mean(seq)+eps); return;
    end