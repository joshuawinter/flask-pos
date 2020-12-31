from pos.models import db
from datetime import datetime

class Transactions(db.Model):

    customer_transaction_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    event_time = db.Column(db.DateTime, nullable=False)

    def __init__(self):
        self.event_time = datetime.now()
