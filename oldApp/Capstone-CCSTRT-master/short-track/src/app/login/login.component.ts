import { Component, OnInit } from '@angular/core';
import { DataService } from '../data.service';
@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {
  constructor(public dataService: DataService) {}

  ngOnInit() {
    this.dataService.isLoaded = false;

    this.dataService.checkSession();

    this.dataService.getSession().then(result => {
      if (result['username']) {
        this.dataService.redirectToAdmin();
      }
    });

    this.dataService.isLoaded = true;
  }

  // Clear the inputs when the user hits the Cancel button
  public clearInputs() {
    this.dataService.loginJSON.username = '';
    this.dataService.loginJSON.password = '';
    this.dataService.validLogin = true;
  }
}
