@LeaveRequest = new Mongo.Collection('leaveRequest')

LeaveRequest.allow
  insert: (userId, leaveRequest) ->
    true
  update: (userId, leaveRequest, fields, modifier) ->
    true
  remove: (userId, leaveRequest) ->
    true
