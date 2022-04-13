/**
 * @description       : 
 * @author            : Sudhir Kumar Thanna
 * @group             : 
 * @last modified on  : 04-12-2022
 * @last modified by  : Sudhir Kumar Thanna
**/
@IsTest
public with sharing class TestTradeController {

    @testSetup static void setup() {
        String buyAmount = '110';
        String buyCurrency = 'USD';
        String sellAmount = '100';
        String sellCurrency = 'EUR';
        String rate = '1.1';
        Trade__c tradeObj = new Trade__c();
        String genID = 'TR' + TradeController.generateRandomNum();
        tradeObj.Name = genID;
        tradeObj.ID__c = genID;
        tradeObj.Buy_Amount__c =  Decimal.valueOf(buyAmount).setScale(2, RoundingMode.HALF_UP);
        tradeObj.Buy_Currency__c = buyCurrency;
        tradeObj.Date_Booked__c = DateTime.now().format();
        tradeObj.Rate__c = Decimal.valueOf(rate);
        tradeObj.Sell_Amount__c = Decimal.valueOf(sellAmount).setScale(2, RoundingMode.HALF_UP);
        tradeObj.Sell_Currency__c = sellCurrency;
        insert tradeObj;
    }

    @IsTest
    public static void testCreateTrade() {
        String buyAmount = '110';
        String buyCurrency = 'USD';
        String sellAmount = '100';
        String sellCurrency = 'EUR';
        String rate = '1.1';
        Test.startTest();
        TradeController.createTrade(buyAmount, buyCurrency, sellAmount, sellCurrency, rate);
        List<Trade__c> tradeObj = TradeHelper.getTradeList();
        Test.stopTest();
        System.assert(tradeObj.size()>0 , 'Creation of Trade Object - Succesfull - Check Passed');
    }
}