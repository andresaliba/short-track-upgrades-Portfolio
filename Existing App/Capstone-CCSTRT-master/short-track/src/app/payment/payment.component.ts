import { Component, OnInit, AfterViewInit } from '@angular/core';
import { DataService } from '../data.service';
import { ActivatedRoute } from '@angular/router';

declare let paypal: any;

@Component({
  selector: 'app-payment',
  templateUrl: './payment.component.html',
  styleUrls: ['./payment.component.scss']
})
export class PaymentComponent implements AfterViewInit {
  constructor(public dataService: DataService, private activatedRoute: ActivatedRoute) {}

  private addScript: Boolean = false;

  ngAfterViewInit(): void {
    this.dataService.isLoaded = false;
    this.dataService.checkSession();

    console.log(this.dataService.emptyPlates);

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

              //console.log(this.dataService.racerForm);
              this.dataService.addRacer(this.dataService.racerForm);

              // Redirect back to home page after payment complete
              window.location.href = '/home';
            });
          }
        })
        .render('#paypal-button-container');
      this.addScript = true;
      //console.log("i'm doing this");
    }

    //console.log(this.dataService.racerForm);
    this.dataService.isLoaded = true;
  }
}
