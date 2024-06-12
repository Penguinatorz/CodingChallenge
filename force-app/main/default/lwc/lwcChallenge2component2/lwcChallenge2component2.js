import { LightningElement, wire } from 'lwc';
import lmsChannel from '@salesforce/messageChannel/lmsCoddingChallenge2__c'
import { subscribe, MessageContext } from 'lightning/messageService';
import getCases from '@salesforce/apex/lwcChallenge2.getCases';

export default class LwcChallenge2component2 extends LightningElement {
    subscrption = null;
    caseRecord;

    @wire(MessageContext)
    MessageContext;

    subscribeToMessageChannel(){
        this.subscrption = subscribe(
            this.MessageContext,
            lmsChannel,
            (message) => this.handleMessage(message)
        );
    }
    handleMessage(message){
        getCases({query : message.myMessage})
        .then((response)=>{
            this.caseRecord = response;
        });
    }
    connectedCallback(){
        this.subscribeToMessageChannel();
    }
}