import { Component, OnInit } from '@angular/core';
import { DataService } from '../data.service';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-delete-result',
  templateUrl: './delete-result.component.html',
  styleUrls: ['./delete-result.component.scss']
})
export class DeleteResultComponent implements OnInit {

  constructor(public dataService: DataService, private activatedRoute: ActivatedRoute) { }

  public category;
  public date;
  public season;
  public id;

  public enable = false;

  ngOnInit() {
    this.dataService.isLoaded = false;

    this.dataService.checkSession();
    
    this.dataService.getSession().then(session => {
      if(session.type != "Admin"){
        this.dataService.redirectToLogin();
      }
    });

    this.activatedRoute.queryParams.subscribe(params => {
      this.dataService.getPromiseReq(`/results/get/meta/${params['id']}`).then(result => {
        this.category = result.category;
        this.date = result.created_at;
        this.season = result.season;
        this.id = result.id;

        this.enable = true;
      });
    });
    
    this.dataService.isLoaded = true;    
  }

  public delete(){
    this.dataService.deleteResults(this.id).then(result => {
      this.dataService.redirectToResults();
    });
  }

}
