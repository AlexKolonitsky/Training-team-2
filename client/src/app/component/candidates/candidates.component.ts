import { Component, OnInit } from '@angular/core';

import {Candidate} from './candidate'

@Component({
	moduleId: module.id,
    selector: 'app-candidates',
    templateUrl: 'candidates.component.html',
    styleUrls: ['candidates.component.css']
})
export class CandidatesComponent implements OnInit {

	candidates: Candidate[] =  [
		{photo: 'http://via.placeholder.com/500x350/66bfff', name: 'Ivan', email: 'ivanov@gmail.com', position: 'Java Developer', date: '2018-03-24', status: 'New'},
		{photo: 'http://via.placeholder.com/500x350/66bfff', name: 'Ward', email: 'ward@gmail.com', position: '.Net Developer', date: '2018-03-02', status: 'Accepted for Interview'},
		{photo: 'http://via.placeholder.com/500x350/66bfff', name: 'Augustine', email: 'aug@gmail.com', position: 'JavaScript Developer', date: '2018-03-03', status: 'CV-Rejected'},
		{photo: 'http://via.placeholder.com/500x350/66bfff', name: 'Colombina', email: 'gae@gmail.com', position: 'Java Developer', date: '2018-03-03', status: 'CV-Accepted'}
	];	

  constructor() { }

  ngOnInit() {
  }

}
