import { Component, OnInit } from '@angular/core';
import { DataService } from '../data.service';
import { Racer } from '../racers.model';

@Component({
  selector: 'app-total-points',
  templateUrl: './total-points.component.html',
  styleUrls: ['./total-points.component.scss']
})
export class TotalPointsComponent implements OnInit {
  constructor(public dataService: DataService) {}

  public runBikePoints: Racer[] = [];
  public oneUnderPoints: Racer[] = [];
  public twoThreePoints: Racer[] = [];
  public fourSixPoints: Racer[] = [];
  public jrHighPoints: Racer[] = [];
  public adultPoints: Racer[] = [];

  ngOnInit() {
    this.dataService.isLoaded = false;

    this.dataService.checkSession();

    this.dataService.getSession().then(session => {
      if (session.type != 'Admin') {
        this.dataService.redirectToLogin();
      }
    });

    this.dataService
      .getRacerByPoints()
      .then(racers => {
        racers.forEach(racer => {
          switch (racer.category) {
            case 'Run-Bike':
              this.runBikePoints.push(racer);
              break;
            case 'Grade 1-Under':
              this.oneUnderPoints.push(racer);
              break;
            case 'Grade 2-3':
              this.twoThreePoints.push(racer);
              break;
            case 'Grade 4-6':
              this.fourSixPoints.push(racer);
              break;
            case 'Jr. High':
              this.jrHighPoints.push(racer);
              break;
            case 'Adult':
              this.adultPoints.push(racer);
          }
        });
      })
      .catch(err => {});
  }
}
