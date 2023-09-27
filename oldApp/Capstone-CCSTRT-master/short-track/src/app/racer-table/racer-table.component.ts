import { Component, OnInit } from '@angular/core';
import { DataService } from '../data.service';
import { ActivatedRoute, Router } from '@angular/router';
import { FormBuilder, Validators } from '@angular/forms';

@Component({
  selector: 'app-racer-table',
  templateUrl: './racer-table.component.html',
  styleUrls: ['./racer-table.component.scss']
})
export class RacerTableComponent implements OnInit {
  public searchForm;
  public checkInArgs: any[] = [];
  public category = 0;

  private loggedInID;
  public parentRacer;
  public racers;
  public admin: boolean = false;

  public plateLength = 0;
  public searchMethod = 1;

  constructor(
    public dataService: DataService,
    private router: Router,
    private fb: FormBuilder,
    private activatedRoute: ActivatedRoute
  ) {}

  ngOnInit() {

    this.dataService.isLoaded = false;

    this.searchForm = this.fb.group({
      type: 0,
      searchMethod: 1,
      plateNum: ['', Validators.required],
      category: 1,
      attendance: false,
      random: false
    });

    this.dataService.checkSession();

    //this will NOT send out request if the user is not logged in
    //this will cause an unauthorized error because the session does not exist
    //that is why we checked if the user is logged in
    this.dataService.getSession().then(data => {
      this.loggedInID = data.racerID;

      if (data.type == 'Admin') {
        this.dataService.getPromiseReq('/racers/get').then(racers => {
          this.dataService.racers = racers;
          this.admin = true;
          this.dataService.isLoaded = true;

        });
      } else if (data.type == 'Racer') {
        this.dataService.getRacer(this.loggedInID).then(data => {
          this.parentRacer = data;
          this.dataService.getChildrenToPromise(this.loggedInID).then(data => {
            this.racers = data;
            this.racers.unshift(this.parentRacer);
            this.dataService.racers = this.racers;
          });
        });
        this.dataService.isLoaded = true;
      } else {
        this.dataService.redirectToLogin();
      }
    });
  }

  public checkIn() {
    this.dataService.checkIn(this.checkInArgs);
  }

  public toggleCheckbox(id) {
    if (this.checkInArgs.includes(id)) {
      this.checkInArgs.splice(this.checkInArgs.indexOf(id));
    } else {
      this.checkInArgs.push(id);
    }

    //console.log(this.checkInArgs);
  }

  public changeForm() {
    this.searchMethod = this.searchForm.get('searchMethod').value;
    this.searchForm.get('searchMethod').setValue(this.searchMethod);
  }

  public categoryChange() {
    this.category = this.searchForm.get('category').value;
  }

  public onSubmit() {
    //console.log(this.searchForm.value);
    ///racers/search/:type/:needle/:attended
    let searchUrl;

    let searchNum = this.searchForm.value.searchMethod;

    if (searchNum == 2) {
      if (this.searchForm.value.attendance) {
        searchUrl = `/racers/search/category/${this.searchForm.value.category}/attended`;

        if(this.searchForm.value.random){
          searchUrl += "/random";
        }
      } else {
        searchUrl = `/racers/search/category/${this.searchForm.value.category}`;

        if(this.searchForm.value.random){
          searchUrl += "/tricky/random";
        }
      }
    } else {
      searchUrl = '/racers/search/attended';
    }

    if (searchNum != 1) {
      this.dataService.getPromiseReq(searchUrl).then(result => {
        this.dataService.racers = result;
      });
    } else {
      this.dataService.getRacerByPlate(this.searchForm.value.plateNum).then(result => {
        let racerArray: any[] = [result];
        this.dataService.racers = racerArray;
      });
    }
  }
}
