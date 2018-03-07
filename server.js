/**
 * Created by Denis on 04.03.2018.
 */
'use strict';
const restify = require('restify');
const mysql = require('mysql');
const plugins = require('restify-plugins');

var connection = mysql.createConnection({
	host: '127.0.0.1',
	user: 'root',
	password: 'root',
	database: 'hr_application',
	debug: false
});

const server = restify.createServer({
	name: "test",
	version: "1.0.0",
});

server.use(plugins.jsonBodyParser());
server.use(plugins.acceptParser(server.acceptable));
server.use(plugins.queryParser());
server.use(plugins.fullResponse());

function computeRange(rows, page, total) {
	if (total % rows === 0) {
		if (page === 1) {
			return page + "-" + page * rows;
		}
		else {
			return (page * rows - rows + 1) + "-" + page * rows;
		}
	} else {
		let delta = total % rows;
		let diff = rows - delta;
		
		if (page * rows > total) {
			return ((page * rows - rows + 1) + "-" + (page * rows - diff));
		} else {
			return (page * rows - rows + 1) + "-" + (page * rows);
		}
		
	}
}

server.get("/vacancies", function (req, res) {
	let entity = {
		data: [],
		status: 0,
		total: 0,
		range: ""
	};
	
	function addFilter(filter) {
		filter = filter.split("&");
		
		let position = filter[0].substring(filter[0].indexOf("="), filter[0].length).replace("=", "");
		let name = filter[1].substring(filter[1].indexOf("="), filter[1].length).replace("=", "");
		let email = filter[2].substring(filter[2].indexOf("="), filter[2].length).replace("=", "");
		let lastName = filter[3].substring(filter[3].indexOf("="), filter[3].length).replace("=", "");
		
		
		let query = 'WHERE ';
		
		if (position !== "none") {
			query += 'JOB_TITLE LIKE ';
			query += '\'%' + position + '%\'';
			query += ' AND ';
		}
		if (name !== "none") {
			query += 'FIRST_NAME LIKE ';
			query += '\'%' + name + '%\'';
			query += ' AND ';
		}
		if (lastName !== "none") {
			query += 'LAST_NAME LIKE ';
			query += '\'%' + lastName + '%\'';
			query += ' AND ';
		}
		query = query.substring(0, (query.length - 4));
		
		return query;
	}
	
	
	if (req.query.filter === "position=none&name=none&email=none&lastName=none") {
		let vacanciesQuery = "SELECT (SELECT COUNT(*)as total FROM vacancies) as total, FIRST_NAME as name," +
			" LAST_NAME as lastName, JOB_TITLE as position" +
			" FROM vacancies LIMIT " + req.query.begin + "," + req.query.rows;
		
		connection.query(vacanciesQuery, function (err, data) {
			if (err) throw err;
			else {
				entity.data = data;
				entity.status = 200;
				entity.total = data[0].total || 0;
				entity.range = computeRange(req.query.rows, req.query.page, entity.total);
				res.json(entity);
			}
		});
		
	}
	else {
		let complexQuery = "SELECT (SELECT COUNT(*) FROM vacancies  ? ) as total,  FIRST_NAME as name, LAST_NAME as lastName" +
			", JOB_TITLE as position" +
			" FROM vacancies ? LIMIT " + req.query.begin + "," + req.query.rows;
		
		let criteria = addFilter(req.query.filter);
		
		complexQuery = complexQuery.replace("\?", criteria).replace("\?", criteria);
		
		connection.query(complexQuery, function (err, data) {
			if (err) throw err;
			else {
				if (data.length === 0) {
					entity.data = [];
					entity.status = 200;
					entity.total = 0;
					entity.range = computeRange(req.query.rows, req.query.page, entity.total);
					res.json(entity);
				} else {
					entity.data = data;
					entity.status = 200;
					entity.total = data[0].total || 0;
					entity.range = computeRange(req.query.rows, req.query.page, entity.total);
					res.json(entity);
				}
			}
		});
	}
	
});

server.get("/candidates", function (req, res) {
	let entity = {
		data: [],
		status: 0,
		total: 0,
		range: ""
	};
	
	function addFilter(filter) {
		filter = filter.split("&");
		
		let state = filter[0].substring(filter[0].indexOf("="), filter[0].length).replace("=", "");
		let name = filter[1].substring(filter[1].indexOf("="), filter[1].length).replace("=", "");
	
		let query = 'WHERE ';
		
		if (state !== "Empty") {
			query += 'STATUS = ';
			query += '\'' + state + '\'';
			query += ' AND ';
		}
		if (name !== "none") {
			query += 'NAME LIKE ';
			query += '\'%' + name + '%\'';
			query += ' AND ';
		}
		
		query = query.substring(0, (query.length - 4));
		
		return query;
	}
	
	if(req.query.filter === 'state=Empty&name=none') {
		
		let candidatesQuery = "SELECT (SELECT COUNT(*) FROM candidates) as total, NAME as name," +
			" LAST_NAME as lastName, JOB_TITLE as position, PAYMENT as payment, STATUS as status," +
			" DATEDIFF(CURRENT_DATE(), DATE_PUBLISHING) as date," +
			" IMAGE_URL as image" +
			" FROM candidates LIMIT " + req.query.begin + "," + req.query.rows;
		
		connection.query(candidatesQuery, function (err, data) {
			if (err) throw err;
			else {
				entity.data = data;
				entity.status = 200;
				entity.total = data[0].total || 0;
				entity.range = computeRange(req.query.rows, req.query.page, entity.total);
				res.json(entity);
			}
		});
		
	}
	else {
		let complexQuery = "SELECT (SELECT COUNT(*) FROM candidates  ? ) as total," +
			" NAME as name, LAST_NAME as lastName," +
			" JOB_TITLE as position," +
			" PAYMENT as payment, STATUS as status,	" +
			" DATEDIFF(CURRENT_DATE(), DATE_PUBLISHING) as date,"	+
			" IMAGE_URL as image" +
			" FROM candidates ? LIMIT " + req.query.begin + "," + req.query.rows;
		
		let criteria = addFilter(req.query.filter);
		
		complexQuery = complexQuery.replace("\?", criteria).replace("\?", criteria);
		
		connection.query(complexQuery, function (err, data) {
			if (err) throw err;
			else {
				if (data.length === 0) {
					entity.data = [];
					entity.status = 200;
					entity.total = 0;
					entity.range = computeRange(req.query.rows, req.query.page, entity.total);
					res.json(entity);
				} else {
					entity.data = data;
					entity.status = 200;
					entity.total = data[0].total || 0;
					entity.range = computeRange(req.query.rows, req.query.page, entity.total);
					res.json(entity);
				}
			}
		});
	}
	
});


server.listen(3001, function () {
	console.log('%s listening at %s', server.name, server.url);
});


