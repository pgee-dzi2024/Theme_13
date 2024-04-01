from django.shortcuts import render, redirect
from django.contrib.auth import logout
from django.contrib.auth.views import LoginView
from django.urls import reverse_lazy

from rest_framework.views import APIView
from rest_framework.response import Response

from .serializers import *

from .utils import *

from .forms import *

from django.contrib.auth.models import User


# Начален екран
class SiteLoginView(DataMixin, LoginView):
    form_class = LoginUserForm
    template_name = 'main/login.html'

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super().get_context_data(**kwargs)
        c_def = self.get_user_context(title="ВХОД")
        return dict(list(context.items())+list(c_def.items()))

    def get_success_url(self):
        user = self.request.user
        if user.is_active:
            if user.is_superuser:
                reverse_lazy_addr = 'admin:index'
            elif user.is_staff:
                reverse_lazy_addr = 'staff'
            else:
                reverse_lazy_addr = 'client'
        else:
            reverse_lazy_addr = 'login'
        return reverse_lazy(reverse_lazy_addr)


# logout - връщане към началния екран
def logout_user(request):
    logout(request)
    return redirect('login')


# приложение за клиенти
def clients_view(request):
    if not request.user.is_authenticated:
        return redirect("login")
    else:
        context = {'user_id':request.user.id, }
        return render(request, 'main/client.html', context)


# приложение за персонала

def staff_view(request):
    if not request.user.is_authenticated:
        return redirect("login")
    else:
        return render(request, 'main/staff.html')


# R E S T   У С Л У Г И
# Връща списък на заявките
class RequestSerializerView(APIView):
    def get(self, request, uid, sts):
        # uid - id потребител или 0 за всички
        # sts - статус на заявката:
        #       0 - без филтър по статус
        #       1 - последните 4 заявки
        #       2 - текущи заявки (без закритите)
        #       3 - закрити заявки
        if sts == 0:
            if uid == 0:  # за всички потребители без филтър по състояние
                queryset = Request.objects.order_by('-date')
            else:         # без филтър по състояние, но за конкретен потрбител
                queryset = Request.objects.filter(user_id=uid).order_by('-date')
        elif sts == 1:
            if uid == 0:  # последните 4 за всички потребители без филтър по състояние
                queryset = Request.objects.order_by('-date')[:4]
            else:         # последните 4 без филтър по състояние,  но за конкретен потрбител
                queryset = Request.objects.filter(user_id=uid).order_by('-date')[:4]
        elif sts == 2:
            if uid == 0:  # за всички потребители текущите заявки (без закритите)
                queryset = Request.objects.exclude(status='Затворена').order_by('-date')
            else:         # текущите заявки (без закритите) за конкретен потрбител
                queryset = Request.objects.exclude(status='Затворена').filter(user_id=uid).order_by('-date')
        elif sts == 3:
            if uid == 0:  # за всички потребители закритите заявки
                queryset = Request.objects.filter(status='Затворена').order_by('-date')
            else:         # закритите заявки за конкретен потрбител
                queryset = Request.objects.filter(status='Затворена').filter(user_id=uid).order_by('-date')
        else:
            queryset = Request.objects.all()

        serializer = RequestSerializer(queryset, many=True, context={"request": request})
        return Response(serializer.data)


# Връща списък на потребителите
class UserSerializerView(APIView):
    def get(self, request, u_id):
        if u_id == 0:
            queryset = User.objects.filter(is_staff=False)
            print(queryset)
        else:
            queryset = User.objects.filter(id=u_id)
        serializer = ClientSerializer(queryset, many=True, context={"request": request})
        return Response(serializer.data)


# Заявка - запис
class RequestCreateAPIView(APIView):
    def post(self, request):
        dt = {
            'user_id': request.user.id,
            'user_name': request.user.username,
            'status': request.data['status'],
            'title': request.data['title'],
            'message': request.data['message'],
            }
        task = Request.objects.create_request(dt)
        task.save()
        return Response(task.id)


class RequestUpdateStatusAPIView(APIView):
    def post(self, request):
        rid = request.data['rid']
        action = request.data['action']
        task = Request.objects.get(id=rid)
        task.status = action
        task.save()
        return Response(task.id)


# Връща списък на действията
class LogSerializerView(APIView):
    def get(self, request, uid, rid):
        # ako uid e 0 - връща всички записи
        # ako uid > 0 - връща записите за потребител с id=uid:
        #     ako rid=0 - връща последните 4 независимо от заявката
        #     ako rid>0 - връща всички за заявка с id=rid

        if uid == 0:
            queryset = Log.objects.order_by('-date')
        else:
            if rid == 0:
                queryset = Log.objects.filter(client_id=uid).order_by('-date')[:4]
            else:
                queryset = Log.objects.filter(client_id=uid).filter(request_id=rid).order_by('-date')[:4]
        serializer = LogSerializer(queryset, many=True, context={"request": request})
        return Response(serializer.data)


# Заявка - запис
class LogCreateAPIView(APIView):
    def post(self, request):
        dt = {
            'request_id': request.data['request_id'],
            'client_id': request.data['client_id'],
            'action': request.data['action'],
            'message': request.data['message'],
            }
        print('log:', dt)
        task = Log.objects.create_request(dt)
        task.save()
        return Response(task.id)
