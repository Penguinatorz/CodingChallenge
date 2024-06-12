import { LightningElement, track, wire } from 'lwc';
import getAccs from '@salesforce/apex/lwcDemo.getAccounts';

export default class LwcDemo extends LightningElement {

    accounts;
    error;
    userName = 'Ethan';
    @track
    users = [{userName : 'Ethan', age : 34}, {userName : 'Andrew', age : 300}, {userName : 'Jan', age : 23}]
    myBool = false;

    /*
    @wire(getAccs)
    retrieveAccounts({data, error}){
        if(data){
            this.accounts = data;


        } else {
            this.error = error;

        }
    }*/

    handleClick(){
        this.myBool = !this.myBool;
    }
    addUser(){
        let newUserName = this.template.querySelector('.userName').value;
        let newAge = this.template.querySelector('.age').value;
        this.users.push({userName : newUserName, age : newAge})
    }

    getAllAccounts(){
        getAccs()
        .then(results => {
            this.accounts = results;
        })
        .catch(error => {
            this.error = error;
        })
    }

    // Wire service with property syntax - query is the key from Apex parameter input and the dollar sign
    // is the reactive property
    /*
    myQuery
    @wire(getAccountList, {query : '$myQuery'})
    allAccounts;*/
}