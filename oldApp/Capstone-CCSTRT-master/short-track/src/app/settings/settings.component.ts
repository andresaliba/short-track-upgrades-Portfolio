import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, FormBuilder, Validators, FormArray } from '@angular/forms';
import { DataService } from '../data.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-settings',
  templateUrl: './settings.component.html',
  styleUrls: ['./settings.component.scss']
})
export class SettingsComponent implements OnInit {
  constructor(public dataService: DataService, private router: Router, private fb: FormBuilder) {}

  adminForm: FormGroup;
  attendanceForm: FormGroup;
  attendedForm: FormGroup;
  pointsForm: FormGroup;
  paymentForm: FormGroup;
  paypalForm: FormGroup;
  resetPassForm: FormGroup;
  invalidUser: boolean;

  ngOnInit() {
    this.dataService.isLoaded = false;
    this.dataService.checkSession();

    this.dataService.getSession().then(session => {
      if (session.type != 'Admin') {
        this.dataService.redirectToLogin();
      }
    });

    this.invalidUser = false;

    this.attendanceForm = this.fb.group({
      attendanceCheck: [false, Validators.pattern('true')]
    });

    this.attendedForm = this.fb.group({
      attendedCheck: [false, Validators.pattern('true')]
    });

    this.pointsForm = this.fb.group({
      resetPointsCheck: [false, Validators.pattern('true')]
    });

    this.paymentForm = this.fb.group({
      paymentCheck: [false, Validators.pattern('true')]
    });

    this.resetPassForm = this.fb.group({
      username: ['', Validators.required]
    });

    this.paypalForm = this.fb.group({
      paypalPrice: ['', Validators.required]
    });

    this.adminForm = this.fb.group(
      {
        type: 'Volunteer',
        username: ['', Validators.required],
        password: ['', Validators.required],
        confirmedPassword: ['', Validators.required]
      },
      { validator: this.passwordsMatch }
    );

    this.paypalForm.get('paypalPrice').setValue(this.dataService.racerCost);
    // this.dataService.getRacerUsers('results');

    this.dataService.isLoaded = true;
  }

  //this is a custom validator that ensures that the passwords have to be the same in order for the form to submit
  public passwordsMatch(fg: FormGroup) {
    return fg.controls['password'].value === fg.controls['confirmedPassword'].value ? null : { match: true };
  }

  public onSubmitAttend(): void {
    this.dataService.resetAttendance('no');
    this.attendanceForm.get('attendanceCheck').setValue(false);
  }

  public onSubmitResetAttended(): void {
    this.dataService.resetAttendedStatus(0);
    this.attendedForm.get('attendedCheck').setValue(false);
  }

  public onSubmitResetPoints(): void {
    this.dataService.resetTotalPoints(0);
    this.pointsForm.get('resetPointsCheck').setValue(false);
  }

  public onSubmitPaid(): void {
    this.dataService.resetPaid('no');
    this.paymentForm.get('paymentCheck').setValue(false);
  }

  public onSubmitReset(): void {
    this.dataService
      .getRacerUsers(this.resetPassForm.value.username)
      .then(result => {
        this.invalidUser = false;
        this.resetPassForm.reset();
        this.router.navigate(['/admin/reset-password']);
      })
      .catch(err => {
        //console.log('Error here');
        this.invalidUser = true;
      });
  }

  public onSubmitPayPal(): void {
    this.dataService.editPayPalPrice(this.paypalForm.value.paypalPrice);
  }

  public onSubmitAdmin(): void {
    this.dataService.newAdmin(this.adminForm.value);
    this.adminForm.reset();
  }
}
