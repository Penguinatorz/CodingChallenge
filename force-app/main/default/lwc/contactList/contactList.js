import { LightningElement, wire } from 'lwc';
import Contact from '@salesforce/schema/Contact';
import LastName from '@salesforce/schema/Contact.LastName';
import FirstName from '@salesforce/schema/Contact.FirstName';
import Email from '@salesforce/schema/Contact.Email';
import getContacts from '@salesforce/apex/ContactController.getContacts';
import {reduceErrors} from 'c/ldsUtils';

const Columns = [
    {label: 'First Name', fieldName: FirstName.fieldApiName, type: 'text'},
    {label: 'Last Name', fieldName: LastName.fieldApiName, type: 'text'},
    {label: 'Email', fieldName: Email.fieldApiName},        

]

export default class ContactList extends LightningElement {
    columns = Columns;

    @wire(getContacts)
    contacts;
    get errors(){
        return (this.contacts.error) ?
            reduceErrors(this.contacts.error) : [];
    }


}