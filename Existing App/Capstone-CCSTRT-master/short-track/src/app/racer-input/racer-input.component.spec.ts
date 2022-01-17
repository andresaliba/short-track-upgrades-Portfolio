import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RacerInputComponent } from './racer-input.component';

describe('RacerInputComponent', () => {
  let component: RacerInputComponent;
  let fixture: ComponentFixture<RacerInputComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RacerInputComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RacerInputComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
