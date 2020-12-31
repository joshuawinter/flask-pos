from pos.models import db
from sqlalchemy.orm import relationship
from sqlalchemy import event
from pos.models.products import Products
from datetime import datetime

class TransactionProducts(db.Model):
	id = db.Column(db.Integer, primary_key=True, autoincrement=True)
	transaction_id = db.Column(db.Integer, db.ForeignKey("transactions.customer_transaction_id"), nullable=False)
	product_id = db.Column(db.Integer, db.ForeignKey("products.id"), nullable=False)
	product_qty = db.Column(db.Integer, nullable=False)
	transaction = relationship("Transactions", backref="transaction_products")
	#transaction = relationship("Transactions")
	#product = relationship("Products", backref="transaction_products")
	product = relationship("Products")
	event_time = db.Column(db.DateTime, nullable=False)


	def __init__(self):
		self.event_time = datetime.now()



@event.listens_for(db.session,"before_flush")
def reduce_stock_product(*args):
	sess = args[0]
	for obj in sess.new:
		if not isinstance(obj, TransactionProducts):
			continue
		product = Products.query.filter_by(id=obj.product_id).first()

		product.stock = product.stock - obj.product_qty
		db.session.add(product)

