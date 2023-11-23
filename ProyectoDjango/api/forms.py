from django import forms 
from .models import *

class MedicamentosForm(forms.ModelForm):
    class Meta:
        model = Medicamentos
        fields = '__all__'

class RecetasForm(forms.ModelForm):
    class Meta:
        model = Receta
        fields = '__all__'

class ConsultasForm(forms.ModelForm):
    class Meta:
        model = Consultas
        fields = '__all__'

class DireccionesForm(forms.ModelForm):
    class Meta:
        model = Direccion
        fields = '__all__'

class MedicosForm(forms.ModelForm):
    class Meta:
        model = Medico
        fields = '__all__'

class PacientesForm(forms.ModelForm):
    class Meta:
        model = Paciente
        fields = '__all__'

class UsersForm(forms.ModelForm):
    class Meta:
        model = Users
        fields = '__all__'


class UserinfoForm(forms.ModelForm):
    class Meta:
        model = Userinfo
        fields = '__all__'