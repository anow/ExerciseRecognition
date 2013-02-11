
%% Plots a Bland-Altman Plot
% INPUTS:
% data - column 1 and 2 are the values for comparison
% flag - how much you want to plot
% 0 = no plot
% 1 = just the data
% 2 = data and the difference and CR lines
% 3 = above and a linear fit
% titlestring - title of the plot
% filename - (optional) saves file as png under this filename

%OUTPUTS:
% means = the means of the data
% diffs = the raw differences
% meanDiff = the mean difference
% CR = the 2SD confidence limits
% linfit = the paramters for the linear fit

function [meanDiff,CR] = BlandAltman(data, loc, flag, titlestring,filename)

var1 = data(:,2);
var2 = data(:,1);

if nargin < 5
    filename = '';
end

if nargin < 4
    titlestring = 'Bland Altman Plot';
end

if nargin<3
    flag = 0;
end

if nargin<2
    loc = 1.96;
end

means = zeros(size(data,1),1);
diffs = zeros(size(data,1),1);

for i=1:size(data,1)
    means(i) = mean(var1(i,1),var2(i,1));
    diffs(i) = var2(i) - var1(i);
end
%     means = mean([var1(:);var2(:)]);
%     diffs = var1-var2;
%
meanDiff = mean(diffs);
sdDiff = std(diffs);
CR = [meanDiff + loc * sdDiff, meanDiff - loc * sdDiff]; %%95% confidence range

linFit = polyfit(means,diffs,1); %%%work out the linear fit coefficients

%%%plot results unless flag is 0
if flag ~= 0
    plot(means,diffs,'.','MarkerSize',15);
    hold on
    if flag > 1
        % set axis scales to match each other (nudged by 0.02)
        xupperlim = max(means)*1.02;
        xlowerlim = min(means)*1.02;
        scaley = xupperlim - xlowerlim;
        yupperlim = max([scaley/2, max(diffs)*1.02, CR(1)*1.02]);
        ylowerlim = min([-scaley/2,min(diffs)*1.02, CR(2)*1.02]);
        axis([xlowerlim xupperlim ylowerlim yupperlim]);
        
        % obtain coordinates for bounds
        linex = [xlowerlim, xupperlim];
        cr1 = [CR(1), CR(1)];
        cr2 = [CR(2), CR(2)];
        mdiff = [meanDiff, meanDiff];
        
        plot(linex, cr1,':', 'Color', [0 0 0]); %%%plot the upper CR
        plot(linex, cr2,':', 'Color', [0 0 0]); %%%plot the lower CR
        plot(linex, mdiff,'k'); %%%plot mean
        
        % label mean line
        text (xupperlim, meanDiff, sprintf('  %0.2f',meanDiff), 'Color', 'k' , 'FontSize', 10);
        
        % label CR lines
        text (xupperlim, CR(1), sprintf('  %0.2f',CR(1)), 'Color', 'k' , 'FontSize', 10);
        text (xupperlim, CR(2), sprintf('  %0.2f',CR(2)), 'Color', 'k' , 'FontSize', 10);
        
    end
    if flag > 2
        plot(means, means.*linFit(1)+linFit(2),'k-'); %%%plot the linear fit
        
        % print stats in textbox
        annotation(gcf,'textbox',...
            [0.14366729678639 0.809446641218884 0.170426065162907 0.0915141430948419],...
            'String',{['{Gradient = ', sprintf('%0.3f',linFit(1)), '}']},...
            'FontSize',12,...
            'BackgroundColor',[1 1 1]);
    end
    
    % add labels
    xlabel('(System + Goniometer)/2 / deg', 'FontSize', 12);
    ylabel('System - Goniometer/ deg', 'FontSize', 12);
    title(titlestring, 'FontSize', 14);
    
    box on;
    hold off;
    
    % export as image
    if(~strcmp(filename, ''))
        % set dimensions of figure on screen
        set(gcf, 'PaperPositionMode', 'auto');
        set(gcf,'units','normalized','outerposition',[0.1 0.1 0.7 0.9]);
        
        % save figure as png
        saveas(gcf, filename, 'png');
    end
end


end