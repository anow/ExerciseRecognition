function a = svmrfeFeatureRankingForMulticlass(x,y)
%% rewritten from R
% SVM-RFE for multiclass classification problem


n = size(x,1);
survivingFeaturesIndexes = 1:1:n;
featureRankedList = zeros(n,1); % = vector(length=n)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% total matrix confusion - on which size is this thing working x or y?

rankedFeatureIndex = size(x,2);

while (size(survivingFeaturesIndexes,2)>0)
    
    % train the support vector machine
    svmModel = svm(x[, survivingFeaturesIndexes], y, cost = 10, cachesize=500, scale=F, type="C-classification", kernel="linear" )

    % compute the weight vector
    multiclassWeights = svm.weights(svmModel);

    % compute ranking criteria
    multiclassWeights = multiclassWeights * multiclassWeights;
    rankingCriteria = zeros(size(multiclassWeights,2),1); % 98% sure that this coordinate
    
    for i=1:size(multiclassWeights,2)
        rankingCriteria(i) = mean(multiclassWeights(:,i));

        % rank the features
        [~ idx] = sort(rankingCriteria, 1, 'descend');

        %%%%%%%%%%%%%%%%% not sure about update
        % update feature ranked list
        % 
        featureRankedList(rankedFeatureIndex) = survivingFeaturesIndexes(idx(1));
        rankedFeatureIndex = rankedFeatureIndex - 1;

        %%%%%%%%%%%%%%%%% even less sure about elimination
        % eliminate the feature with smallest ranking criterion
        survivingFeaturesIndexes = survivingFeaturesIndexes(idx(size(idx,1)));
        %cat(length(survivingFeaturesIndexes),"\n") %%%%%%%%%%%%%%% no idea what is
        %going on in this line
    end
end



svm.weights<-function(model){
        w=0
    if(model$nclasses==2){
        w=t(model$coefs)%*%model$SV
    }else{

        % when we deal with OVO svm classification
        %% compute start-index
        svmrfeFeatureRankingForMulticlass(x,y){
            n = ncol(x)
            survivingFeaturesIndexes = seq(1:n)
            featureRankedList = vector(length=n)
            rankedFeatureIndex = n
            while(length(survivingFeaturesIndexes)>0){

                % train the support vector machine
                svmModel = svm(x[, survivingFeaturesIndexes], y, cost = 10, cachesize=500,
                scale=F, type="C-classification", kernel="linear" )

                % compute the weight vector
                multiclassWeights = svm.weights(svmModel)

                % compute ranking criteria
                multiclassWeights = multiclassWeights * multiclassWeights
                rankingCriteria = 0
                for(i in 1:ncol(multiclassWeights))rankingCriteria[i] =
                mean(multiclassWeights[,i])

                % rank the features
                (ranking = sort(rankingCriteria, index.return = TRUE)$ix)

                % update feature ranked list
                (featureRankedList[rankedFeatureIndex] = survivingFeaturesIndexes[ranking[1]])
                rankedFeatureIndex = rankedFeatureIndex - 1

                % eliminate the feature with smallest ranking criterion
                (survivingFeaturesIndexes = survivingFeaturesIndexes[-ranking[1]])
                cat(length(survivingFeaturesIndexes),"\n")
            }
        }

            svm.weights<-function(model){
                w=0
                if(model$nclasses==2){
                    w=t(model$coefs)%*%model$SV
                }else{

                    % when we deal with OVO svm classification
                    %% compute start-index
                    start <- c(1, cumsum(model$nSV)+1)
                    start <- start[-length(start)]
                    calcw <- function (i,j) {

                        %% ranges for class i and j:
                        ri <- start[i] : (start[i] + model$nSV[i] - 1)
                        rj <- start[j] : (start[j] + model$nSV[j] - 1)

                        %% coefs for (i,j):
                        coef1 <- model$coefs[ri, j-1]
                        coef2 <- model$coefs[rj, i]

                        %% return w values:
                        w=t(coef1)%*%model$SV[ri,]+t(coef2)%*%model$SV[rj,]
                        return(w)
                    }

                    W=NULL
                    for (i in 1 : (model$nclasses - 1)){
                        for (j in (i + 1) : model$nclasses){
                            wi=calcw(i,j)
                            W=rbind(W,wi)
                        }
                    }   

                    w=W
                }
                return(w)
            }

