import { Component, OnInit } from '@angular/core';
import { DataService } from '../data.service';

@Component({
  selector: 'app-results',
  templateUrl: './results.component.html',
  styleUrls: ['./results.component.scss']
})
export class ResultsComponent implements OnInit {

  public results: any[] = [];

  constructor(public dataService: DataService) { }

  ngOnInit() {
    this.dataService.isLoaded = false;
    this.dataService.checkSession();
    this.dataService.getAllResults().then(results => {
        this.results = results;
        this.dataService.isLoaded = true;
    });
  }

}
