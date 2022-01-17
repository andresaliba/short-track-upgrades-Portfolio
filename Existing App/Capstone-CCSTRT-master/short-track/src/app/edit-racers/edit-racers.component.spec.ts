import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EditRacersComponent } from './edit-racers.component';

describe('EditRacersComponent', () => {
  let component: EditRacersComponent;
  let fixture: ComponentFixture<EditRacersComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EditRacersComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EditRacersComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
