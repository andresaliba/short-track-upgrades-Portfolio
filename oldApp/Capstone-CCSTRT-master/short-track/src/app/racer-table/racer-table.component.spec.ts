import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RacerTableComponent } from './racer-table.component';

describe('RacerTableComponent', () => {
  let component: RacerTableComponent;
  let fixture: ComponentFixture<RacerTableComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RacerTableComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RacerTableComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
