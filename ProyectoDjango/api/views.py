from django.shortcuts import render
from django.shortcuts import HttpResponse
from .models import *

# Create your views here.
def home (request):
    return HttpResponse("<h1>Hola Mundo!</h1>") 

def ViewMedicos(request):
    medicosListados = Medico.objects.all()
    return render(request,"gestionarMedicos.html",{"gmedicos": medicosListados})

