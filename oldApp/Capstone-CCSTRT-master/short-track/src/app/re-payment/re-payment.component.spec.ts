import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RePaymentComponent } from './re-payment.component';

describe('RePaymentComponent', () => {
  let component: RePaymentComponent;
  let fixture: ComponentFixture<RePaymentComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RePaymentComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RePaymentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
