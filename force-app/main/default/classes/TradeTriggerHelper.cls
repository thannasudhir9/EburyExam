/**
 * @description       : 
 * @author            : Sudhir Kumar Thanna
 * @group             : 
 * @last modified on  : 04-12-2022
 * @last modified by  : Sudhir Kumar Thanna
**/
public with sharing class TradeTriggerHelper {
    
    //Posting the chatter message of trade Object Details - for a queue (List of users)
    public static void postChatterFeedForAllUsers(List<Trade__c> tradeList){
        List<User> uObjs = [SELECT id, name, username, isActive FROM user 
        WHERE Id IN ( SELECT userOrGroupId FROM groupmember WHERE Group.Type = 'Queue' AND Group.Name = 'Trade reviewers') WITH SECURITY_ENFORCED];
        if(tradeList.size()>0){
            Trade__c tradeObj = tradeList[0];
            String postBody = buildChatterContent(tradeObj);
            postChatterLogic(tradeObj, uObjs, postBody);
        }
    }

    public static void postChatterLogic(Trade__c tradeObj, List<User> uObjs, String postBody){
        if (!Test.isRunningTest()){
            ConnectApi.FeedItemInput feedItemInput = new ConnectApi.FeedItemInput();
            ConnectApi.MessageBodyInput messageBodyInput = new ConnectApi.MessageBodyInput();
            ConnectApi.TextSegmentInput textSegmentInput = new ConnectApi.TextSegmentInput();
                
            messageBodyInput.messageSegments = new List<ConnectApi.MessageSegmentInput>();

            textSegmentInput.text = postBody;
            messageBodyInput.messageSegments.add(textSegmentInput);
            feedItemInput.body = messageBodyInput;
        
            for(user u: uObjs){
                ConnectApi.MentionSegmentInput mentionSegmentInput = new ConnectApi.MentionSegmentInput();
                mentionSegmentInput.id = u.Id;
                messageBodyInput.messageSegments.add(mentionSegmentInput);
            }
                
            feedItemInput.feedElementType = ConnectApi.FeedElementType.FeedItem;
            //post on Trade record
            feedItemInput.subjectId = tradeObj.id;
            //post the chatter
            ConnectApi.FeedElement feedElement = ConnectApi.ChatterFeeds.postFeedElement(Network.getNetworkId(), feedItemInput);
        }   
    }

    public static String buildChatterContent(Trade__c tradeObj)
    {
        String siteURL = URL.getSalesforceBaseUrl().toExternalForm() + '/' + tradeObj.id;
        System.debug('Site URL>>' + siteURL);

        // post body
        String postBody = 'A new trade has been created with the following data:'+ '\n\n';
        postBody += 'Sell Currency: ' + tradeObj.Sell_Currency__c + '\n\n' ;
        postBody += 'Sell Amount: ' + tradeObj.Sell_Amount__c + '\n\n' ;
        postBody += 'Buy Currency: ' + tradeObj.Buy_Currency__c + '\n\n' ;
        postBody += 'Buy Amount: ' + tradeObj.Buy_Amount__c + '\n\n' ;
        postBody += 'Rate: ' + tradeObj.Rate__c + '\n\n' ;
        postBody += 'Booked Date: ' + tradeObj.Date_Booked__c + '\n\n' ;
        postBody += 'Link to the trade: ' + siteURL + '\n\n' ;

        return postBody;
    }
}
