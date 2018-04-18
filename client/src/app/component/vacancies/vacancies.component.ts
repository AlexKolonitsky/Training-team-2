 import { Component,TemplateRef} from '@angular/core';
 import {BsModalService} from "ngx-bootstrap/modal";
 import { BsModalRef } from 'ngx-bootstrap/modal/bs-modal-ref.service';


 import {Vacancies} from './vacancies';

 @Component({
   selector: 'app-vacancies',
   templateUrl: './vacancies.component.html',
   styleUrls: ['./vacancies.component.css']
 })

 export class VacanciesComponent  {

   items: Vacancies[] =
     [
       { vacancy: "Big Data Developer", description: "blabla", salary: 1500, candidates: "View Candidates" },
       { vacancy: "Senior Java Developer", description: "blabla", salary: 2000,candidates: "View Candidates" },
       { vacancy: "Senior Java Developer", description: "blabla", salary: 2000, candidates: "View Candidates"},
       { vacancy: "React Native Developer", description: "blabla", salary:3000, candidates: "View Candidates"},
       { vacancy: "React Native Developer", description: "blabla", salary:3000, candidates: "View Candidates"},
       { vacancy: "Big Data Developer", description: "blabla", salary:3000, candidates: "View Candidates"},
       { vacancy: "Big Data Developer", description: "blabla", salary:3000, candidates: "View Candidates"}
     ];


   modalRef: BsModalRef;

   constructor(private modalService: BsModalService) {
   }

   openModal(template: TemplateRef<any>) {
     this.modalRef = this.modalService.show(template);
   }

 }
