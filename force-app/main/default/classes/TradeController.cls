/**
 * @description       : 
 * @author            : Sudhir Kumar Thanna
 * @group             : 
 * @last modified on  : 04-12-2022
 * @last modified by  : Sudhir Kumar Thanna
**/
public with sharing class TradeController {
    
    @AuraEnabled(cacheable=true)
    public static void createTrade(String buyAmount, String buyCurrency, String sellAmount, String sellCurrency, String rate){
        List<String> tradeInfo = new List<String>();
        tradeInfo.add(buyAmount);
        tradeInfo.add(buyCurrency);
        tradeInfo.add(sellAmount);
        tradeInfo.add(sellCurrency);
        tradeInfo.add(rate);
        insertTradeRecord(tradeInfo);
    }

    @future
    public static void insertTradeRecord(List<String> tradeInfo){
        Trade__c tradeObj = new Trade__c();
        String genID = 'TR' + generateRandomNum();
        tradeObj.Name = genID;
        tradeObj.ID__c = genID;
        tradeObj.Buy_Amount__c =  Decimal.valueOf(tradeInfo[0]).setScale(2, RoundingMode.HALF_UP);
        tradeObj.Buy_Currency__c = tradeInfo[1];
        tradeObj.Date_Booked__c = DateTime.now().format();
        tradeObj.Sell_Amount__c = Decimal.valueOf(tradeInfo[2]).setScale(2, RoundingMode.HALF_UP);
        tradeObj.Sell_Currency__c = tradeInfo[3];
        tradeObj.Rate__c = Decimal.valueOf(tradeInfo[4]);
        insert tradeObj;
    }

    public static String generateRandomNum() {
        Integer rand = Math.round(Math.random() * 1000000000);//10 Digit Number
        string randomNumber = string.valueof(rand).substring(0, 7);
        System.debug('Random Number Generated is :' + randomNumber);
        return randomNumber;
    }

}