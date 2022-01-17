import { Component, OnInit } from '@angular/core';
import { DataService } from '../data.service';
import { FormGroup, FormControl, FormBuilder, Validators, FormArray } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { Racer } from './../racers.model';
import { Router } from '@angular/router';

@Component({
  selector: 'app-sign-up',
  templateUrl: './sign-up.component.html',
  styleUrls: ['./sign-up.component.scss']
})
export class SignUpComponent implements OnInit {
  private racerID;
  private racer: Racer;
  private kids: number = 0;

  constructor(
    public dataService: DataService,
    private router: Router,
    private fb: FormBuilder,
    private activatedRoute: ActivatedRoute
  ) {}

  racerForm: FormGroup;
  children: FormArray;

  validForm: boolean = true;
  validAccount: boolean = true;
  invalidPlates: any[] = [];
  invalidPlatesText: string = ' ';

  //initialize form
  ngOnInit() {
    this.dataService.isLoaded = false;
    this.racerForm = this.fb.group(
      {
        type: 'Parent',
        email: ['', Validators.required],
        password: ['', Validators.required],
        confirmedPassword: ['', Validators.required],
        firstName: ['', Validators.required],
        lastName: ['', Validators.required],
        address: ['', Validators.required],
        city: ['', Validators.required],
        postalCode: ['', Validators.required],
        phoneNum: ['', Validators.required],
        sex: 'Male',
        category: 'Run-Bike',
        plateNum: '',
        children: this.fb.array([]),
        attendedCount: 0,
        attended: 'no',
        totalPoints: 0,
        paid: 'yes',
        mediaCheck: [false, Validators.pattern('true')]
      },
      { validator: this.passwordsMatch }
    );
    this.dataService.isLoaded = true;
  }

  //this is a custom validator that ensures that the passwords have to be the same in order for the form to submit
  public passwordsMatch(fg: FormGroup) {
    return fg.controls['password'].value === fg.controls['confirmedPassword'].value ? null : { match: true };
  }

  //template for a child racer
  public createItem(): FormGroup {
    return this.fb.group({
      type: 'Child',
      belongsTo: '',
      firstName: ['', Validators.required],
      lastName: ['', Validators.required],
      plateNum: '',
      sex: 'Male',
      category: 'Run-Bike',
      attendedCount: 0,
      attended: 'no',
      totalPoints: 0,
      paid: 'yes'
    });
  }

  //append a new racer to the parent account
  public addChild(): void {
    this.children = this.racerForm.get('children') as FormArray;
    this.children.push(this.createItem());
  }

  //remove additional racer from form
  public removeChild(i: number): void {
    this.children = this.racerForm.get('children') as FormArray;
    this.children.removeAt(i);
  }

  public onSubmit(): void {
    this.dataService.nonAdults = 0;
    this.dataService.emptyPlates = 0;
    this.validForm = true;
    this.invalidPlates = [];
    this.invalidPlatesText = ' ';

    // console.warn(this.racerForm.value);

    // check if any of the added racers are kids
    this.racerForm.value.children.forEach(child => {
      if (child.category != 'Adult') this.kids++;

      // If plate is empty add it to emptyPlates count
      if (child.plateNum == '') this.dataService.emptyPlates++;
    });

    // If the main account has an empty plate add it to emptyPlate count
    if (this.racerForm.value.plateNum == '') this.dataService.emptyPlates++;

    // If the first racer is an adult and there are no kids added then charge them
    // If the first racer is a kid then charge them
    if ((this.racerForm.value.category == 'Adult' && this.kids == 0) || this.racerForm.value.category != 'Adult') {
      this.dataService.nonAdults++;
    }

    this.racerForm.value.children.forEach(child => {
      // If its a kid add one to who needs to pay
      if (child.category != 'Adult') {
        this.dataService.nonAdults++;
      } else if (this.kids == 0) {
        // Otherwise if it's an adult and there are no kids add one to who needs to pay
        this.dataService.nonAdults++;
      }
    });

    // Check if the account exists or not already
    this.dataService
      .checkUserByName(this.racerForm.value.email)
      .then(result => {
        if (result.exists == true) {
          //console.log('the account exists');
          this.validAccount = false;
        } else {
          //console.log('The account does not exists');
          this.validAccount = true;
        }
      })
      .catch(err => {});

    // Check if the plate numbers have already been registered or not
    this.dataService
      .checkRacerByPlate(this.racerForm.value.plateNum)
      .then(result => {
        if (result.exists == true) {
          //console.log('I exist');
          this.validForm = false;
          this.invalidPlates.push(this.racerForm.value.plateNum);

          this.invalidPlatesText += this.racerForm.value.plateNum + ' ';
        } else {
          //console.log('I do not exist');
        }
      })
      .then(result => {
        this.racerForm.value.children.forEach(child => {
          if (child.plateNum != null && child.plateNum != '') {
            this.dataService
              .checkRacerByPlate(child.plateNum)
              .then(result => {
                if (result.exists == true) {
                  //console.log('I exist');
                  this.validForm = false;
                  this.invalidPlates.push(child.plateNum);
                  this.invalidPlatesText += '& ' + child.plateNum + ' ';

                  //console.log(this.invalidPlates);
                } else {
                  //console.log('I do not exist');
                }
              })
              .catch(err => {});
          }
        });
      })
      .then(result => {
        setTimeout(() => {
          //console.log('This form is: ' + this.validForm);
          //console.log('This account is: ' + this.validAccount);
          //console.log(this.invalidPlates);

          // If account and plates are valid go ahead
          if (this.validForm && this.validAccount) {
            // Set price for PayPal
            this.dataService.totalPrice =
              this.dataService.racerCost * this.dataService.nonAdults +
              this.dataService.plateFee * this.dataService.emptyPlates;

            // Set dataService form value to that of those signed up here
            this.dataService.racerForm = this.racerForm.value;
            // Reset the form values
            this.racerForm.reset();
            // Redirect to payment form if payment needed
            this.router.navigate(['/signup/payment']);
          }
        }, 1500);
      })
      .catch(err => {});
  }
}
