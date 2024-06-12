import { LightningElement, wire } from 'lwc';
import getAccounts from '@salesforce/apex/lwcDemo.getAccounts';


const columns = [
    {label : 'Account Name', fieldName : 'Name'},
    {label : 'Rating', fieldName : 'Rating'},
];

export default class LwcChallenge extends LightningElement {

    columns = columns;
    userQuery;
    allAccounts

    @wire(getAccounts, {query : '$userQuery'})
    allAccounts;

    handleQuery(){
        let q = this.template.querySelector('.input').value;
        this.userQuery = q;
        
    }

}