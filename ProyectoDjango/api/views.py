from django.shortcuts import render
from django.shortcuts import HttpResponse
from .models import *
from django.db import transaction
from django.core.management import call_command
import datetime
from django.db import connection
import os
import mysql.connector
from datetime import date
from random import sample


conexion = mysql.connector.connect(
    host = "localhost",
    user = "root",
    database = "consultorioBD",
    password = "",
    )



#----------------------------------------------------------------------------------------------------

#Sección para vistas generales

#----------------------------------------------------------------------------------------------------
def home (request):
    return HttpResponse("<h1>Hola Mundo!</h1>") 


def ViewConsultas(request):
    consultasListados = Consultas.objects.all()
    return render(request,"gestionarConsultas.html",{"gconsultas": consultasListados})



def ViewDireccion(request):
    direccionesListados = Direccion.objects.all()
    return render(request,"gestionarDireccion.html",{"gdirecciones": direccionesListados})




def ViewMedicamentos(request):
    cursor = conexion.cursor()
    cursor.execute("select * from medicamentos_consultas_clinica")
    valores = cursor.fetchall()

    arreglo = []
    for v in valores:
        arreglo.append(v[0])
        arreglo.append(v[1])
        arreglo.append(v[2])
        arreglo.append(v[3])

    medicamentosListados = Medicamentos.objects.all()
    return render(request,"gestionarMedicamentos.html",{"gmedicamentos": medicamentosListados,"arreglo":arreglo})

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
#----------------------------------------------------------------------------------------------------





#----------------------------------------------------------------------------------------------------

#Sección para backups/dumps

#----------------------------------------------------------------------------------------------------
def dump_opciones(request):
    ejemplo_dir = 'C:/Users/ardil/Downloads/ProyectoDjango/ProyectoDjango/backups'
    contenido = os.listdir(ejemplo_dir)

    archivosXML = []
    for fichero in contenido:
        if os.path.isfile(os.path.join(ejemplo_dir, fichero)) and fichero.endswith('.xml'):
            archivosXML.append(fichero)

    
    archivosJSON = []
    for fichero in contenido:
        if os.path.isfile(os.path.join(ejemplo_dir, fichero)) and fichero.endswith('.json'):
            archivosJSON.append(fichero)

    return render(request,"dumps.html",{"archivosXML": archivosXML, "archivosJSON": archivosJSON})


def dump_json(request):
    current_datetime = datetime.datetime.now()
    timestamp = current_datetime.strftime('%Y-%m-%d_%H-%M-%S')

    filename = f'backups/db_{timestamp}.json'

    call_command('dumpdata', output=filename, format='json',indent=2)

    with open(filename, 'rb') as file:
        response = HttpResponse(file.read(), content_type='application/json')
        response['Content-Disposition'] = f'attachment; filename="backups/db_{timestamp}.json"'
    return response


def dump_xml(request):
    current_datetime = datetime.datetime.now()
    timestamp = current_datetime.strftime('%Y-%m-%d_%H-%M-%S')

    filename = f'backups/db_{timestamp}.xml'

    call_command('dumpdata', output=filename, format='xml',indent=2)

    with open(filename, 'rb') as file:
        response = HttpResponse(file.read(), content_type='application/XML')
        response['Content-Disposition'] = f'attachment; filename="backups/db_{timestamp}.xml"'
    return response

#----------------------------------------------------------------------------------------------------





#----------------------------------------------------------------------------------------------------

#Consultas tablas relacionadas 

#----------------------------------------------------------------------------------------------------
def RecetaMedicamento(request):
    cursor = conexion.cursor()
    cursor.execute("select rm.receta,group_concat(' ',m.nombreComercial,' (',m.nombreCinetifico,' de ',m.dosis,' mg)' ),r.fechaVencimiento  from receta_medicamento as rm join medicamentos as m on rm.medicamento = m.id join receta as r on rm.receta = r.id group by rm.receta order by rm.receta")
    valores = cursor.fetchall()

    arreglo = []
    for v in valores:
        arreglo.append(v[0])
        arreglo.append(v[1])
        arreglo.append(v[2])
    

    return render(request,"recetaMedicamento.html",{"recetasMedicamento": arreglo})


