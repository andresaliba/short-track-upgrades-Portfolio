import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TotalPointsComponent } from './total-points.component';

describe('TotalPointsComponent', () => {
  let component: TotalPointsComponent;
  let fixture: ComponentFixture<TotalPointsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TotalPointsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TotalPointsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
