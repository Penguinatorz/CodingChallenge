import { LightningElement, wire } from 'lwc';
import lmsChannel from '@salesforce/messageChannel/lmsCoddingChallenge2__c'
import { MessageContext, publish } from 'lightning/messageService';

export default class LwcChallenge2 extends LightningElement {

    @wire(MessageContext)
    MessageContext;

    handleClick(){
        const payload = { 
            myMessage : this.refs.input.value
        };

        publish(this.MessageContext, lmsChannel, payload);
    }
}