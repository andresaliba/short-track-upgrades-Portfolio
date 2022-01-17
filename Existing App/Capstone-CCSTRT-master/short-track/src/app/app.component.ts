import { Component, OnInit } from '@angular/core';
import { DataService } from './data.service';
import { Router, NavigationEnd } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
})
export class AppComponent implements OnInit {
  constructor(public dataService: DataService, private router: Router) {
    router.events.subscribe((e) => {
      if(e instanceof NavigationEnd){
        if(this.router.url == "/admin/ballots/attended"){
          this.dataService.disableCSS = true;
        } else{
          this.dataService.disableCSS = false;
        }
      }
    });
  }

  public sessionType;
  public loggedIn;

  ngOnInit() {

    this.dataService.getSession().then(result => {
      if(result['username']){
        this.sessionType = result.type;
        this.dataService.isLoggedIn = true;
      } else{
        this.dataService.isLoggedIn = false;
      }
    });
  }

  public logout(){
    this.sessionType = false;
    this.dataService.isLoggedIn = false;;
    this.dataService.destroySession();
  }
}
