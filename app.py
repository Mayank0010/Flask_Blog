from flask import Flask, render_template, request, url_for, flash, redirect, session
from flask_sqlalchemy import SQLAlchemy
import json
import os
import math
from werkzeug.utils import secure_filename
from datetime import datetime
from flask_mail import Mail


with open('config.json', 'r') as c:
    params = json.load(c)["params"]

import pymysql
pymysql.install_as_MySQLdb()

app = Flask(__name__)
app.config['UPLOAD_LOC'] = params['upload_location']
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params['gmail-user'],
    MAIL_PASSWORD = params['gmail-password']
)
mail = Mail(app)

local_server = True
if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SECRET_KEY'] = 'Mayank00100'

db = SQLAlchemy(app)

class Contact(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False)
    email = db.Column(db.String(50), nullable=False)
    phone = db.Column(db.Integer, nullable=False)
    message = db.Column(db.Text, nullable=False)
    date = db.Column(db.DateTime, nullable=False)

class Blogpost(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(50), nullable=False)
    slug = db.Column(db.String(50), nullable=False)
    subtitle = db.Column(db.String(50), nullable=False)
    content = db.Column(db.Text, nullable=False)
    date = db.Column(db.DateTime, nullable=False)
    img = db.Column(db.Text, nullable=False)

@app.route("/")
def home():
    posts = Blogpost.query.filter_by().all()
    last = math.ceil(len(posts)/int(params['no_of_posts']))
    page = request.args.get('page')
    if(not str(page).isnumeric()):
        page = 1
    page = int(page)
    posts = posts[(page-1)*int(params['no_of_posts']) : (page-1)*int(params['no_of_posts']) + int(params['no_of_posts'])]
    if page==1:
        prev = '#'
        next = '/?page=' + str(page+1)
    elif(page==last):
        prev = '/?page=' + str(page-1)
        next = '#'
    else:
        prev = '/?page=' + str(page-1)
        next = '/?page=' + str(page+1)
    return render_template('index.html', title="Tech Ninja", params=params, posts=posts, prev=prev, next=next)


@app.route("/home")
def index():
    posts = Blogpost.query.filter_by().all()[0:params['no_of_posts']]
    return render_template('index.html', title="Tech Ninja", params=params, posts=posts)


@app.route("/about")
def about():
    return render_template('about.html', title="About Me", params=params)


@app.route("/login", methods=['GET','POST'])
def login():
    if 'user' in session and session['user']==params['admin_user']:
        posts = Blogpost.query.all()
        return render_template('dashboard.html', params=params, posts=posts)

    if(request.method=='POST'):
        username = request.form.get('uname')
        userpass = request.form.get('upass')
        if username==params['admin_user'] and userpass==params['admin_password']:
            session['user'] = username
            posts = Blogpost.query.all()
            return render_template('dashboard.html', params=params, posts=posts)
    else:
        return render_template('login.html', title="SignIn", params=params)


@app.route("/logout")
def logout():
    session.pop('user')
    return redirect(url_for('login'))



@app.route("/upload", methods=['GET','POST'])
def upload():
    if('user' in session and session['user']==params['admin_user']):
        if request.method=='POST':
            file = request.files['upload']
            file.save(os.path.join(app.config['UPLOAD_LOC'], secure_filename(file.filename)))
            return "Uploaded Successfully!!"


@app.route("/contact", methods=['GET','POST'])
def contact():
    if(request.method=='POST'):
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        details = Contact(name=name, email=email, phone=phone, message=message, date=datetime.now())
        db.session.add(details)
        db.session.commit()
        mail.send_message('New message from ' + name, 
        sender= email,
        recipients= [params['gmail-user']], 
        body= 'Name: ' + name + '\n' + 'Email: ' + email + '\n' + 'Mobile Number: ' + phone +'\n' + 'Message: ' + message 
        )
        flash(f'Email sent successfully....We will get back to you soon!!', 'success')
        return redirect(url_for('contact'))
    return render_template('contact.html', title="Contact Us", params=params)


@app.route("/post/<string:post_slug>", methods=['GET'])
def post_route(post_slug):
    post = Blogpost.query.filter_by(slug=post_slug).first()
    return render_template('post.html', title="Posts", post=post, params=params)


@app.route("/edit/<string:sno>", methods=['GET','POST'])
def edit(sno):
    if('user' in session and session['user']==params['admin_user']):
        if request.method=='POST':
            title = request.form.get('title')
            subtitle = request.form.get('subtitle')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img = request.form.get('img')
            date = datetime.now()
            
            if sno=='0':
                post = Blogpost(title=title, subtitle=subtitle, slug=slug, content=content, img=img, date=date)
                db.session.add(post)
                db.session.commit()
            else:
                post = Blogpost.query.filter_by(sno=sno).first()
                post.title = title
                post.subtitle = subtitle
                post.slug = slug
                post.content = content
                post.img = img
                post.date = date
                db.session.commit()
            return redirect(url_for('login'))
        post = Blogpost.query.filter_by(sno=sno).first()
        return render_template('edit.html', title='Add/Edit Post', params=params, post=post, sno=sno)


@app.route("/delete/<string:sno>", methods=['GET','POST'])
def delete(sno):
    if('user' in session and session['user']==params['admin_user']):
        post = Blogpost.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
        return redirect(url_for('login'))