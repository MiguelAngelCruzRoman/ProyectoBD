from django.contrib import admin
from .models import *

# Register your models here.
admin.site.register(Consultas)
admin.site.register(Direccion)
admin.site.register(Medicamentos)
admin.site.register(Medico)
admin.site.register(MedicoPaciente)
admin.site.register(Paciente)
admin.site.register(Receta)
admin.site.register(RecetaMedicamento)
admin.site.register(Userinfo)
admin.site.register(Users)