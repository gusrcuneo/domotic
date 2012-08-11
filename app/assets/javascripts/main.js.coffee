# Return true if rooms changed
checkDevicessUpdated = (data) ->
  return true unless app.devicesData
  return true if app.Data.length != data.length

  for d, i in data
    return true if app.devicesData[i].name != d.name
    return true if app.devicesData[i].id != d.id
    return true if app.devicesData[i].status != d.status
  return false

updateDevices = (data) ->
  return unless checkDevicesUpdated(data)

  app.devicesData = data
  $("select#devices").html ''
  for d in data
    option = $('<option></option>').val(d.id).html(d.name)
    $("select#devices").append option

refreshDevices = ->
  url = "#{gon.rooms_index_path}/#{app.room_id}/devices"
  $.get url, updateDevices, 'json' if app.room_id
  setTimeout refreshDevices, 1000

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
  setTimeout refreshRooms, 1000

app = {}

$ ->

  refreshRooms()
  refreshDevices()
  $("select#rooms").change (e) ->
    setSelectedRoom(e.target)