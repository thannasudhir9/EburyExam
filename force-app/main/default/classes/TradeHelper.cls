/**
 * @description       : 
 * @author            : Sudhir Kumar Thanna
 * @group             : 
 * @last modified on  : 04-12-2022
 * @last modified by  : Sudhir Kumar Thanna
**/
public with sharing class TradeHelper {
    @AuraEnabled(cacheable=true)
    public static List<Trade__c> getTradeList() {
        return [SELECT Name, Sell_Currency__c, Buy_Currency__c, Sell_Amount__c, Buy_Amount__c, Rate__c, Date_Booked__c FROM Trade__c WITH SECURITY_ENFORCED ORDER BY Date_Booked__c DESC];
    }
}