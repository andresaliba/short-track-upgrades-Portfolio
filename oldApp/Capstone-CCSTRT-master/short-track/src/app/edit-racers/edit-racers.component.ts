import { Component, OnInit } from '@angular/core';
import { DataService } from '../data.service';
import { FormGroup, FormControl, FormBuilder, Validators, FormArray } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { Racer } from '../racers.model';
import { Router } from '@angular/router';

@Component({
  selector: 'app-edit-racers',
  templateUrl: './edit-racers.component.html',
  styleUrls: ['./edit-racers.component.scss']
})
export class EditRacersComponent implements OnInit {
  private racer: Racer;

  constructor(
    public dataService: DataService,
    private router: Router,
    private fb: FormBuilder,
    private activatedRoute: ActivatedRoute
  ) {}

  racerForm: FormGroup;
  children: FormArray;

  ngOnInit() {
    this.dataService.isLoaded = false;

    this.racerForm = this.fb.group({
      id: '',
      type: 'Parent',
      firstName: ['', Validators.required],
      lastName: ['', Validators.required],
      address: ['', Validators.required],
      city: ['', Validators.required],
      postalCode: ['', Validators.required],
      phoneNum: ['', Validators.required],
      sex: 'Male',
      category: 'Run-Bike',
      belongsTo: '',
      plateNum: { value: ''}
    });


    this.dataService.checkSession();

    this.dataService.getSession().then(session => {

      //console.log(session);
      
      // this.racerFormChild = this.fb.group() {

      // }

      //! disabled for now because of errors
      this.activatedRoute.queryParams.subscribe(params => {
        this.dataService.getRacer(params['id']).then(data => {
          this.racer = data;
          if(session.type == "Admin" || (session.racerID == this.racer.id || session.racerID == this.racer.belongsTo)){
            this.racerForm.get('id').setValue(this.racer.id);
            this.racerForm.get('type').setValue(this.racer.type);
            this.racerForm.get('firstName').setValue(this.racer.firstName);
            this.racerForm.get('lastName').setValue(this.racer.lastName);
            this.racerForm.get('address').setValue(this.racer.address);
            this.racerForm.get('city').setValue(this.racer.city);
            this.racerForm.get('belongsTo').setValue(this.racer.belongsTo);
            this.racerForm.get('postalCode').setValue(this.racer.postalCode);
            this.racerForm.get('phoneNum').setValue(this.racer.phoneNum);
            this.racerForm.get('sex').setValue(this.racer.sex);
            this.racerForm.get('category').setValue(this.racer.category);
            this.racerForm.get('plateNum').setValue(this.racer.plateNum);
          } else {
            this.dataService.redirectToLogin();
          }
        });
      });
    });

    this.dataService.isLoaded = true;
  }

  public onSubmit(): void {
    this.dataService.editRacer(this.racerForm.value);
    //console.log(this.racerForm.value);
    this.racerForm.reset();
    this.router.navigate(['/admin/racers']);
  }

  public cancel(): void {
    this.racerForm.reset();
    this.router.navigate(['/admin/racers']);
  }
}
