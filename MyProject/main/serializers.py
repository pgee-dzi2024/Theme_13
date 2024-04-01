from rest_framework import serializers
from .models import Log, Request
from django.contrib.auth.models import User


# Сериализатор  Заявки
class RequestSerializer(serializers.ModelSerializer):
    class Meta:
        model = Request
        fields = "__all__"
        depth = 1


# Сериализатор  Заявки
class LogSerializer(serializers.ModelSerializer):
    class Meta:
        model = Log
        fields = "__all__"
        depth = 1


# Сериализатор  Потребители
class ClientSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'username', 'first_name', 'last_name')
        # fields = "__all__"
        depth = 1



