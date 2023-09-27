import { Component, OnInit } from '@angular/core';
import { DataService } from '../data.service';

@Component({
  selector: 'app-print-out',
  templateUrl: './print-out.component.html',
  styleUrls: ['./print-out.component.scss']
})
export class PrintOutComponent implements OnInit {
  public names: string[] = [];

  public cat1Names: string[] = [];
  public cat2Names: string[] = [];
  public cat3Names: string[] = [];
  public cat4Names: string[] = [];
  public cat5Names: string[] = [];
  public cat6Names: string[] = [];

  constructor(public dataService: DataService) {}

  ngOnInit() {
    this.dataService.checkSession();
    this.dataService.getSession().then(session => {
      this.dataService.disableCSS = true;

      if (session.type != 'Admin') {
        this.dataService.redirectToLogin();
      }

      this.dataService.getPromiseReq('/racers/get').then(racers => {
        //console.log(racers);

        for (let racer of racers) {
          let name = racer.firstName + ' ' + racer.lastName;
          //console.log(racer);

          for (let i = 0; i < racer.attendedCount; i++) {
            this.names.push(name);

            switch (racer.category) {
              case 'Run-Bike':
                this.cat1Names.push(name);
                break;
              case 'Grade 1-Under':
                this.cat2Names.push(name);
                break;
              case 'Grade 2-3':
                this.cat3Names.push(name);
                break;
              case 'Grade 4-6':
                this.cat4Names.push(name);
                break;
              case 'Jr. High':
                this.cat5Names.push(name);
                break;
              case 'Adult':
                this.cat6Names.push(name);
            }
          }
        }

        this.names.sort((a, b) => 0.5 - Math.random());
        //console.log(this.names);
      });
    });
  }
}
