from django.urls import path

from . import views

urlpatterns = [
    path('', views.demo, name='home'),
    path('origin_airport_search/', views.origin_airport_search, name='origin_airport_search'),
    path('destination_airport_search/', views.destination_airport_search, name='destination_airport_search'),
    path('book_flight/<str:flight>/', views.book_flight, name='book_flight'),
    
    path('flights-to-atlanta', views.atlanta, name='flights-to-atlanta'),
    path('lax-to-jfk', views.laxjfk, name='lax-to-jfk'),
    path('book-cheap-business-class-flights', views.bookbusiness, name='book-cheap-business-class-flights')

    
]
