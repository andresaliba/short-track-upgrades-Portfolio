import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, FormBuilder, Validators, FormArray } from '@angular/forms';
import { Router } from '@angular/router';
import { DataService } from '../data.service';

@Component({
  selector: 'app-reset-password',
  templateUrl: './reset-password.component.html',
  styleUrls: ['./reset-password.component.scss']
})
export class ResetPasswordComponent implements OnInit {
  constructor(public dataService: DataService, private fb: FormBuilder, private router: Router) {}

  passwordForm: FormGroup;

  ngOnInit() {
    this.dataService.isLoaded = false;

    this.dataService.checkSession();

    this.dataService.getSession().then(session => {
      if (session.type != 'Admin') {
        this.dataService.redirectToLogin();
      }
    });

    this.passwordForm = this.fb.group(
      {
        type: 'Parent',
        username: [{ value: '', disabled: true }, Validators.required],
        password: ['', Validators.required],
        confirmedPassword: ['', Validators.required]
      },
      { validator: this.passwordsMatch }
    );

    this.passwordForm.get('username').setValue(this.dataService.selectedUser.username);

    this.dataService.isLoaded = true;
  }

  //this is a custom validator that ensures that the passwords have to be the same in order for the form to submit
  public passwordsMatch(fg: FormGroup) {
    return fg.controls['password'].value === fg.controls['confirmedPassword'].value ? null : { match: true };
  }

  public onSubmit() {
    this.dataService.resetRacerPass(this.passwordForm.value.password);
    this.passwordForm.reset();
    this.passwordForm.get('username').setValue(this.dataService.selectedUser.username);

    // Redirect to settings page
    this.router.navigate(['/admin/settings']);
  }
}
