/**
 * Created by Denis on 07.03.2018.
 */
'use strict';

function Candidates() {
	let _self = this;
	
	
	
	let _$button = $('#control').data({
		"model": {
			"current": 0,
			"page": 1
		}
	});
	
	let _$inputField = $('.search-input').data({
		"model": {
			"fullName": "none"
		}
	});
	
	$.extend(_$inputField, {
		"changeInputState": function (event) {
			event.stopPropagation();
			event.preventDefault();
		
			_$inputField.data('model').fullName = _$inputField.val() || "none";
			
			_$button.data("model").current = 0;
			_$button.data("model").page = 1;
			
			return false;
		}
	});
	
	let _$filter = $('.filter').data({
		"model": {
			"state": "Empty",
		}
	});
	
	$.extend(_$filter,{
		"changeFilterState": function (event) {
			event.stopPropagation();
			event.preventDefault();
			
			_$filter.data('model').state = this.text;
			$('#current-state').html(	_$filter.data('model').state);
			
			_$button.data('model').current = 0;
			_$button.data('model').page = 1;
		
			
			return false;
		}
	});
	
	let _$rows = $('#count-items').data({
		"model": {
			"currentRowsNumber": 10
		}
	});
	
	$.extend(_$rows, {
		"changeRowsNumber": function (event) {
			event.stopPropagation();
			event.preventDefault();
			
			_$rows.data('model').currentRowsNumber = this.text;
			
			$("#current-items").html(_$rows.data('model').currentRowsNumber);
			
			_$button.data('model').current = 0;
			_$button.data('model').page = 1;
			
			
			return false;
		}
	});
	
	let _$content = $('.content-candidates-cards').data({
		"model": {
			"getModel": function (item) {
				item = item || {};
				item.name = item.name || "";
				item.lastName = item.lastName || "";
				item.position = item.position || "";
				item.payment = item.payment || "";
				item.image = item.image || "";
				return item;
			}
		}
	});
	
	$.extend(_$content, {
		"addItems": function (items) {
			
			items.forEach($.proxy(this, "addItem"));
			
		},
		"addItem": function (item) {
			
			item = this.data("model").getModel(item);
			
		},
		"isEmpty": function () {
			
		},
		"clear": function () {
			
		},
		"loadItems": function (event) {
			
			let query = {};
			query.rows = _$rows.data("model").currentRowsNumber;
			query.begin = _$button.data("model").current;
			query.page = _$button.data("model").page;
			query.filter = "state=" +_$filter.data("model").state + "&" + "fullName=" + _$inputField.data("model").fullName;
			
			$.getJSON("http://localhost:3001/candidates/", query, function (json) {
				_$content.clear();
				
				json.status === 200 && Array.isArray(json.data) && _$content.addItems(json.data);
				
				$("#range").html(json.range);
				
			}).done(function () {
				
			});
		}
	});
	
	
	_self.init = function () {
		_self.initHandler();
		_$content.trigger("loadItems");
	};
	
	_self.initHandler = function () {
		_$rows.on("click", ".dropdown-content a", _$rows.changeRowsNumber);
		_$filter.on("click",".dropdown-content a", _$filter.changeFilterState);
		_$inputField.on("keyup",_$inputField.changeInputState);
		_$content.on("loadItems", _$content.loadItems);
	};
}

$(new Candidates().init);