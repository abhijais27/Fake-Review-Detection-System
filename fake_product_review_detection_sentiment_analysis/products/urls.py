from django.conf.urls import url
from . import views
from django.urls import include, path, re_path


urlpatterns = [
    url(r'^$', views.products, name="products"),
    url(r'^filters/(?P<typeID>\w{0,50})/$', views.product_filter, name="product_filter"),
    url(r'^product-listing$', views.productlisting, name="productlisting"),
    url(r'^payment$', views.payment, name="payment"),
    url(r'^comment-listing$', views.comment_listing, name="comment_listing"),
    url(r'^ip-comment-listing$', views.ip_comment_listing, name="ip_comment_listing"),
    url(r'^user-comment-listing$', views.user_comment_listing, name="user_comment_listing"),
    url(r'^comment-details/(?P<commentID>\w{0,50})/$', views.comment_details, name="comment_details"),
    url(r'^review-graph/(?P<productID>\w{0,50})/$', views.get_graph, name="get_graph"),
    re_path(r'^ip-comments/(?P<IP>[\w|\W]+)/$', views.get_ip_comment_listing, name="get_ip_comment_listing"),
    url(r'^user-comments/(?P<userID>\w{0,50})/$', views.get_user_comment_listing, name="get_user_comment_listing"),
    url(r'^order-cancel/(?P<orderID>\w{0,50})/$', views.cancel_order, name="cancel_order"),
    url(r'^add$', views.add, name="add"),
    url(r'^post_comment/$', views.post_comment, name="post_comment"),
    url(r'^product-details/(?P<productId>\w{0,50})/$', views.product_details, name="product_details"),
    url(r'^update/(?P<productId>\w{0,50})/$', views.update, name="update"),
    url(r'^comment-delete/(?P<commentId>\w{0,50})/$', views.delete_comment, name="delete_comment"),
    url(r'^delete/(?P<prodId>\w{0,50})/$', views.delete, name="delete"),
    url(r'^companylisting$', views.companylisting, name="companylisting"),
    url(r'^addcompany$', views.addcompany, name="addcompany"),
    url(r'^deletecompany/(?P<id>\w{0,50})/$', views.deletecompany, name="deletecompany"),
]
