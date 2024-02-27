
# <div class="mt-5 d-flex flex-wrap gap-5">
#   <% @bookings.each do |booking| %>
#  <div class="col-lg-3 col-md-6 mb-5 cards d-flex flex-column justify-content-between" data-controller="bookings">
#       <%= link_to flat_path(booking.flat) do %>
#         <%= image_tag booking.flat.photo_url, class: "card-img-top" %>
#       <% end %>
#       <div>
#         <h3 class="mt-3"><%= booking.flat.name %></h3>
#         <p><%= booking.start_date %></p>
#         <p><%= booking.end_date %></p>
#         <% if booking.accepted %>
#           <p style="color:green;">Booking Approved</p>
#         <% else %>
#           <%= simple_form_for booking, data: { action: "submit->bookings#approve" } do |f|%>
#             <%= f.submit "Approve Booking", class:"btn btn-primary"%>
#           <% end %>
#           <%# <button class = "btn btn-primary" data-action="click->bookings#approve">Click</button> %>
#         <% end %>
#       </div>
#     </div>
#   <%= link_to destroy_booking_path(booking), method: :delete, data: { turbo_method: :delete, turbo_confirm: "Are you sure?" } do %>
#           <i class="fa-solid fa-trash"></i>
#         <% end %>
# </div>
# <% end %>
# </div>
