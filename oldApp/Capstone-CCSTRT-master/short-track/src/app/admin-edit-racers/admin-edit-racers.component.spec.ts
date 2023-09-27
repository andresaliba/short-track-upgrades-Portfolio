import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminEditRacersComponent } from './admin-edit-racers.component';

describe('AdminEditRacersComponent', () => {
  let component: AdminEditRacersComponent;
  let fixture: ComponentFixture<AdminEditRacersComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AdminEditRacersComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AdminEditRacersComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