def PacientesPorCadaMedico(request):
    cursor = conexion.cursor()
    cursor.execute("select mp.id, concat(uim.primerNombre,' ',uim.apellidoPaterno,' ',uim.apellidoMaterno),group_concat(' ',uip.primerNombre,' ', uip.apellidoPaterno,' ',uip.apellidoMaterno) from medico_paciente as mp left join medico as m on mp.medico = m.id left join paciente as p on mp.paciente = p.id join users as up on up.id = p.id join userinfo as uip  on uip.id = up.id join users as um on um.id = m.id join userinfo as uim  on uim.id = um.id group by mp.medico order by mp.id")
    valores = cursor.fetchall()

    arreglo = []
    for v in valores:
        arreglo.append(v[0])
        arreglo.append(v[1])
        arreglo.append(v[2])
    

    return render(request,"PacientesPorCadaMedico.html",{"PacientesPorCadaMedico": arreglo})


def MedicosPorCadaPaciente(request):
    cursor = conexion.cursor()
    cursor.execute("select mp.id, concat(uip.primerNombre,' ', uip.apellidoPaterno,' ',uip.apellidoMaterno),group_concat(' ',uim.primerNombre,' ',uim.apellidoPaterno,' ',uim.apellidoMaterno) from medico_paciente as mp left join medico as m on mp.medico = m.id left join paciente as p on mp.paciente = p.id join users as up on up.id = p.id join userinfo as uip  on uip.id = up.id join users as um on um.id = m.id join userinfo as uim  on uim.id = um.id group by mp.paciente order by mp.id")
    valores = cursor.fetchall()

    arreglo = []
    for v in valores:
        arreglo.append(v[0])
        arreglo.append(v[1])
        arreglo.append(v[2])

    return render(request,"MedicosPorCadaPaciente.html",{"MedicosPorCadaPaciente": arreglo})



def UsuarioDireccionInfoUsuario(request):
    cursor = conexion.cursor()
    cursor.execute("select u.id,u.username, concat(ui.primerNombre, ' ', ui.apellidoPaterno, ' ', ui.apellidoMaterno),concat(d.municipio,', ',d.estado) from users as u join userinfo as ui on u.id = ui.id join direccion as d on d.userinfo = ui.id")
    valores = cursor.fetchall()

    arreglo = []
    for v in valores:
        arreglo.append(v[0])
        arreglo.append(v[1])
        arreglo.append(v[2])
        arreglo.append(v[3])

    return render(request,"UsuarioDireccionInfoUsuario.html",{"UsuarioDireccionInfoUsuario": arreglo})

#----------------------------------------------------------------------------------------------------



#----------------------------------------------------------------------------------------------------

#Vista para pruebas

#----------------------------------------------------------------------------------------------------

"""def STUDENT_DATA(request):
    cursor = conexion.cursor()
    cursor.execute("select * from medicamentos_consultas_clinica")
    valores = cursor.fetchall()

    arreglo = []
    for v in valores:
        arreglo.append(v[0])
        arreglo.append(v[1])
        arreglo.append(v[2])
        arreglo.append(v[3])
    

    return HttpResponse(arreglo.ar)""" 
#----------------------------------------------------------------------------------------------------






#----------------------------------------------------------------------------------------------------

#Transacciones 

#----------------------------------------------------------------------------------------------------
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

def CambiarMedicamentos(request):
    with transaction.atomic():
        con = Medicamentos.objects.filter(formafarmaceutica='Tableta')
        for c in con:
            if c.dosis <300:
                c.stock = c.stock + 200
                c.fechacaducidad = c.fechacaducidad + datetime.timedelta(days=2048)
                c.save()
            else:
                c.stock = c.stock + 100
                c.fechacaducidad = c.fechacaducidad + datetime.timedelta(days=1024)
                c.save()

    medicamentosListado = Medicamentos.objects.all()#[:10]
    return render(request,"gestionarMedicamentos.html",{"gmedicamentos": medicamentosListado})


def RegresarMedicamentos(request):
    with transaction.atomic():
        con = Medicamentos.objects.filter(formafarmaceutica='Tableta')
        for c in con:
            if c.dosis <300:
                c.stock = c.stock - 200
                c.fechacaducidad = c.fechacaducidad - datetime.timedelta(days=2048)
                c.save()
            else:
                c.stock = c.stock - 100
                c.fechacaducidad = c.fechacaducidad - datetime.timedelta(days=1024)
                c.save()

    medicamentosListado = Medicamentos.objects.all()#[:10]
    return render(request,"gestionarMedicamentos.html",{"gmedicamentos": medicamentosListado})


