from django.shortcuts import render, redirect
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
from api.forms import *

conexion = mysql.connector.connect(
    host = "localhost",
    user = "root",
    database = "consultorioBD",
    password = "",
    )


def login (request):
    return HttpResponse("<h1>Hola Mundo!</h1>") 


#----------------------------------------------------------------------------------------------------

#Sección para vistas generales

#----------------------------------------------------------------------------------------------------



def ViewConsultas(request):
    consultasListados = Consultas.objects.all()
    return render(request,"consultas/gestionarConsultas.html",{"gconsultas": consultasListados})



def ViewDireccion(request):
    direccionesListados = Direccion.objects.all()
    return render(request,"direcciones/gestionarDireccion.html",{"gdirecciones": direccionesListados})




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
    return render(request,"medicamento/gestionarMedicamentos.html",{"gmedicamentos": medicamentosListados,"arreglo":arreglo})

def ViewMedicos(request):
    medicosListados = Medico.objects.all()
    return render(request,"medicos/gestionarMedicos.html",{"gmedicos": medicosListados})

def ViewPaciente(request):
    pacienteListados = Paciente.objects.all()
    return render(request,"pacientes/gestionarPacientes.html",{"gpacientes": pacienteListados})

def ViewReceta(request):
    recetasListados = Receta.objects.all()
    return render(request,"recetas/gestionarRecetas.html",{"grecetas": recetasListados})

def ViewUserinfo(request):
    userInfoListados = Userinfo.objects.all()
    return render(request,"userinfo/gestionaruserInfo.html",{"guserInfo": userInfoListados})

def ViewUsers(request):
    usersListados = Users.objects.all()
    return render(request,"users/gestionarUsers.html",{"gusers": usersListados})
#----------------------------------------------------------------------------------------------------


#----------------------------------------------------------------------------------------------------

#Sección para CRUD'S

#----------------------------------------------------------------------------------------------------

def crearMedicamento(request):
    formulario = MedicamentosForm(request.POST or None)

    if formulario.is_valid():
        formulario.save()
        return redirect ('/view/medicamentos')

    return render(request,'medicamento/crearMedicamento.html',{'formulario':formulario})

def editarMedicamento(request,id):
    medicamento = Medicamentos.objects.get(id=id) 
    formulario = MedicamentosForm(request.POST or None, instance=medicamento)
    
    if formulario.is_valid():
        formulario.save()
        return redirect ('/view/medicamentos')

    return render(request,'medicamento/editarMedicamento.html',{'formulario':formulario})

def eliminarMedicamento(request,id):
    medicamento = Medicamentos.objects.get(id=id) 
    medicamento.delete()

    return redirect ('/view/medicamentos')




def crearReceta(request):
    formulario = RecetasForm(request.POST or None)
    
    if formulario.is_valid():
        formulario.save()
        return redirect ('/view/recetas')

    return render(request,'recetas/crearReceta.html',{'formulario':formulario})

def editarReceta(request,id):
    receta = Receta.objects.get(id=id) 
    formulario = RecetasForm(request.POST or None, instance=receta)
    
    if formulario.is_valid():
        formulario.save()
        return redirect ('/view/recetas')

    return render(request,'recetas/editarReceta.html',{'formulario':formulario})

def eliminarReceta(request,id):
    receta = Receta.objects.get(id=id) 
    receta.delete()

    return redirect ('/view/recetas')



def crearConsulta(request):
    formulario = ConsultasForm(request.POST or None)
    
    if formulario.is_valid():
        formulario.save()
        return redirect ('/view/consultas')

    return render(request,'consultas/crearConsulta.html',{'formulario':formulario})

def editarConsulta(request,id):
    consulta = Consultas.objects.get(id=id) 
    formulario = ConsultasForm(request.POST or None, instance=consulta)
    
    if formulario.is_valid():
        formulario.save()
        return redirect ('/view/consultas')

    return render(request,'consultas/editarConsulta.html',{'formulario':formulario})

