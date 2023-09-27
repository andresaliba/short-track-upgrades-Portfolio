import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PrintOutComponent } from './print-out.component';

describe('PrintOutComponent', () => {
  let component: PrintOutComponent;
  let fixture: ComponentFixture<PrintOutComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PrintOutComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PrintOutComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