def CorregirTurnos(request):
    with transaction.atomic():
        con = Medico.objects.all()
        for c in con:
            if c.turno == "matutino":
                c.turno = "Matutino"
                c.save()
            
            if c.turno == "vespertino":
                c.turno = "Vespertino"
                c.save()

            if c.turno == "nocturno":
                c.turno = "Nocturno"
                c.save()

    medicosListado = Medico.objects.all()#[:10]
    return render(request,"gestionarMedicos.html",{"gmedicos": medicosListado})


def RegresarTurnos(request):
    with transaction.atomic():
        con = Medico.objects.all()
        for c in con:
            if c.turno == "Matutino":
                c.turno = "matutino"
                c.save()
            
            if c.turno == "Vespertino":
                c.turno = "vespertino"
                c.save()

            if c.turno == "Nocturno":
                c.turno = "nocturno"
                c.save()

    medicosListado = Medico.objects.all()#[:10]
    return render(request,"gestionarMedicos.html",{"gmedicos": medicosListado})

def AtenderPacientes(request):
    with transaction.atomic():
        con = Paciente.objects.all()
        for c in con:
            if (c.statusseguro == "Ninguno" and c.alergia !="ninguna" and c.tiposangre=="O"):
                c.fecharevision = c.fecharevision +datetime.timedelta(days=2048)
                c.motivorevision = "Campaña gratuita de salud"
                c.save()
            

    pacientesListado = Paciente.objects.all()#[:10]
    return render(request,"gestionarPacientes.html",{"gpacientes": pacientesListado})


def RevertirPacientes(request):
    with transaction.atomic():
        con = Paciente.objects.all()
        for c in con:
            if (c.statusseguro == "Ninguno" and c.alergia !="ninguna" and c.tiposangre=="O"):
                c.fecharevision =c.fecharevision- datetime.timedelta(days=2048)
                c.motivorevision = "Revisión"
                c.save()
            

    pacientesListado = Paciente.objects.all()#[:10]
    return render(request,"gestionarPacientes.html",{"gpacientes": pacientesListado})

def RecetasExpiradas(request):
    with transaction.atomic():
        con = Receta.objects.all()
        for c in con:
            if (c.fechavencimiento <= date.today()):
                c.status = 0
                c.save()         

    recetasListado = Receta.objects.all()#[:10]
    return render(request,"gestionarRecetas.html",{"grecetas": recetasListado})

def RevertirExpiradas(request):
    with transaction.atomic():
        con = Receta.objects.all()
        for c in con:
            if (c.status == 0):
                c.status = 1
                c.save()         

    recetasListado = Receta.objects.all()#[:10]
    return render(request,"gestionarRecetas.html",{"grecetas": recetasListado})

def RevertirExpiradas(request):
    with transaction.atomic():
        con = Receta.objects.all()
        for c in con:
            if (c.status == 0):
                c.status = 1
                c.save()         

    recetasListado = Receta.objects.all()#[:10]
    return render(request,"gestionarRecetas.html",{"grecetas": recetasListado})

def CambiarGenero(request):
    with transaction.atomic():
        con = Userinfo.objects.all()
        for c in con:
            if (c.genero == "M"):
                c.genero = "F"
                c.save()
            else:
                c.genero = "M"
                c.save()        

    usersInfoListado = Userinfo.objects.all()#[:10]
    return render(request,"gestionaruserInfo.html",{"guserInfo": usersInfoListado})


def RevertirGenero(request):
    with transaction.atomic():
        con = Userinfo.objects.all()
        for c in con:
            if (c.genero == "F"):
                c.genero = "M"
                c.save()
            else:
                c.genero = "F"
                c.save()        

    usersInfoListado = Userinfo.objects.all()#[:10]
    return render(request,"gestionaruserInfo.html",{"guserInfo": usersInfoListado})