def eliminarConsulta(request,id):
    consulta = Consultas.objects.get(id=id) 
    consulta.delete()

    return redirect ('/view/consultas')




def crearDireccion(request):
    formulario = DireccionesForm(request.POST or None)
    
    if formulario.is_valid():
        formulario.save()
        return redirect ('/view/direcciones')

    return render(request,'direcciones/crearDireccion.html',{'formulario':formulario})

def editarDireccion(request,id):
    direccion = Direccion.objects.get(id=id) 
    formulario = DireccionesForm(request.POST or None, instance=direccion)
    
    if formulario.is_valid():
        formulario.save()
        return redirect ('/view/direcciones')

    return render(request,'direcciones/editarDireccion.html',{'formulario':formulario})

def eliminarDireccion(request,id):
    direccion = Direccion.objects.get(id=id) 
    direccion.delete()

    return redirect ('/view/direcciones')




def crearMedico(request):
    formulario = MedicosForm(request.POST or None)
    
    if formulario.is_valid():
        formulario.save()
        return redirect ('/view/medicos')

    return render(request,'medicos/crearMedico.html',{'formulario':formulario})

def editarMedico(request,id):
    medico = Medico.objects.get(id=id) 
    formulario = MedicosForm(request.POST or None, instance=medico)
    
    if formulario.is_valid():
        formulario.save()
        return redirect ('/view/medicos')

    return render(request,'medicos/editarMedico.html',{'formulario':formulario})

def eliminarMedico(request,id):
    medico = Medico.objects.get(id=id) 
    medico.delete()

    return redirect ('/view/medicos')






def crearPaciente(request):
    formulario = PacientesForm(request.POST or None)
    
    if formulario.is_valid():
        formulario.save()
        return redirect ('/view/pacientes')

    return render(request,'pacientes/crearPaciente.html',{'formulario':formulario})

def editarPaciente(request,id):
    paciente = Paciente.objects.get(id=id) 
    formulario = PacientesForm(request.POST or None, instance=paciente)
    
    if formulario.is_valid():
        formulario.save()
        return redirect ('/view/pacientes')

    return render(request,'pacientes/editarPaciente.html',{'formulario':formulario})

def eliminarPaciente(request,id):
    paciente = Paciente.objects.get(id=id) 
    paciente.delete()

    return redirect ('/view/pacientes')


def crearUserInfo(request):
    formulario = UserinfoForm(request.POST or None)
    
    if formulario.is_valid():
        formulario.save()
        return redirect ('/view/usersinfo')

    return render(request,'userinfo/crearUserInfo.html',{'formulario':formulario})

def editarUserInfo(request,id):
    userinfo = Userinfo.objects.get(id=id) 
    formulario = UserinfoForm(request.POST or None, instance=userinfo)
    
    if formulario.is_valid():
        formulario.save()
        return redirect ('/view/usersinfo')

    return render(request,'userinfo/editarUserInfo.html',{'formulario':formulario})

def eliminarUserInfo(request,id):
    userinfo = Userinfo.objects.get(id=id) 
    userinfo.delete()

    return redirect ('/view/usersinfo')






def crearUser(request):
    formulario = UsersForm(request.POST or None)
    
    if formulario.is_valid():
        formulario.save()
        return redirect ('/view/users')

    return render(request,'users/crearUser.html',{'formulario':formulario})

def editarUser(request,id):
    user = Users.objects.get(id=id) 
    formulario = UsersForm(request.POST or None, instance=user)
    
    if formulario.is_valid():
        formulario.save()
        return redirect ('/view/users')

    return render(request,'users/editarUser.html',{'formulario':formulario})

def eliminarUser(request,id):
    user = Users.objects.get(id=id) 
    user.delete()

    return redirect ('/view/users')






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
    

    return render(request,"tablasRelacionadas/recetaMedicamento.html",{"recetasMedicamento": arreglo})


