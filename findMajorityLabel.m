function label = findMajorityLabel(labelsCounts)
    % Returns a label given a list of labels and their number of occurences
    
    labels = fieldnames(labelsCounts);
    counts = zeros(1, length(labels));
    for i=1:length(labels)
        counts(i) = labelsCounts.(labels{i});
    end
    [m, index] = max(counts);
    label = labels{index};
end