def GenerarContraseña(request):
    with transaction.atomic():
        con = Users.objects.all()
        for c in con:
            abc_minusculas = "abcdefghijklmnopqrstuvwxyz"
            abc_mayusculas = abc_minusculas.upper() 
            numeros = "0123456789"
            simbolos = "[]()*;/,_-"
            secuencia = abc_minusculas + abc_mayusculas + numeros + simbolos
            password_union = sample(secuencia, 10)
            password_result = "".join(password_union)
            c.password = password_result
            c.save()        

    usersListado = Users.objects.all()#[:10]
    return render(request,"gestionarUsers.html",{"gusers": usersListado})

def RevertirContraseña(request):
    with transaction.atomic():
        con = Users.objects.all()
        for c in con:
            c.password = "password"+ str(c.id)
            c.save()        

    usersListado = Users.objects.all()#[:10]
    return render(request,"gestionarUsers.html",{"gusers": usersListado})
#----------------------------------------------------------------------------------------------------




#----------------------------------------------------------------------------------------------------

#Vistas seguras de MySQL

#----------------------------------------------------------------------------------------------------

def ViewMedicamentosConsultaClinica(request):
    cursor = conexion.cursor()
    cursor.execute("select * from medicamentos_consultas_clinica")
    valores = cursor.fetchall()

    arreglo = []
    for v in valores:
        arreglo.append(v[0])
        arreglo.append(v[1])
        arreglo.append(v[2])
        arreglo.append(v[3])

    return render(request,"MedicamentosConsultaClinica.html",{"arreglo":arreglo})

def ViewMedicosPuebla(request):
    cursor = conexion.cursor()
    cursor.execute("select * from medicos_Puebla")
    valores = cursor.fetchall()

    arreglo = []
    for v in valores:
        arreglo.append(v[0])
        arreglo.append(v[1])
        arreglo.append(v[2])

    return render(request,"MedicosPuebla.html",{"arreglo":arreglo})

def ViewPacientesMedicosF(request):
    cursor = conexion.cursor()
    cursor.execute("select * from Npacientes_MedicoF ")
    valores = cursor.fetchall()

    arreglo = []
    for v in valores:
        arreglo.append(v[0])
        arreglo.append(v[1])
        arreglo.append(v[2])
        arreglo.append(v[3])

    return render(request,"PacientesMedicosF.html",{"arreglo":arreglo})

def ViewPacientesMedicosM(request):
    cursor = conexion.cursor()
    cursor.execute("select * from Npacientes_MedicoM ")
    valores = cursor.fetchall()

    arreglo = []
    for v in valores:
        arreglo.append(v[0])
        arreglo.append(v[1])
        arreglo.append(v[2])
        arreglo.append(v[3])

    return render(request,"PacientesMedicosM.html",{"arreglo":arreglo})

def ViewPacientesFumadores(request):
    cursor = conexion.cursor()
    cursor.execute("select * from medicos_PacientesFumadores")
    valores = cursor.fetchall()

    arreglo = []
    for v in valores:
        arreglo.append(v[0])
        arreglo.append(v[1])
        arreglo.append(v[2])
        arreglo.append(v[3])

    return render(request,"PacientesFumadores.html",{"arreglo":arreglo})

def ViewPacientesAlcoholicos(request):
    cursor = conexion.cursor()
    cursor.execute("select * from medicos_PacientesAlcoholicos")
    valores = cursor.fetchall()

    arreglo = []
    for v in valores:
        arreglo.append(v[0])
        arreglo.append(v[1])
        arreglo.append(v[2])
        arreglo.append(v[3])

    return render(request,"PacientesAlcoholicos.html",{"arreglo":arreglo})

def ViewMedicosPacientesEspecialidad(request):
    cursor = conexion.cursor()
    cursor.execute("select * from medicosDelPaciente_especialidad")
    valores = cursor.fetchall()

    arreglo = []
    for v in valores:
        arreglo.append(v[0])
        arreglo.append(v[1])
        arreglo.append(v[2])
        arreglo.append(v[3])

    return render(request,"MedicosPacientesEspecialidad.html",{"arreglo":arreglo})

def ViewUsernameNombre(request):
    cursor = conexion.cursor()
    cursor.execute("select * from username_nombre ")
    valores = cursor.fetchall()

    arreglo = []
    for v in valores:
        arreglo.append(v[0])
        arreglo.append(v[1])
        arreglo.append(v[2])
        arreglo.append(v[3])
        arreglo.append(v[4])

    return render(request,"UsernameNombre.html",{"arreglo":arreglo})
#----------------------------------------------------------------------------------------------------
