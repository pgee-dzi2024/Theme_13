# Типове действия

TYPE1 = 1
TYPE2 = 2
TYPE3 = 3
TYPE4 = 4
TASK_TYPE = [
    (TYPE1, 'Подадена'),
    (TYPE2, 'Приета'),
    (TYPE3, 'Работи се'),
    (TYPE4, 'Затворена'),
]


class DataMixin:
    def get_user_context(self, **kwargs):
        context = kwargs
        return context


