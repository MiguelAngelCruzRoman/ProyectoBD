from django.shortcuts import render
from django.shortcuts import HttpResponse
from .models import *
from django.db import transaction


# Create your views here.
def home (request):
    return HttpResponse("<h1>Hola Mundo!</h1>") 

def ViewConsultas(request):
    consultasListados = Consultas.objects.all()
    return render(request,"gestionarConsultas.html",{"gconsultas": consultasListados})


def CambiarConsultas(request):
    with transaction.atomic():
        con = Consultas.objects.filter(lugar='Hospital A')
        for c in con:
            c.lugar = 'Nuevoooooooo'
            c.save()

    consultasListados = Consultas.objects.all()#[:10]
    return render(request,"gestionarConsultas.html",{"gconsultas": consultasListados})


def RegresarConsultas(request):
    with transaction.atomic():
        con = Consultas.objects.filter(lugar='Nuevoooooooo')
        for c in con:
            c.lugar = 'Hospital A'
            c.save()

    consultasListados = Consultas.objects.all()#[:10]
    return render(request,"gestionarConsultas.html",{"gconsultas": consultasListados})


def ViewDireccion(request):
    direccionesListados = Direccion.objects.all()
    return render(request,"gestionarDireccion.html",{"gdirecciones": direccionesListados})

def CambiarCPDireccion(request):
    with transaction.atomic():
        d8 = Direccion.objects.get(cp='97203')
        d8.cp = 8
        d8.calle ='Calle 8'
        d8.estado ='Estado 8'
        d8.municipio ='Municipio 8'
        d8.colonia ='Colonia 8'
        d8.save()

        d1 = Direccion.objects.first()
        d1.cp = 1
        d1.calle = 'Calle 1'
        d1.estado ='Estado 1'
        d1.municipio ='Municipio 1'
        d1.colonia ='Colonia 1'
        d1.save()

        d2 = Direccion.objects.get(id=2)
        d2.cp = 2
        d2.calle = 'Calle 2'
        d2.estado ='Estado 2'
        d2.municipio ='Municipio 2'
        d2.colonia ='Colonia 2'
        d2.save()

    direccionesListados = Direccion.objects.all()
    return render(request,"gestionarDireccion.html",{"gdirecciones": direccionesListados})    

def RegresarCPDireccion(request):
    with transaction.atomic():
        d8 = Direccion.objects.get(cp='8')
        d8.cp=97203
        d8.calle='Calle 20'
        d8.estado ='Mérida'
        d8.municipio ='Yucatán'
        d8.colonia ='Montecristo'
        d8.save()

        d1 = Direccion.objects.first()
        d1.cp = 11560
        d1.calle = 'Avenida Reforma'
        d1.estado ='Ciudad de México'
        d1.municipio ='Ciudad de México'
        d1.colonia ='Polanco'
        d1.save()

        d2 = Direccion.objects.get(cp='2')
        d2.cp = 45050
        d2.calle = 'Calle 5 de Mayo'
        d2.estado ='Jalisco'
        d2.municipio ='Guadalajara'
        d2.colonia ='Zapopan'
        d2.save()
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
