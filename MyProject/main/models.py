from django.db import models
from datetime import date, datetime
from django.utils import timezone


# Заявки за обслужване
class RequestManager(models.Manager):
    def create_request(self, dt):
        print('models: ', dt)
        item = self.create(user_id=dt['user_id'], user_name=dt['user_name'], status=dt['status'],
                           title=dt['title'], message=dt['message'])
        return item


class Request(models.Model):
    user_id = models.IntegerField('id на потрeбител', default=0, null=False)
    user_name = models.CharField('име на потребител', max_length=100, default='', blank=True)
    status = models.CharField('текущо състояние', default='', max_length=10, blank=False)
    title = models.CharField('тема', max_length=100, default='', blank=True)
    message = models.TextField('действие', default='', blank=True)
    date = models.DateTimeField('дата и час', default=timezone.now, null=True)

    objects = RequestManager()

    def __str__(self):
        return f'({str(self.date)}) заявка #{self.id}'

    class Meta:
        verbose_name = 'Заявка'
        verbose_name_plural = 'Заявки'


# лог на действията
class LogManager(models.Manager):
    def create_request(self, dt):
        print('models: ', dt)
        item = self.create(request_id=dt['request_id'], client_id=dt['client_id'],
                           action=dt['action'], message=dt['message'])
        return item


class Log(models.Model):
    request_id = models.IntegerField('id на заявка', default=0, null=False,)
    client_id = models.IntegerField('id на клиента', default=0, null=False,)
    action = models.CharField('текущо действие', default='', max_length=10, blank=False)
    message = models.TextField('описание', default='', blank=True)
    date = models.DateTimeField('дата и час', default=datetime.now, null=True)

    objects = LogManager()

    def __str__(self):
        return f'({str(self.date)}) #{self.id}/заявка #{self.request_id}'

    class Meta:
        verbose_name = 'Действие'
        verbose_name_plural = 'Действия'
