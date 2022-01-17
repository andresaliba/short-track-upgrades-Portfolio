import { Component, OnInit } from '@angular/core';
import { DataService } from '../data.service';
import { FormGroup, FormControl, FormBuilder, Validators, FormArray } from '@angular/forms';
import { Racer } from './../racers.model';

@Component({
  selector: 'app-admin-edit-racers',
  templateUrl: './admin-edit-racers.component.html',
  styleUrls: ['./admin-edit-racers.component.scss']
})
export class AdminEditRacersComponent implements OnInit {
  constructor(public dataService: DataService, private fb: FormBuilder) {}

  racerForm: FormGroup;
  children: FormArray;

  ngOnInit() {

    this.dataService.isLoaded = false;
    this.dataService.checkSession();


    this.racerForm = this.fb.group({
      type: 'Parent',
      firstName: [this.dataService.racer.firstName, Validators.required],
      lastName: ['', Validators.required],
      address: ['', Validators.required],
      city: ['', Validators.required],
      postalCode: ['', Validators.required],
      phoneNum: ['', Validators.required],
      sex: 'Male',
      category: 'Run-Bike',
      plateNum: '',
      children: this.fb.array([]),
      attended: 'no'
    });

    //! This has to happen before the html is loaded
    //console.log(this.dataService.children);
    this.dataService.children.forEach(child => {
      this.children = this.racerForm.get('children') as FormArray;
      this.children.push(this.createItem(child));
    });
    
    this.dataService.isLoaded = true;

  }

  //template for a child racer
  public createItem(child: Racer): FormGroup {
    return this.fb.group({
      type: 'Child',
      belongsTo: child.belongsTo,
      firstName: [child.firstName, Validators.required],
      lastName: [child.lastName, Validators.required],
      plateNum: child.plateNum,
      sex: child.sex,
      category: child.category,
      attended: child.attended
    });
  }
}
