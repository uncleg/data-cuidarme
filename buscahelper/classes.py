# -*- coding: utf-8 -*-


'''
A Car always has four wheels, regardless of the make or model. Instance methods can access these attributes in the same way they 
access regular attributes: through self (i.e. self.wheels).

There is a class of methods, though, called static methods, that don't have access to self. Just like class attributes, they 
are methods that work without requiring an instance to be present. Since instances are always referenced through self, 
static methods have no self parameter.

No matter what kind of car we have, it always makes the same sound (or so I tell my ten month old daughter). To make it clear 
that this method should not receive the instance as the first parameter (i.e. self on "normal" methods), the 
@staticmethod decorator is used, 

Ver     @abstractmethod


RECORDAR: 

 concepto de encapsulamiento.  In Python, there is no keywords like ‘public’, ‘protected’
and ‘private’ to define the accessibility.

But there is a method in Python to define Private:
Add “__” in front of the variable and function name
can hide them when accessing them from out of
class.

self.a es publica
self.__b es privada

Note that the __init__ method never returns a value. Este es el metodo "constructor"

'''

class Experiencia(object):
	"Experiencias de Helpers y Families"
	def __init__(self,nickname_helper, nickname_familia, fecha_experiencia, experiencia):
			self.nickname_helper = nickname_helper
			self.nickname_familia = nickname_familia
			self.fecha_experiencia = fecha_experiencia
			self.experiencia = experiencia
	pass

	
class Usuario(object):
	"Informacion de los Usuarios Helpers y Families"
	def __init__(self, nickname="", nombre="", apellido="", documento="", tipo_documento="", fecha_alta="", telefono_movil="", telefono_fijo="", domicilio="", zipcode="", pais="", ciudad="", localidad=""): # Esto es lo + parecido a un metodo constructor. Aunque el objeto ya existe antes d llamar a init
		self.nickname = nickname
		self.nombre = nombre
		self.apellido = apellido
		self.documento = documento
		self.tipo_documento = tipo_documento
		self.fecha_alta = fecha_alta
		self.telefono_movil = telefono_movil
		self.telefono_fijo = telefono_fijo
		self.domicilio = domicilio				
		self.zipcode = zipcode
		self.pais = pais
		self.ciudad = ciudad 
		self.localidad = localidad

	def __del__(self):
		print "objeto destruido"


class Helper(Usuario):
	"Particularidades de los Helpers"
	def servicios(self):
		pass
	def estudios(self):
		pass
	def estudios(self):
		pass
	def set_reputacion(self):
		pass
	def get_reputacion(self):
		pass

class Familia(Usuario):
	"Particularidades de las Families"
	def necesidades(self):
		pass
	def horarios(self):
		pass	
	def set_status_pago(self, status_pago=False, fecha_pago="",plan_pago=""):
		self.status_pago = status_pago
		self.fecha_pago= fecha_pago
		self.plan_pago= plan_pago

	def set_ser_contactado():
		pass

jorge = Usuario("jorge")
print jorge.nickname
jorge.nickname = "uncleg"
print jorge.nickname

lucrecia = Helper("lucrecia")
print lucrecia.nickname
gonzalez = Familia("gonzalez_nickname","Adrian","Gonzalez","23323232")
print gonzalez.nickname
print gonzalez.nombre
print gonzalez.apellido
print gonzalez.documento
gonzalez.status_pago = False
print gonzalez.status_pago
print gonzalez.nickname
del gonzalez




#
