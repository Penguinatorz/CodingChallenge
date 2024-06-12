import { LightningElement, track, wire } from 'lwc';
import getProperty from '@salesforce/apex/propertyClass.getProperty';
import { NavigationMixin } from 'lightning/navigation';
import isGuest from '@salesforce/user/isGuest';

export default class ethanNavExample extends NavigationMixin(LightningElement) {

    @wire(getProperty)
    residences;


    navToResidencePage(e) {

        // the name Residence_Viewer__c needs to correspond with
        // the api name of the page made in experience builder
        this[NavigationMixin.Navigate]({
            type: 'comm__namedPage',
            attributes: {
                name: 'PropertyD__c',
            },
            state: {
                c__recordId: e.target.dataset.id
            }
        });
    }
}