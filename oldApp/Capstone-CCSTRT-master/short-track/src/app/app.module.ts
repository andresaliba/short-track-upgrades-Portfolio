import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { AppComponent } from './app.component';
import { DataService } from './data.service';
import { LoginComponent } from './login/login.component';
import { AboutComponent } from './about/about.component';
import { HomeComponent } from './home/home.component';
import { ResultsComponent } from './results/results.component';
import { SignUpComponent } from './sign-up/sign-up.component';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { RacerTableComponent } from './racer-table/racer-table.component';
import { SettingsComponent } from './settings/settings.component';
import { ReactiveFormsModule } from '@angular/forms';
import { DeleteComponent } from './delete/delete.component';
import { PaymentComponent } from './payment/payment.component';
import { RePaymentComponent } from './re-payment/re-payment.component';
import { EditRacersComponent } from './edit-racers/edit-racers.component';
import { AdminEditRacersComponent } from './admin-edit-racers/admin-edit-racers.component';
import { ResetPasswordComponent } from './reset-password/reset-password.component';
import { RacerInputComponent } from './racer-input/racer-input.component';
import { ResultComponent } from './result/result.component';
import { DeleteResultComponent } from './delete-result/delete-result.component';
import { PrintOutComponent } from './print-out/print-out.component';
import { TotalPointsComponent } from './total-points/total-points.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    AboutComponent,
    HomeComponent,
    ResultsComponent,
    SignUpComponent,
    PaymentComponent,
    RacerTableComponent,
    SettingsComponent,
    DeleteComponent,
    EditRacersComponent,
    AdminEditRacersComponent,
    RePaymentComponent,
    PaymentComponent,
    RePaymentComponent,
    EditRacersComponent,
    AdminEditRacersComponent,
    ResetPasswordComponent,
    RacerInputComponent,
    ResultComponent,
    DeleteResultComponent,
    PrintOutComponent,
    TotalPointsComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
    RouterModule.forRoot([
      { path: 'home', component: HomeComponent },
      { path: 'about', component: AboutComponent },
      { path: 'login', component: LoginComponent },
      { path: 'results', component: ResultsComponent },
      { path: 'results/show', component: ResultComponent },
      { path: 'signup', component: SignUpComponent },
      { path: 'signup/payment', component: PaymentComponent },
      { path: 'admin/settings', component: SettingsComponent },
      { path: 'admin/reset-password', component: ResetPasswordComponent },
      { path: 'admin/racers', component: RacerTableComponent },
      { path: 'admin/total-points', component: TotalPointsComponent },
      { path: 'admin/racers/edit', component: EditRacersComponent },
      { path: 'admin/racers/delete', component: DeleteComponent },
      { path: 'admin/racers/edit/:id', component: AdminEditRacersComponent },
      { path: 'racer-admin/edit/:id', component: EditRacersComponent },
      { path: 'racer-admin/payment', component: RePaymentComponent },
      { path: 'admin/racers-input', component: RacerInputComponent },
      { path: 'admin/results/delete', component: DeleteResultComponent },
      { path: 'admin/ballots/attended', component: PrintOutComponent },
      { path: '', redirectTo: 'home', pathMatch: 'full' },
      { path: '**', redirectTo: 'home', pathMatch: 'full' }
    ])
  ],
  providers: [DataService],
  bootstrap: [AppComponent]
})
export class AppModule {}
