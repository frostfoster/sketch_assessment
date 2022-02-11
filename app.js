const express= require('express');
const bodyParser= require('body-parser');
const uuid= require('uuid');
const mysql= require('mysql');
const path = require('path');
require('dotenv').config();
const util = require('util')
const app= express();
const port = process.env.PORT || 5000;
//body parser is a parsing middleware
//parsing middleware
//parse application/www.
app.use(bodyParser.urlencoded({extended:false}))

// Install cookieparser, express-session: To Create Session
var cookieParser= require('cookie-parser')
var session= require('express-session')
app.use(cookieParser());
app.use(session({secret: "Shh, its a secret!",saveUninitialized:true, resave: false}));
 
 
// Parse application.json
app.use(bodyParser.json());
 
// DATABASE CONNECTION YARN
const db = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'sketch2'
});
db.connect((err)=>{
    if (err) {
   console.log(err)
    }else{
        console.log("Connected to db")
    }
   
})
 
//access files static
app.use(express.static(path.join(__dirname, '/public')));
//Templating Engine
// app.engine('hbs', exphbs( {extname: '.hbs'}));
app.set('view engine','ejs');
app.get("/itemsforsale",(req,res)=>{

  
        const sql=`SELECT * FROM sketch2.items;`
            db.query(sql, (err, results) => {
                if (results.length!=0){

                res.render("itemsforsale",{data:results,error:null})
            }else{
                res.render("itemsforsale",{data:null,error:null})
            }
            })

        
   
})
app.get("/main",(req,res)=>{

 
    res.render("landing")
})

app.get("/technology",(req,res)=>{

 
    res.render("technology")
})

app.get("/about",(req,res)=>{

 
    res.render("about")
})

app.all("/editprofile/:id",(req,res)=>{
    if (req.method=="POST"){

    
    var params=req.body;
    var session= req.session
    if(req.session.userid!=null){
    const sql=`UPDATE users SET username='${params.username}', password='${params.password}',fname='${params.fname}',lname='${params.lname}',contactno='${params.contactno}',email='${params.email}' WHERE id= '${session.userid.id}';`
        db.query(sql, (err, rows) => {
            console.log(sql)
            res.redirect("/logout")
        })
    }else{
        res.redirect("/")
    }
}else{
    var params=req.params;
    var session= req.session
    if(req.session.userid!=null){
        const sql=`SELECT * FROM users WHERE id = '${session.userid.id}';`
            db.query(sql, (err, rows) => {
                console.log("MMEEEE"+sql)
                res.render("editprofile",{user_data:session,data:rows,error:null})
            })

        }else{
            res.redirect("/")
        }
   
}
 
})
app.all("/signup",(req,res) =>{
    if (req.method=="POST"){
        var params=req.body;
        params.role="guest";
        console.log(params)
        const sql="INSERT INTO users SET ?";
        db.query(sql,params,(err,result)=>{
            if (err) throw err
 
        db.query("SELECT LAST_INSERT_ID() as id",(err1,result1)=>{
            if (err1) throw err1
            var session= req.session
            console.log(session)
            session.username = {name:params.username}
            session.fname={name:params.fname}
            session.lname={name:params.lname}
            session.userid = {id:result1[0].id}
            session.role = {role:params.role}
            console.log(params.username)
            res.locals.user=params.username
            res.redirect("/user_homepage");
 
        })
           
        })
 
    }else{
        res.render('signup',{error:false})
    }
})
app.all("/signin",(req,res)=>{
    //check post
    if(req.method=="POST"){
        const params=req.body
        const sql= `SELECT id,username,fname,lname,contactno,email,role FROM users WHERE username="${params.username}" and password= "${params.password}"`
        db.query(sql,(err,results)=>{
            if (err) throw err;
            console.log(results)
            if (results.length==0){
                res.render("signin",{error:true})
 
            }else{
                var session=req.session
                session.userid={id:results[0].id}
                session.role={role:results[0].role}
                session.username={name:results[0].username}
                session.fname={name:results[0].fname}
                session.lname={name:results[0].lname}
                session.contactno={contactno:results[0].contactno}
                session.email={email:results[0].email}
                console.log("Signed In"+session)
                if (session.role.role=="admin"){
                        res.redirect("/user_homepage")
                }else{
                    res.redirect("/user_homepage")
                }
            }
        })
    }else{
        res.render("signin",{error:false})
    }
 
   
})
app.get("/logout",(req,res)=>{
    req.session.destroy();
    res.redirect('/');
 
})







