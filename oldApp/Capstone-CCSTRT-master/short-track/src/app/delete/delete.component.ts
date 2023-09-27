import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { DataService } from '../data.service';
import { Racer } from '../racers.model';

@Component({
  selector: 'app-delete',
  templateUrl: './delete.component.html',
  styleUrls: ['./delete.component.scss']
})
export class DeleteComponent implements OnInit {

  public racer:Racer;
  public children:Racer[];
  public hasChildren:boolean = null;
  public canSubmit:boolean = false;

  public idParams;

  constructor(public dataService: DataService,
    private router: Router,
    private activatedRoute: ActivatedRoute) { }

  ngOnInit() {
    this.dataService.isLoaded = false;
    this.dataService.checkSession();

    this.dataService.getSession().then(session => {
    
      if(session.type == "Admin"){
        this.activatedRoute.queryParams.subscribe(params => {

          this.dataService.getRacer(params['id']).then(data=> {
            
            this.idParams = params['id'];

            //Get the racer type first before proceeding
            this.racer = data;
          
            if(this.racer.type == 'Parent'){
              this.dataService.getChildrenToPromise(this.racer.id).then((children:any) => {
                this.children = children;

                if(children.length > 0){
                  this.hasChildren = true;
                  this.canSubmit = true;
                } else {
                  this.hasChildren = false;
                  this.canSubmit = true;
                }
              });
            } else {
              this.hasChildren = false;
              this.canSubmit = true;
            }
          });
        });
      } else{
        this.dataService.redirectToLogin();
      }
    });

    this.dataService.isLoaded = true;
  }

  public onSubmit(){
    this.dataService.deleteRacer(this.idParams);
    this.router.navigate(['/admin/racers']);
  }

  public cancel(){
    this.router.navigate(['/admin/racers']);
  }

}
