import { LightningElement, api, wire, track} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getTradeList from '@salesforce/apex/TradeHelper.getTradeList';
import getTradeInformation from '@salesforce/apex/FixerTradeController.getTradeInformation';
import createTrade from '@salesforce/apex/TradeController.createTrade';


export default class BookedTrades extends LightningElement {
    
    newTradeBtn = false;

    handleClick(event) {
        this.newTradeBtn = true;
    } 

    @track columns = [{
            label: 'Sell CCY',
            fieldName: 'Sell_Currency__c',
            type: 'text',
            sortable: true
        },
        {
            label: 'Sell Amount',
            fieldName: 'Sell_Amount__c',
            type: 'Number',
            sortable: true
        },
        {
            label: 'Buy CCY',
            fieldName: 'Buy_Currency__c',
            type: 'text',
            sortable: true
        },
        {
            label: 'Buy Amount',
            fieldName: 'Buy_Amount__c',
            type: 'Number',
            sortable: true
        },
        {
            label: 'Rate',
            fieldName: 'Rate__c',
            type: 'Number',
            sortable: true
        },
        {
            label: 'Date Booked',
            fieldName: 'Date_Booked__c',
            type: 'text',
            sortable: true
        }
    ];

    @track error;
    @track tradeList ;
    @track DBdataDefault = []; 
    @wire(getTradeList)
    wiredTrades({error,data}) {
        if (data) {
            this.tradeList = data;
            //console.log('tradeList>>>'+JSON.stringify(this.tradeList));
            //console.log('tradeList Results ::'+JSON.stringify(this.tradeList));
            for(let k = 0; k < this.tradeList.length; k++) {
                this.DBdataDefault.push(this.tradeList[k]);
            }
            //console.log('DBdataDefault Final:::'+JSON.stringify(this.DBdataDefault));
        } else if (error) {
            this.error = error;
        }
    }

    
    
    @track mapValues;
    @track rateValue;
    @track buyAmount;
    @track sellAmount;
    getTradeRateInformation() {
        getTradeInformation({})
        .then(result => {    
            //console.log('result' + result);
            //console.log('result :JSON' + JSON.stringify(result));
            const tradeRateInfo = result;
            const map1 = new Map();
            for (var value in tradeRateInfo) {  
                map1.set(value,tradeRateInfo[value])  
            }  
            this.mapValues = map1;
            this.rateValue = this.mapValues.get(this.buyCurrencyValue);
            if(this.sellAmount != undefined && this.sellAmount != '' && this.rateValue != undefined){
                this.buyAmount = this.rateValue * this.sellAmount;
            }
        })
        .catch(error => {
            const event = new ShowToastEvent({
                title: 'Error Occured',
                message: 'Error: ' + error,
                variant: 'error'
            });
            this.dispatchEvent(event);
        });
    }

    sellCurrencyValue = '';
    buyCurrencyValue = '';

    get options() {
        return [
                { label: 'INR', value: 'INR' },
                { label: 'USD', value: 'USD' },
                { label: 'EUR', value: 'EUR' },
                { label: 'AED', value: 'AED' },
                { label: 'AFN', value: 'AFN' },
            ];
    }

    sellhandleChange(event) {
        this.sellCurrencyValue = event.detail.value;
        this.checkDropDowns();
    }

    sellAmounthandleChange(event) {
        this.sellAmount = event.detail.value;
        if(this.rateValue != '' && this.rateValue != undefined){
            this.buyAmount = this.rateValue * this.sellAmount;
        }
    }

    buyhandleChange(event) {
        this.buyCurrencyValue = event.detail.value;
        this.checkDropDowns();
    }

    checkDropDowns(){
        //console.log('sellCurrencyValue' + this.sellCurrencyValue );
        //console.log('buyCurrencyValue' + this.buyCurrencyValue );
        if(this.sellCurrencyValue != '' && this.sellCurrencyValue != undefined && this.buyCurrencyValue != '' && this.buyCurrencyValue != undefined){
            //Do Callout
            //this.sellCurrencyValue --  to be sent to callout
            //this.buyCurrencyValue -- should fetch value from the map
            this.getTradeRateInformation();
        }
    }

    handleCancel(){
        this.newTradeBtn = false;
    }

    handleCreate(){
        //APEX Perform DML Operations
        this.createTradeObject();
    }

    createTradeObject() {
        createTrade({
            buyAmount: this.buyAmount,
            buyCurrency: this.buyCurrencyValue,
            sellAmount: this.sellAmount,
            sellCurrency: this.sellCurrencyValue,
            rate: this.rateValue
        })
        .then(result => {    
            console.log('result' + result);
            this.showToast('Success', result, 'Success', 'dismissable');
            this.updateRecordView();
            this.newTradeBtn = false;
            window.location.reload();
            //console.log('createTrade -- result :JSON' + JSON.stringify(result));        
        })
        .catch(error => {
            this.showToast('Error updating or refreshing records', error.body.message, 'Error', 'dismissable');
        });
    }

    updateRecordView() {
        setTimeout(() => {
             eval("$A.get('e.force:refreshView').fire();");
        }, 1000); 
    }

     showToast(title, message, variant, mode) {
        const event = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant,
            mode: mode
        });
        this.dispatchEvent(event);
    }
}