/**
 * @description       : 
 * @author            : Sudhir Kumar Thanna
 * @group             : 
 * @last modified on  : 04-12-2022
 * @last modified by  : Sudhir Kumar Thanna
**/
trigger TradeTrigger on Trade__c (after insert) {

    if(Trigger.isAfter){
        list<Trade__c> newTradeList = new List<Trade__c>();
        for(Trade__c tradeObj: Trigger.new){
                newTradeList.add(tradeObj);
        }
        if(newTradeList.size()>0){
            TradeTriggerHelper.postChatterFeedForAllUsers(Trigger.new);
        }
    }

}