def PacientesPorCadaMedico(request):
    cursor = conexion.cursor()
    cursor.execute("select mp.id, concat(uim.primerNombre,' ',uim.apellidoPaterno,' ',uim.apellidoMaterno),group_concat(' ',uip.primerNombre,' ', uip.apellidoPaterno,' ',uip.apellidoMaterno) from medico_paciente as mp left join medico as m on mp.medico = m.id left join paciente as p on mp.paciente = p.id join users as up on up.id = p.id join userinfo as uip  on uip.id = up.id join users as um on um.id = m.id join userinfo as uim  on uim.id = um.id group by mp.medico order by mp.id")
    valores = cursor.fetchall()

    arreglo = []
    for v in valores:
        arreglo.append(v[0])
        arreglo.append(v[1])
        arreglo.append(v[2])
    

    return render(request,"tablasRelacionadas/PacientesPorCadaMedico.html",{"PacientesPorCadaMedico": arreglo})


def MedicosPorCadaPaciente(request):
    cursor = conexion.cursor()
    cursor.execute("select mp.id, concat(uip.primerNombre,' ', uip.apellidoPaterno,' ',uip.apellidoMaterno),group_concat(' ',uim.primerNombre,' ',uim.apellidoPaterno,' ',uim.apellidoMaterno) from medico_paciente as mp left join medico as m on mp.medico = m.id left join paciente as p on mp.paciente = p.id join users as up on up.id = p.id join userinfo as uip  on uip.id = up.id join users as um on um.id = m.id join userinfo as uim  on uim.id = um.id group by mp.paciente order by mp.id")
    valores = cursor.fetchall()

    arreglo = []
    for v in valores:
        arreglo.append(v[0])
        arreglo.append(v[1])
        arreglo.append(v[2])

    return render(request,"tablasRelacionadas/MedicosPorCadaPaciente.html",{"MedicosPorCadaPaciente": arreglo})



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

    return render(request,"tablasRelacionadas/UsuarioDireccionInfoUsuario.html",{"UsuarioDireccionInfoUsuario": arreglo})

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
    return render(request,"consultas/gestionarConsultas.html",{"gconsultas": consultasListados})


def RegresarConsultas(request):
    with transaction.atomic():
        con = Consultas.objects.filter(lugar='Nuevoooooooo')
        for c in con:
            c.lugar = 'Hospital A'
            c.save()

    consultasListados = Consultas.objects.all()#[:10]
    return render(request,"consultas/gestionarConsultas.html",{"gconsultas": consultasListados})

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
    return render(request,"direcciones/gestionarDireccion.html",{"gdirecciones": direccionesListados})    

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
    return render(request,"direcciones/gestionarDireccion.html",{"gdirecciones": direccionesListados}) 

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
    return render(request,"medicamento/gestionarMedicamentos.html",{"gmedicamentos": medicamentosListado})


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
    return render(request,"medicamento/gestionarMedicamentos.html",{"gmedicamentos": medicamentosListado})


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
    return render(request,"medicos/gestionarMedicos.html",{"gmedicos": medicosListado})


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
    return render(request,"medicos/gestionarMedicos.html",{"gmedicos": medicosListado})

def AtenderPacientes(request):
    with transaction.atomic():
        con = Paciente.objects.all()
        for c in con:
            if (c.statusseguro == "Ninguno" and c.alergia !="ninguna" and c.tiposangre=="O"):
                c.fecharevision = c.fecharevision +datetime.timedelta(days=2048)
                c.motivorevision = "Campaña gratuita de salud"
                c.save()
            

    pacientesListado = Paciente.objects.all()#[:10]
    return render(request,"pacientes/gestionarPacientes.html",{"gpacientes": pacientesListado})


def RevertirPacientes(request):
    with transaction.atomic():
        con = Paciente.objects.all()
        for c in con:
            if (c.statusseguro == "Ninguno" and c.alergia !="ninguna" and c.tiposangre=="O"):
                c.fecharevision =c.fecharevision- datetime.timedelta(days=2048)
                c.motivorevision = "Revisión"
                c.save()
            

    pacientesListado = Paciente.objects.all()#[:10]
    return render(request,"pacientes/gestionarPacientes.html",{"gpacientes": pacientesListado})

