import { LightningElement, api, wire, track } from 'lwc';
import getProperty from '@salesforce/apex/propertyClass.getProperty';
import { CurrentPageReference, NavigationMixin } from 'lightning/navigation';

export default class HomePageProperty extends NavigationMixin(LightningElement) {
    @wire(getProperty)
    wiredProperty;
    
    recordId;

    @track currentPageReference;
    @wire(CurrentPageReference)
    setCurrentPageReference(currentPageReference) {
        this.currentPageReference = currentPageReference;
    }

    get recordId() {
        return this.currentPageReference?.state?.c__recordId;
    }

    get objectType() {
        return this.currentPageReference?.state?.c__objectType;
    }

    get countParam() {
        return this.currentPageReference?.state?.c__randomCountParam;
    }

    // Navigates to app page on button click
    handleNavigate() {
        this[NavigationMixin.Navigate]({
            type: 'standard__navItemPage',
            attributes: {
                apiName: 'Property_Detail__c',
            },
            state: {
                c__recordId: 'a00Ox00000A5KpyIAF',
                c__objectType: 'Property__c',
                c__randomCountParam: 3
            }
        });
    }
}