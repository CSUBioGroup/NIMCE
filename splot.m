plot((source_data{1}(:,1)'-mean(source_data{1}(:,1)'))/std(source_data{1}(:,1)'),'+-');
hold on
plot((source_data{2}(:,2)'-mean(source_data{2}(:,2)'))/std(source_data{2}(:,2)'),'--');
hold on
%plot(source_data{1}(:,2)','s-');
