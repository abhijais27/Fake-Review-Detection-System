from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.listing, name="listing"),
    url(r'^report/(?P<doctorId>\w{0,50})/$', views.listing, name="listing"),
    url(r'^add$', views.add, name="add"),
    url(r'^update/(?P<testId>\w{0,50})/$', views.update, name="update"),
    url(r'^delete/(?P<testId>\w{0,50})/$', views.delete, name="delete"),
]