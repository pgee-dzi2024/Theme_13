from django import forms
from django.contrib.auth.forms import AuthenticationForm


class LoginUserForm(AuthenticationForm):
    username = forms.CharField(label='Потребителско име: ', widget=forms.TextInput(attrs={'class':'form-control'}))
    password = forms.CharField(label='Парола: ', widget=forms.PasswordInput(attrs={'class':'form-control'}))
