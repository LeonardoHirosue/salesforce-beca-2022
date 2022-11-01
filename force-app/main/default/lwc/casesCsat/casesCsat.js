import { LightningElement, track, api } from "lwc";
import CalculateCsat from '@salesforce/apex/CalculateCsatController.CalculateCsat';

export default class CasesCsat extends LightningElement {
    @track rating;
    @track note;

    @api recordId;

    connectedCallback() {
        CalculateCsat({
            contactId : this.recordId
        }).then(result => {
            this.note = result;
            this.rating = `width: ${this.note/5*100}%`
        });
    }
}
