from django.shortcuts import render
from django.shortcuts import HttpResponse
from .models import *
from django.db import connections


# Create your views here.
def home (request):
    return HttpResponse("<h1>Hola Mundo!</h1>") 

def ViewConsultas(request):
    consultasListados = Consultas.objects.all()
    return render(request,"gestionarConsultas.html",{"gconsultas": consultasListados})

def ViewDireccion(request):
    direccionesListados = Direccion.objects.all()
    return render(request,"gestionarDireccion.html",{"gdirecciones": direccionesListados})

def ViewMedicamentos(request):
    medicamentosListados = Medicamentos.objects.all()
    return render(request,"gestionarMedicamentos.html",{"gmedicamentos": medicamentosListados})

def ViewMedicos(request):
    medicosListados = Medico.objects.all()
    return render(request,"gestionarMedicos.html",{"gmedicos": medicosListados})

def ViewPaciente(request):
    pacienteListados = Paciente.objects.all()
    return render(request,"gestionarPacientes.html",{"gpacientes": pacienteListados})

def ViewReceta(request):
    recetasListados = Receta.objects.all()
    return render(request,"gestionarRecetas.html",{"grecetas": recetasListados})

def ViewUserinfo(request):
    userInfoListados = Userinfo.objects.all()
    return render(request,"gestionaruserInfo.html",{"guserInfo": userInfoListados})

def ViewUsers(request):
    usersListados = Users.objects.all()
    return render(request,"gestionarUsers.html",{"gusers": usersListados})
