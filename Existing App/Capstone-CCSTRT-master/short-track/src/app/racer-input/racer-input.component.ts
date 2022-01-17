import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { FormBuilder, FormGroup, Validators, FormArray } from '@angular/forms';
import { DataService } from '../data.service';
import { Racer } from '../racers.model';
import { empty } from 'rxjs/Observer';

@Component({
  selector: 'app-racer-input',
  templateUrl: './racer-input.component.html',
  styleUrls: ['./racer-input.component.scss']
})
export class RacerInputComponent implements OnInit {
  public racers: Racer[] = [];
  public racerForm;
  public resultsForm;

  public platesFormArray: FormArray;

  public plateNumArray: number[] = [];
  public resultsArray: any[] = [];
  public maxLaps: number = 0;

  public invalidPlates: any[] = [];
  public invalidPlatesText: string = ' ';
  public validForm: boolean = true;

  constructor(
    public dataService: DataService,
    private router: Router,
    private fb: FormBuilder,
    private activatedRoute: ActivatedRoute
  ) {}

  ngOnInit() {
    this.dataService.isLoaded = false;

    this.racerForm = this.fb.group({
      plateNum: this.fb.array([])
    });

    this.resultsForm = this.fb.group({
      results: '',
      season: 'Spring',
      category: 'Run-Bike'
    });

    this.dataService.checkSession();

    this.dataService.getSession().then(session => {
      if (session.type != 'Admin' && session.type != 'Volunteer') {
        this.dataService.redirectToLogin();
      }
    });

    this.addChild();

    this.dataService.isLoaded = true;
  }

  //template for a plate number
  public createItem(): FormGroup {
    return this.fb.group({
      plateNum: ['', Validators.required]
    });
  }

  //append a new racer to the parent account
  public addChild(): void {
    this.platesFormArray = this.racerForm.get('plateNum') as FormArray;
    this.platesFormArray.push(this.createItem());
  }

  //remove additional racer from form
  public removeChild(): void {
    this.platesFormArray = this.racerForm.get('plateNum') as FormArray;
    let i = this.platesFormArray.length - 1;
    this.platesFormArray.removeAt(i);
  }

  // Add plateNumber to array of plates
  public add() {
    let plateNum = this.racerForm.value.plateNum;

    this.dataService.getRacerByPlate(plateNum).then(racer => {
      if (racer && racer['exists'] != false && racer.category == this.resultsForm.value.category) {
        this.plateNumArray.push(plateNum);
      }
    });
  }

  public empty() {
    this.platesFormArray = this.racerForm.get('plateNum') as FormArray;
    for (let i = this.platesFormArray.length - 1; i >= 0; i--) {
      this.platesFormArray.removeAt(i);
    }
    this.addChild();
  }

  public onSubmit() {
    //! Not working?
    this.dataService.isLoaded = false;
    this.validForm = true;
    let platesSeen: any[] = [];
    let plateStringArray: string[] = [];
    let laps: number = 0;
    this.plateNumArray.length = 0;
    let platesToValidate: any[] = [];
    this.invalidPlatesText = ' ';

    this.racerForm.value.plateNum.forEach(plate => {
      this.plateNumArray.push(plate.plateNum);
      if (this.getOccurance(platesToValidate, plate.plateNum) < 1) {
        platesToValidate.push(plate.plateNum);
      }
    });

    // Validate Plates
    this.dataService
      .checkRacerByPlate(platesToValidate[0])
      .then(result => {
        if (result.exists == false || result.category != this.resultsForm.value.category) {
          this.validForm = false;
        }
      })
      .then(result => {
        platesToValidate.forEach(plate => {
          this.dataService
            .checkRacerByPlate(plate)
            .then(result => {
              //console.log('Plate ' + plate + ' is ' + result.exists);
              if (result.exists == false || result.category != this.resultsForm.value.category) {
                this.validForm = false;
                this.invalidPlatesText += '[' + plate + '] ';
              }
            })
            .catch(err => {});
        });
      })
      .then(result => {
        setTimeout(() => {
          //console.log('i am ' + this.validForm);
          if (this.validForm) {
            // Reverse the array of Plate Numbers
            this.plateNumArray.reverse();

            // Count how many laps each unique plate made and store them in resultsArray
            // Also keep track of the max number of laps done
            this.plateNumArray.forEach(plate => {
              if (this.getOccurance(platesSeen, plate) < 1) {
                laps = this.getOccurance(this.plateNumArray, plate);
                platesSeen.push(plate);
                this.resultsArray.unshift({ plate: plate, laps: laps });
                if (laps > this.maxLaps) {
                  this.maxLaps = laps;
                }
              }
            });

            // Put results in order by laps and make array of results in string to store in database
            // String will have plate.laps Ex: 123.4 is plate 123 and 4 laps
            for (let i = this.maxLaps; i >= 0; i--) {
              this.resultsArray.forEach(result => {
                if (result.laps == i) {
                  plateStringArray.push(result.plate + '.' + result.laps);
                }
              });
            }

            // Combine string array into one giant string with max laps on the end separated by :
            let plateString = plateStringArray.join(', ') + ' :' + this.maxLaps;

            // Set results value of the form to the giant string we created above
            this.resultsForm.get('results').setValue(plateString);
            // Add the result to the database
            this.dataService.addResult(this.resultsForm.value);
            //console.log(this.resultsForm.value);

            this.empty();
          }
          this.dataService.isLoaded = true;
        }, 1800);
      })
      .catch(err => {});
  }

  // Returns how many times Value was seen in Array
  public getOccurance(array, value) {
    return array.filter(v => v === value).length;
  }
}