def RecetasExpiradas(request):
    with transaction.atomic():
        con = Receta.objects.all()
        for c in con:
            if (c.fechavencimiento <= date.today()):
                c.status = 0
                c.save()         

    recetasListado = Receta.objects.all()#[:10]
    return render(request,"recetas/gestionarRecetas.html",{"grecetas": recetasListado})

def RevertirExpiradas(request):
    with transaction.atomic():
        con = Receta.objects.all()
        for c in con:
            if (c.status == 0):
                c.status = 1
                c.save()         

    recetasListado = Receta.objects.all()#[:10]
    return render(request,"recetas/gestionarRecetas.html",{"grecetas": recetasListado})

def RevertirExpiradas(request):
    with transaction.atomic():
        con = Receta.objects.all()
        for c in con:
            if (c.status == 0):
                c.status = 1
                c.save()         

    recetasListado = Receta.objects.all()#[:10]
    return render(request,"recetas/gestionarRecetas.html",{"grecetas": recetasListado})

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
    return render(request,"userinfo/gestionaruserInfo.html",{"guserInfo": usersInfoListado})


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
    return render(request,"userinfo/gestionaruserInfo.html",{"guserInfo": usersInfoListado})

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
    return render(request,"users/gestionarUsers.html",{"gusers": usersListado})

def RevertirContraseña(request):
    with transaction.atomic():
        con = Users.objects.all()
        for c in con:
            c.password = "password"+ str(c.id)
            c.save()        

    usersListado = Users.objects.all()#[:10]
    return render(request,"users/gestionarUsers.html",{"gusers": usersListado})
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

    return render(request,"viewsMySQL/MedicamentosConsultaClinica.html",{"arreglo":arreglo})

def ViewMedicosPuebla(request):
    cursor = conexion.cursor()
    cursor.execute("select * from medicos_Puebla")
    valores = cursor.fetchall()

    arreglo = []
    for v in valores:
        arreglo.append(v[0])
        arreglo.append(v[1])
        arreglo.append(v[2])

    return render(request,"viewsMySQL/MedicosPuebla.html",{"arreglo":arreglo})

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

    return render(request,"viewsMySQL/PacientesMedicosF.html",{"arreglo":arreglo})

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

    return render(request,"viewsMySQL/PacientesMedicosM.html",{"arreglo":arreglo})

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

    return render(request,"viewsMySQL/PacientesFumadores.html",{"arreglo":arreglo})

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

    return render(request,"viewsMySQL/PacientesAlcoholicos.html",{"arreglo":arreglo})

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

    return render(request,"viewsMySQL/MedicosPacientesEspecialidad.html",{"arreglo":arreglo})

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

    return render(request,"viewsMySQL/UsernameNombre.html",{"arreglo":arreglo})
#----------------------------------------------------------------------------------------------------




#----------------------------------------------------------------------------------------------------

#Vista para Procedimientos Almacenados

#----------------------------------------------------------------------------------------------------

def procedimientoEditarDireccion(request):
    try:
        cursor = connection.cursor()
        cursor.execute('call updateDireccion')
        direccionesListados = Direccion.objects.filter(id__gt=49)
        return render(request,"direcciones/gestionarDireccion.html",{"gdirecciones": direccionesListados})
    finally:
        cursor.close()

def procedimientoEliminarDireccion(request):
    try:
        cursor = connection.cursor()
        cursor.execute('call deleteDireccion')
        direccionesListados = Direccion.objects.filter(id__gt=49)
        return render(request,"direcciones/gestionarDireccion.html",{"gdirecciones": direccionesListados})
    finally:
        cursor.close()

def procedimientoInsertarDireccion(request):
    try:
        cursor = connection.cursor()
        cursor.execute('call insertDireccion')
        direccionesListados = Direccion.objects.filter(id__gt=49)
        return render(request,"direcciones/gestionarDireccion.html",{"gdirecciones": direccionesListados})
    finally:
        cursor.close()
#----------------------------------------------------------------------------------------------------

