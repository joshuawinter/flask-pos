# pos/models/products.py
from pos.models import db
from datetime import datetime

class Products(db.Model):

    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(45), nullable=False)
    price = db.Column(db.Integer, nullable=False)
    stock = db.Column(db.Integer, nullable=False)
    event_time = db.Column(db.DateTime, nullable=False)

    def __init__(self):
        self.event_time = datetime.now()