//--------------------------------------------------------------------------------
app.all("/edititem/:id",(req,res)=>{
    if (req.method=="POST"){

    
    var params=req.body;
    var id_param=req.params;
    var session= req.session
    if(req.session.userid!=null){
    const sql=`UPDATE sketch2.items SET item_name='${params.item_name}', item_category='${params.item_category}',item_quantity='${params.item_quantity}',item_price='${params.item_price}' WHERE id= '${id_param.id}';`
        db.query(sql, (err, rows) => {
            console.log(sql)
            res.redirect("/user_homepage")
        })
    }else{
        res.redirect("/")
    }
}else{
    var params=req.params;
    var session= req.session
    if(req.session.userid!=null){
        const sql=`SELECT * FROM sketch2.items WHERE id = '${params.id}';`
            db.query(sql, (err, results) => {
                if (results.length!=0){

              
                console.log("ahahhaha"+util.inspect(results, {showHidden: false, depth: null, colors: true}))
                res.render("edititem",{user_data:session,data:results,error:null})
            }else{
                res.render("edititem",{user_data:session,data:null,error:null})
            }
            })

        }else{
            res.redirect("/")
        }
   
}} )

app.get("/deleteitem/:id",(req,res)=>{
    if(req.session.userid!=null){
    id_params=req.params.id;

    const sql=`DELETE FROM sketch2.items WHERE id='${id_params}'`;
        db.query(sql,(err1,results1)=>{
            console.log(sql)
            if (err1) throw err1;
           res.redirect("/user_homepage")
          
        })
    }else{
        res.redirect("/user_homepage");
    }
   
});
 
app.all("/createitem",(req,res)=>{
    if (req.method=="POST"){
        var params=req.body;
      
        var session=req.session;

        
        var food_idquantity=[];
        const unique_id=uuid.v4()
        params.item_code=unique_id
           
        const sql="INSERT INTO sketch2.items SET ?";
        
        db.query(sql,params,(err1,results1)=>{
            if (err1) throw err1;
           
          
        })
                
            
        
        
    
    res.redirect("/user_homepage")
        

    }else{

    
   
    
    res.render("createitem",{error:null})

}
})
app.all("/user_homepage",(req,res)=>{
        var session=req.session
        const sqlyarn=`SELECT * FROM sketch2.items `;

        // const sql1= `SELECT * FROM sketch.order WHERE user_id=${req.session.userid.id}`
        console.log(sqlyarn)
        
        console.log("Hahaha"+session.userid.id)
        db.query(sqlyarn,(err1,results5)=>{
            if (err1) throw err1;
            console.log(results5)
            if (results5.length==0){
                
                res.render("user_homepage",{operation:null,data:null,user_data:session,error:null});
            }else{
                res.render("user_homepage",{operation:null,data:results5,user_data:session,error:null});
            }})
        
          
            

        
    

})
app.get("/",(req,res)=>{
    //deletable
    // var session=req.session
    // session.userid={id:44}
    // session.role={role:"guest"}
    // session.username={name:"mer"}
    // session.fname={fname:"merham"}
    // session.lname={lname:"umbukan"}
    // session.fname={lname:"umbukan"}
    // //end
    // console.log(req.session)
 
    if (req.session.userid!=null){
        res.redirect("/user_homepage")
    }else{
        res.redirect("/main")
       
    }
//res.locals only works when it is rendered
})
// Linker for the routes, basically what it
// does is that it readies file for use, and When
// /users is Ran, it wil redirect to the userRouter file
// which is the file required at the top. Basically
//just js extends file
 
app.listen(process.env.PORT || port, () => console.log(`Example app listening at http://localhost:${port}`));