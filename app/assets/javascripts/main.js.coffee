changeDimmerLamp = (e) ->
  device_id = $(e).data 'device_id'
  device_controller = $(e).data 'device_controller'
  value = $(e).val()
  url = "#{gon.rooms_index_path}/#{app.room_id}/#{device_controller}/#{device_id}/"
  $.post url, {"_method": "put", status: value}

enableDevice = (e) ->
  device_id = $(e).data 'device_id'
  device_controller = $(e).data 'device_controller'
  url = "#{gon.rooms_index_path}/#{app.room_id}/#{device_controller}/#{device_id}/on"
  $.post url


disableDevice = (e) ->
  device_id = $(e).data 'device_id'
  device_controller = $(e).data 'device_controller'
  url = "#{gon.rooms_index_path}/#{app.room_id}/#{device_controller}/#{device_id}/off"
  $.post url

enableDeviceListeners = ->
  $(".device_on").click (e) ->
    enableDevice e.target

  $(".device_off").click (e) ->
    disableDevice e.target

  $(".dimmer_lamp_input").change (e) ->
    changeDimmerLamp e.target

# Devices refresh
#=======================================================================

# Return true if rooms changed
checkDevicesUpdated = (data) ->
  return true unless app.devicesData
  return true if app.devicesData.length != data.length

  for d, i in data
    return true if app.devicesData[i].name != d.name
    return true if app.devicesData[i].id != d.id
    return true if app.devicesData[i].status != d.status
  return false

updateDevices = (data) ->
  return unless checkDevicesUpdated(data)
  app.devicesData = data
  $("#devices_list").html ''
  for d in data
    device = Mustache.render $("script#device_#{d.device_type}").html(), d
    $("#devices_list").append device
  enableDeviceListeners()

refreshDevices = ->
  url = "#{gon.rooms_index_path}/#{app.room_id}/devices"
  $.get url, updateDevices, 'json' if app.room_id
  setTimeout refreshDevices, gon.rooms_refresh_delay


setSelectedRoom = (e) ->
  e = $("select#rooms") unless e
  room_id = $(e).val()
  app.room_id = room_id


# Rooms refresh
#=======================================================================

# Return true if rooms changed
checkRoomsUpdated = (data) ->
  return true unless app.roomsData
  return true if app.roomsData.length != data.length

  for d, i in data
    return true if app.roomsData[i].name != d.name
    return true if app.roomsData[i].id != d.id
  return false

# Update room in select if changed
updateRooms = (data) ->
  return unless checkRoomsUpdated(data)

  app.roomsData = data
  $("select#rooms").html ''
  for d in data
    option = $('<option></option>').val(d.id).html(d.name)
    $("select#rooms").append option

# Request room index each configured time
refreshRooms = ->
  $.get gon.rooms_index_path, updateRooms, 'json'
  setTimeout refreshRooms, gon.rooms_refresh_delay

app = {}

$ ->
  if gon.initial_room_id
    refreshRooms()
    refreshDevices()
    app.room_id = gon.initial_room_id
    $("select#rooms").change (e) ->
      setSelectedRoom(e.target)