"""
URL configuration for ProyectoDjango project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from api.views import *

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', home),
    path('view/consultas', ViewConsultas),
    path('view/direcciones', ViewDireccion),
    path('view/medicamentos', ViewMedicamentos),
    path('view/medicos', ViewMedicos),
    path('view/pacientes', ViewPaciente),
    path('view/recetas', ViewReceta),
    path('view/usersinfo', ViewUserinfo),
    path('view/users', ViewUsers),


    path('transaccion/CambiarCPDireccion', CambiarCPDireccion),
    path('transaccion/RegresarCPDireccion', RegresarCPDireccion),
    path('transaccion/CambiarConsultas', CambiarConsultas),
    path('transaccion/RegresarConsultas', RegresarConsultas),
    path('transaccion/CambiarMedicamentos', CambiarMedicamentos),
    path('transaccion/CorregirTurnos', CorregirTurnos),
    path('transaccion/RegresarTurnos', RegresarTurnos),
    path('transaccion/AtenderPacientes', AtenderPacientes),
    path('transaccion/RevertirPacientes', RevertirPacientes),
    path('transaccion/RecetasExpiradas', RecetasExpiradas),
    path('transaccion/RevertirExpiradas', RevertirExpiradas),
    path('transaccion/CambiarGenero', CambiarGenero),
    path('transaccion/RevertirGenero', RevertirGenero),
    path('transaccion/GenerarContraseña', GenerarContraseña),
    path('transaccion/RevertirContraseña', RevertirContraseña),



    path('dumps/dump_json', dump_json),
    path('dumps/dump_xml', dump_xml),
    path('dumps/', dump_opciones),

    
    path('viewMySQL/MedicamentosConsultaClinica', ViewMedicamentosConsultaClinica),
    path('viewMySQL/MedicosPuebla', ViewMedicosPuebla),
    path('viewMySQL/PacientesMedicosF',ViewPacientesMedicosF),
    path('viewMySQL/PacientesMedicosM',ViewPacientesMedicosM),
    path('viewMySQL/PacientesFumadores',ViewPacientesFumadores),
    path('viewMySQL/PacientesAlcoholicos',ViewPacientesAlcoholicos),
    path('viewMySQL/MedicosPacientesEspecialidad',ViewMedicosPacientesEspecialidad),

    #path('SA/', STUDENT_DATA),
]
