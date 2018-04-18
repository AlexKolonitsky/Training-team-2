import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { ProfileComponent }   from './profile/profile.component';
import { VacanciesComponent } from './vacancies/vacancies.component';
import { AppComponent }      from './app.component';
import { InterviewComponent} from "./interview/interview.component";
import { CandidatesComponent} from './candidates/candidates.component';
 
const routes: Routes = [
  { path: 'profile/:id', component: ProfileComponent },
  { path: 'vacancies', component: VacanciesComponent },
  { path: 'interview', component: InterviewComponent },
  { path: 'candidates', component: CandidatesComponent}
  // { path: '', component: AppComponent, pathMatch: 'full' },
];

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule { }
