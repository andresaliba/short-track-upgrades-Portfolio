import { Component, OnInit } from '@angular/core';
import { DataService } from '../data.service';
import { ActivatedRoute } from '@angular/router';
import { Racer } from '../racers.model';

@Component({
  selector: 'app-result',
  templateUrl: './result.component.html',
  styleUrls: ['./result.component.scss']
})
export class ResultComponent implements OnInit {
  public racers: Racer[] = [];
  public fakeArray;
  public category;
  public date;
  public season;
  public id;

  constructor(public dataService: DataService, private activatedRoute: ActivatedRoute) {}

  ngOnInit() {
    this.dataService.isLoaded = false;

    this.dataService.checkSession();

    this.activatedRoute.queryParams.subscribe(params => {
      this.dataService.getPromiseReq(`/results/get/meta/${params['id']}`).then(result => {
        this.category = result.category;
        this.date = result.created_at;
        this.season = result.season;
        this.id = result.id;
      });

      this.dataService.getResults(params['id']).then(results => {
        //console.log(results);
        this.racers = results[0];
        this.fakeArray = new Array(Number(results[1]));
      });
    });

    this.dataService.isLoaded = true;
  }
}
