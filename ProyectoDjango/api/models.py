# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Consultas(models.Model):
    lugar = models.TextField()
    hora = models.TimeField()
    fecha = models.DateField()
    motivo = models.TextField()
    medico_paciente = models.ForeignKey('MedicoPaciente', models.DO_NOTHING, db_column='medico_paciente')
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)
    deleted_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'consultas'


class Direccion(models.Model):
    id = models.IntegerField(primary_key=True)
    userinfo = models.ForeignKey('Userinfo', models.DO_NOTHING, db_column='userinfo', related_name='direccionUserInfo')
    tipo = models.CharField(max_length=50)
    estado = models.CharField(max_length=50)
    municipio = models.CharField(max_length=50)
    colonia = models.CharField(max_length=50)
    calle = models.CharField(max_length=50)
    cp = models.CharField(db_column='CP', max_length=5)  # Field name made lowercase.
    noext = models.IntegerField(db_column='noExt')  # Field name made lowercase.
    noint = models.IntegerField(db_column='noInt', blank=True, null=True)  # Field name made lowercase.
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)
    deleted_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'direccion'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Medicamentos(models.Model):
    nombrecomercial = models.CharField(db_column='nombreComercial', unique=True, max_length=50)  # Field name made lowercase.
    nombrecinetifico = models.CharField(db_column='nombreCinetifico', max_length=80)  # Field name made lowercase.
    formafarmaceutica = models.CharField(db_column='formaFarmaceutica', max_length=20)  # Field name made lowercase.
    dosis = models.IntegerField()
    fechacaducidad = models.DateField(db_column='fechaCaducidad')  # Field name made lowercase.
    lotefabricacion = models.CharField(db_column='loteFabricacion', max_length=10)  # Field name made lowercase.
    version = models.CharField(max_length=15)
    simbolo = models.CharField(max_length=20, blank=True, null=True)
    imagenempaque = models.CharField(db_column='imagenEmpaque', max_length=150)  # Field name made lowercase.
    stock = models.IntegerField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)
    deleted_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'medicamentos'


class Medico(models.Model):
    especialidad = models.CharField(max_length=50)
    turno = models.CharField(max_length=50)
    diaslaborales = models.CharField(db_column='diasLaborales', max_length=50)  # Field name made lowercase.
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)
    deleted_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'medico'


class MedicoPaciente(models.Model):
    medico = models.ForeignKey(Medico, models.DO_NOTHING, db_column='medico')
    paciente = models.ForeignKey('Paciente', models.DO_NOTHING, db_column='paciente')
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)
    deleted_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'medico_paciente'


class Paciente(models.Model):
    curp = models.CharField(db_column='CURP', max_length=18)  # Field name made lowercase.
    statusseguro = models.CharField(db_column='statusSeguro', max_length=50)  # Field name made lowercase.
    tiposangre = models.CharField(db_column='tipoSangre', max_length=3)  # Field name made lowercase.
    alergia = models.CharField(max_length=50, blank=True, null=True)
    fecharevision = models.DateField(db_column='fechaRevision', blank=True, null=True)  # Field name made lowercase.
    motivorevision = models.TextField(db_column='motivoRevision', blank=True, null=True)  # Field name made lowercase.
    habitotoxico = models.CharField(db_column='habitoToxico', max_length=50, blank=True, null=True)  # Field name made lowercase.
    condicionesprevias = models.CharField(db_column='condicionesPrevias', max_length=50, blank=True, null=True)  # Field name made lowercase.
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)
    deleted_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'paciente'


class Receta(models.Model):
    consulta = models.ForeignKey(Consultas, models.DO_NOTHING, db_column='consulta')
    fechavencimiento = models.DateField(db_column='fechaVencimiento')  # Field name made lowercase.
    status = models.IntegerField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)
    deleted_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'receta'


class RecetaMedicamento(models.Model):
    medicamento = models.ForeignKey(Medicamentos, models.DO_NOTHING, db_column='medicamento')
    receta = models.ForeignKey(Receta, models.DO_NOTHING, db_column='receta')

    class Meta:
        managed = False
        db_table = 'receta_medicamento'


class Userinfo(models.Model):
    id = models.OneToOneField('Users', models.DO_NOTHING, db_column='id', primary_key=True)
    primernombre = models.CharField(db_column='primerNombre', max_length=50)  # Field name made lowercase.
    segundonombre = models.CharField(db_column='segundoNombre', max_length=50, blank=True, null=True)  # Field name made lowercase.
    apellidopaterno = models.CharField(db_column='apellidoPaterno', max_length=50)  # Field name made lowercase.
    apellidomaterno = models.CharField(db_column='apellidoMaterno', max_length=50)  # Field name made lowercase.
    genero = models.CharField(max_length=1)
    telefono = models.CharField(max_length=15)
    foto = models.CharField(max_length=250)
    status = models.IntegerField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)
    deleted_at = models.DateTimeField(blank=True, null=True)
    comentario_deleted_at = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'userinfo'


class Users(models.Model):
    username = models.CharField(unique=True, max_length=50, blank=True, null=True)
    correo = models.CharField(max_length=100)
    password = models.CharField(max_length=150, blank=True, null=True)
    status = models.IntegerField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)
    deleted_at = models.DateTimeField(blank=True, null=True)
    medico = models.ForeignKey(Medico, models.DO_NOTHING, db_column='medico', blank=True, null=True)
    paciente = models.ForeignKey(Paciente, models.DO_NOTHING, db_column='paciente', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'users'
