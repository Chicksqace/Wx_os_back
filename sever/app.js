var express = require('express');
var cors = require('cors');
var bodyParser = require('body-parser');
var mysql = require('mysql');
const fs = require('fs');
const path = require('path');
const multer = require('multer');
var app = express();


app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
	extended:true
}));



//连接数据库
const db = mysql.createConnection({
	host:"localhost",
	user:"root",
	password:"admin123",
	database:"mydb"
});
db.connect(function(err){
	if(err)
		console.log("数据库连接失败！");
	else
		console.log("数据库连接成功！");
});

//用户登录
app.post('/login',function(req,res){
	
	var admin_user = req.body.admin_user;
	var admin_password = req.body.admin_password;
	var sql = "select * from administrator where admin_user ='" + admin_user +"' and admin_password='"+ admin_password +"'";
	
	db.query(sql,function(err,results){
		if(err)
		{
			res.send("0");
		}
		else
		{
			console.log(results)
			if(results.length>0)
				res.send("1");
			else
				res.send("0");	
		}
	});
});
//查找用户信息
app.get('/users',function(req,res){
	var sql = "select * from user_message";
	db.query(sql,function(err,results){
		if(err){
			res.send("0");
		}
		else {
			res.send(results);
		}
	});
});
//删除用户
app.post('/delete_p',function(req,res){
	var user_id = req.body.user_id;
	var sql="delete from user_message where user_id='"+user_id+"'";
	db.query(sql,function(err){
		if(err)
			res.send("0");
		else
			res.send("1");
	});
});
//修改用户
app.post('/update_p', function(req, res){
  var user_id = req.body.user_id;
  var user_phone = req.body.user_phone;
  var sql = "UPDATE user_message SET user_phone='" + user_phone + "' WHERE user_id='" + user_id + "'";
  db.query(sql, function(err){
    if (err)
      res.send("0");
    else
      res.send("1");
  });
});
// 微信小程序插入
app.post('/wxPay', function(req, res) {
  var user = req.body.user;
  var pay = req.body.pay;
  var sql = "INSERT INTO wxpay (user, pay) VALUES ('" + user + "', '" + pay + "')";
  // 将数据插入到数据库中
  db.query(sql, function(err) {
    if (err) {
      console.error(err);
      res.send({ code: 1, msg: '插入失败' });
    } else {
      res.send({ code: 0, msg: '插入成功' });
    }
  });
});

//查询评论
app.get('/pinglun',function(req,res){
	var sql = "select * from pinglun";
	db.query(sql,function(err,results){
		if(err){
			res.send("0");
		}
		else {
			res.send(results);
		}
	});
});
//删除用户评论
app.post('/delete_user',function(req,res){
	var phone = req.body.phone;
	// console.log(req.body)
	var sql="delete from pinglun where phone='"+phone+"'";
	console.log(sql)
	db.query(sql,function(err){
		if(err)
			res.send("0");
		else
			res.send("1");
	});
});
//修改用户评分
app.post('/updateScore', function(req, res){
  var id = req.body.id;
  var score = req.body.score;
  var sql = "UPDATE pinglun SET score='" + score + "' WHERE id='" + id + "'";
  db.query(sql, function(err){
    if (err)
      res.send("0");
    else
      res.send("1");
  });
});
//查询商品
app.get('/list',function(req,res){
	var sql = "select * from list";
	db.query(sql,function(err,results){
		if(err){
			res.send("0");
		}
		else {
			res.send(results);
		}
	});
});
// 给微信的数据
app.get('/wxHome',function(req,res){
	var sql = "select * from wx_home";
	db.query(sql,function(err,results){
		if(err){
			res.send("0");
		}
		else {
			res.send(results);
		}
	});
});
//删除商品
app.post('/delete_list',function(req,res){
	var id = req.body.id;
	// console.log(req.body)
	var sql="delete from list where id='"+id+"'";
	console.log(sql)
	db.query(sql,function(err){
		if(err)
			res.send("0");
		else
			res.send("1");
	});
});
//修改商品数据
app.post('/update_relist', function(req, res){
  const { id, title, description, price, image } = req.body;

    // 更新商品信息
    // const updateSql = "UPDATE list SET title ='" + title + "', description ='" + description + "', price = '" + price+ "', image ='" + image+ "'WHERE id ='" + id + "'";
   // image=image.slice(0,image.indexOf('?'))
   console.log(image);
   const updateSql = `UPDATE list SET title ='${title}',description ='${description}' , price ='${price}', image ='${image}'WHERE id ='${id}'`
   console.log(updateSql)
	db.query(updateSql, [title, description, price, image, id], function(err, result) {
      if (err) {
        console.error('Failed to update product:', err);
        res.status(500).send('Failed to update the product');
        return;
      }

      console.log(`Updated ${result.affectedRows} product(s)`);
      res.send('1'); // 返回成功响应
    });
});
//orders
app.get('/orders',function(req,res){
	var sql = "select * from orders";
	db.query(sql,function(err,results){
		if(err){
			res.send("0");
		}
		else {
			res.send(results);
		}
	});
});
//order删除
app.post('/delete_orders',function(req,res){
	var id = req.body.id;
	// console.log(req.body)
	var sql="delete from orders where id='"+id+"'";
	db.query(sql,function(err){
		if(err)
			res.send("0");
		else
			res.send("1");
	});
});
//添加商品
app.post('/add_list',function(req,res){
	let list=req.body
	const updateSql = `INSERT INTO list (id, image, title, description, price,category,created_at) VALUES ('${list.id}', '${list.image}', '${list.title}', '${list.description}', '${list.price}','${list.category}','${list.created_at}');`
	db.query(sql,function(err){
		if(err){
			res.send("0")
			console.log('插入失败');
		}else{
			res.send("1")
			console.log('插入成功');
		}
			
	})
});
app.listen(8088,function(){
	console.log("服务器启动成功")
});