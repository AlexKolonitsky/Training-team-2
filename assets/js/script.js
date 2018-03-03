"use strict";

function Application() {
	
	let _self = this;
	
	let _$navMenu = $("#nav-menu");
	
	let _$totalRows = $("#total");
	
	let _$rows = $("#count-items").data({
		"model": {
			"currentRowsNumber": 10,
			"getCurrentRowsNumber": function () {
				return _$rows.data("model").currentRowsNumber;
			},
			"setCurrentRowsNumber": function (number) {
				_$rows.data("model").currentRowsNumber = number;
			}
		}
	});
	
	let _$table = $(".table").data({
		"model": {
			"getModel": function (item) {
				item = item || {};
				item.name = item.name || "";
				item.lastName = item.lastName || "";
				item.position = item.position || "";
				item.email = item.email || "soma@gmail.ru";
				return item;
			}
		}
	});
	
	let _$filter = $(".filters").data({
		"model": {
			"value": ["position=none", "name=none", "email=none", "lastName=none"]
		}
	});
	
	let _$buttonGroup = $("#table-control").data({
		"model": {
			"current": 0,
			"page": 1
		}
	});
	
	$.extend(_$buttonGroup, {
		"onPressed": function (event) {
			event.stopPropagation();
			event.preventDefault();
			
			if ($(event.target).hasClass("button-next")) {
				if (_$buttonGroup.hasNext(_$totalRows.html(), _$rows.data("model").currentRowsNumber,
						_$buttonGroup.data("model").current)) {
					
					_$buttonGroup.data("model").current += Number.parseInt(_$rows.data("model").currentRowsNumber);
					
					_$buttonGroup.data("model").page = _$buttonGroup.data("model").page + 1;
					
					_$table.loadItems(event, {
						begin: _$buttonGroup.data("model").current,
						page: _$buttonGroup.data("model").page
					});
				}
			} else {
				if (_$buttonGroup.hasPrevious(_$totalRows.html(), _$rows.data("model").currentRowsNumber,
						_$buttonGroup.data("model").current)) {
					
					_$buttonGroup.data("model").current -= Number.parseInt(_$rows.data("model").currentRowsNumber);
					
					_$buttonGroup.data("model").page = _$buttonGroup.data("model").page - 1;
					
					_$table.loadItems(event, {
						begin: _$buttonGroup.data("model").current,
						page: _$buttonGroup.data("model").page
					});
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
	
	$.extend(_$filter, {
		"onKeyUp": function (event) {
			event.stopPropagation();
			event.preventDefault();
			
			let element = $(event.target).attr("id");
			
			_$filter.addFilter(_$filter.getInputValue(element), element);
			
			_$buttonGroup.data("model").current = 0;
			_$buttonGroup.data("model").page = 1;
			
			_$table.loadItems();
			
			return false;
		},
		"addFilter": function (value, id) {
			
			if (id === "position") {
				
				_$filter.data("model").value[0] = "position=" + value;
				
			} else if (id === "name") {
				
				_$filter.data("model").value[1] = "name=" + value;
				
			} else if (id === "mail") {
				
				_$filter.data("model").value[2] = "email=" + value;
				
			} else if (id === "last-name") {
				
				_$filter.data("model").value[3] = "lastName=" + value;
				
			}
		},
		"getInputValue": function (elementId) {
			let id = "#" + elementId;
			/*replace with template for regexp*/
			if ($(id).val() === "") {
				return "none";
			}
			return $(id).val();
		}
	});
	
	$.extend(_$table, {
		"addItems": function (items) {
			
			items.forEach($.proxy(this, "addItem"));
			
		},
		"addItem": function (item) {
			
			item = this.data("model").getModel(item);
			
			this.append(
				"<tr><td>" + item.position + "</td>" +
				"<td>" + item.lastName + "</td>" +
				"<td class='mobile-device'>" + item.name + "</td>" +
				"<td class='mobile-device'>" + item.email + "</td>" +
				"<td><a href='#'>View</a></td></tr>"
			);
			
		},
		"isEmpty": function () {
			if (!$("tr td", this).length) {
				this.append($('<tr class="no-result text-center">' +
					'<td colspan="' + $('.filters th').length + '">' +
					'No result found</td></tr>'));
			}
		},
		"clear": function () {
			this.find("tbody").empty();
		},
		"loadItems": function (event, data) {
			data = data || {};
			
			let query = {};
			query.rows = _$rows.data("model").getCurrentRowsNumber();
			query.begin = data.begin || 0;
			query.page = data.page || 1;
			query.filter = _$filter.data("model").value.join("&");
			
			$.getJSON("http://localhost:8088/rest/vacancies/", query, function (json) {
				_$table.clear();
				
				json.status === 200 && Array.isArray(json.data) && _$table.addItems(json.data);
				
				_$totalRows.html(json.total);
				
				_$table.isEmpty();
				
				$("#range").html(json.range);
				
			}).done(function () {
				
				
			});
		}
	});
	
	$.extend(_$rows, {
		"changeRowsNumber": function (event) {
			event.stopPropagation();
			event.preventDefault();
			
			_$rows.data("model").setCurrentRowsNumber(this.text);
			
			$("#current-items-count").html(_$rows.data("model").getCurrentRowsNumber());
			_$buttonGroup.data("model").current = 0;
			_$buttonGroup.data("model").page = 1;
			
			_$table.loadItems();
			
			return false;
		}
	});
	
	$.extend(_$navMenu, {
		"onClick": function () {
			$('.navigation').toggleClass('show');
		}
	});
	
	_self.init = function () {
		_self.setEvent();
		_$table.trigger("loadItems");
	};
	
	_self.setEvent = function () {
		_$table.on("loadItems", _$table.loadItems);
		_$table.on("click", _$table.onClick);
		_$rows.on("click", ".dropdown-content a", _$rows.changeRowsNumber);
		_$filter.on("keyup", "input", _$filter.onKeyUp);
		_$buttonGroup.on("click", _$buttonGroup.onPressed);
		_$navMenu.on("click", _$navMenu.onClick);
	};
}

$((new Application()).init);

