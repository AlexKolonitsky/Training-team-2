/**
 * Created by Denis on 07.03.2018.
 */
'use strict';

function Candidates() {
	let _self = this;
	
	let _$content = $('#cards').data({
		"model": {
			"getModel": function(item) {
				item = item || {};
				item.name = item.name || "";
				item.lastName = item.lastName || "";
				item.position = item.position || "";
				item.status = item.status || "";
				item.payment = item.payment || "";
				item.image = item.image || "";
				item.date = item.date || "";
				return item;
			}
		}
	});
	
	let _$button = $('#control').data({
		"model": {
			"current": 0,
			"page": 1
		}
	});
	
	let _$rows = $('#count-items').data({
		"model": {
			"currentRowsNumber": 10
		}
	});
	
	$.extend(_$button, {
		"onPressed": function (event) {
			event.stopPropagation();
			event.preventDefault();
			
			if ($(event.target).hasClass("button-next")) {
				if (_$button.hasNext($('#total').html(), _$rows.data("model").currentRowsNumber,
						_$button.data("model").current)) {
					
					_$button.data("model").current += Number.parseInt(_$rows.data("model").currentRowsNumber);
					
					_$button.data("model").page = _$button.data("model").page + 1;
					
					_$content.loadItems();
				}
			} else {
				if (_$button.hasPrevious($('#total').html(), _$rows.data("model").currentRowsNumber,
						_$button.data("model").current)) {
					
					_$button.data("model").current -= Number.parseInt(_$rows.data("model").currentRowsNumber);
					
					_$button.data("model").page = _$button.data("model").page - 1;
					
					_$content.loadItems();
				}
			}
			return false;
		},
		"hasNext": function (total, rows, current) {
			return Number.parseInt(total) - current - rows > 0;
		},
		"hasPrevious": function (total, rows, current) {
			return current - rows >= 0;
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
			
			_$content.loadItems();
			
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
		
			_$content.loadItems();
			
			return false;
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
			
			_$content.loadItems();
			
			return false;
		}
	});
	
	
	$.extend(_$content, {
		"addItems": function (items) {
			items.forEach($.proxy(this, "addItem"));
		},
		"addItem": function (item) {
			item = this.data("model").getModel(item);
			
			let template =  "<div class='col-xs-6 col-sm-4 col-md-3 content-candidates-card'>"+
				"<div class='candidates-item'>"+
				"<div class='candidates-image'>"+
				"<span>" + item.status + "</span>"+
				"<a href='#' class='thumbnail'>" +
				"<img src='"+ item.image +"' alt='...'>"+ "</a></div>"+
				"<div class='caption'>"+
				"<p class='candidates-item-job-position'>" + item.position + "</p>"+
				"<p class='candidates-item-name'>" + item.name + " "+ item.lastName +"</p>"+
				"<p class='candidates-item-salary'>" + item.payment + "</p>"+
				"<p class='candidates-item-time'>" + item.date + " day later</p></div></div></div>";
				this.append(template);
		},
		"isEmpty": function () {
			if (!$("div", this).length) {
				this.append($('<div class=" text-center">' +
					'No result found</div>'));
			}
		},
		"clear": function () {
			this.empty();
		},
		"loadItems": function () {
			
			let query = {};
			query.rows = _$rows.data("model").currentRowsNumber;
			query.begin = _$button.data("model").current;
			query.page = _$button.data("model").page;
			query.filter = ["state=" +_$filter.data("model").state, "name=" + _$inputField.data("model").fullName].join("&");
			
			$.getJSON("http://localhost:3001/candidates/", query, function (json) {
				_$content.clear();
				
				json.status === 200 && Array.isArray(json.data) && _$content.addItems(json.data);
				
				$("#total").html(json.total);
				$("#range").html(json.range);
				_$content.isEmpty();
				
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
		_$button.on("click", _$button.onPressed);
		_$inputField.on("keyup",_$inputField.changeInputState);
		_$content.on("loadItems", _$content.loadItems);
	};
}

$(new Candidates().init);