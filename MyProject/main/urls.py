from django.urls import path
from . import views

urlpatterns = [
    path('', views.SiteLoginView.as_view(), name='login'),
    path('login', views.SiteLoginView.as_view(), name='login'),
    path('client', views.clients_view, name='client'),
    path('staff', views.staff_view, name='staff'),
    path('logout', views.logout_user, name='logout'),

    path('api/requests/<int:uid>/<int:sts>/', views.RequestSerializerView.as_view()),
    path('api/log/<int:uid>/<int:rid>/', views.LogSerializerView.as_view()),
    path('api/user/<int:u_id>/', views.UserSerializerView.as_view()),
    path('api/create_request/', views.RequestCreateAPIView.as_view()),
    path('api/create_log/', views.LogCreateAPIView.as_view()),
    path('api/update_status/', views.RequestUpdateStatusAPIView.as_view()),

]
