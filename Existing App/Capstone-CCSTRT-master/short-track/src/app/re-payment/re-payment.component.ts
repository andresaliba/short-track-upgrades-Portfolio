import { Component, OnInit } from '@angular/core';
import { DataService } from '../data.service';
import { ActivatedRoute } from '@angular/router';

declare let paypal: any;

@Component({
  selector: 'app-re-payment',
  templateUrl: './re-payment.component.html',
  styleUrls: ['./re-payment.component.scss']
})
export class RePaymentComponent implements OnInit {
  constructor(public dataService: DataService, private activatedRoute: ActivatedRoute) {}

  private addScript: Boolean = false;

  ngOnInit(): void {
    this.dataService.isLoaded = false;
    this.dataService.familyIDs.length = 0;

    this.dataService.checkSession();
    this.activatedRoute.queryParams.subscribe(params => {
      this.dataService
        .getRacer(params['id'])
        .then(() => {
          return this.dataService.getChildrenToPromise(params['id']);
        })
        .then(() => {
          this.dataService.numberOfPayments();

          this.dataService.totalPrice = this.dataService.racerCost * this.dataService.nonAdults;

          if (!this.addScript) {
            paypal
              .Buttons({
                createOrder: (data, actions) => {
                  // Set up the transaction
                  return actions.order.create({
                    purchase_units: [
                      {
                        amount: {
                          value: this.dataService.totalPrice.toString()
                        }
                      }
                    ]
                  });
                },
                onApprove: (data, actions) => {
                  // Capture the funds from the transaction
                  //console.log('I did it');
                  return actions.order.capture().then(details => {
                    // Show a success message
                    alert('Transaction completed by ' + details.payer.name.given_name);

                    // Set family as paid
                    //console.log(this.dataService.familyIDs);
                    this.dataService.setPaid();

                    // Redirect back to home page after payment complete
                    window.location.href = '/home';
                  });
                }
              })
              .render('#paypal-button-container');
            this.addScript = true;
            //console.log("i'm doing this");
          }
        });
    });

    this.dataService.isLoaded = true;
  }
}
