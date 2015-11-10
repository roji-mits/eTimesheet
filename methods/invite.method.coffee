'use strict'

Meteor.methods
  delete:(designationId) ->
    console.log(designationId)
    Designation.update(designationId,{$set:{"deleted":'1'}})
  
  departmentDelete:(departmentId) ->
    console.log(departmentId)
    Department.update(departmentId,{$set:{"deleted":'1'}})

  organizationDelete:(organizationId) ->
    console.log(organizationId)
    Organization.update(organizationId,{$set:{"deleted":'1'}})

  update: (userId, email, firstname, middlename, lastname, mobile, home, address, secondaryemail) ->
    console.log(userId,email)
    Meteor.users.update({_id:userId},{$set:{"emails.0.address":email}})
    Meteor.users.update({_id:userId},{$set:{"profile.0.firstname":firstname}})
    Meteor.users.update({_id:userId},{$set:{"profile.0.middlename":middlename}})
    Meteor.users.update({_id:userId},{$set:{"profile.0.lastname":lastname}})
    Meteor.users.update({_id:userId},{$set:{"profile.0.mobile":mobile}})
    Meteor.users.update({_id:userId},{$set:{"profile.0.home":home}})
    Meteor.users.update({_id:userId},{$set:{"profile.0.address":address}})
    Meteor.users.update({_id:userId},{$set:{"profile.0.secondaryemail":secondaryemail}}) 

  remove:(user) ->
    console.log("comes here to the method") 
    Meteor.users.update({ _id: user },{$set:{"profile.0.deleted":1}})
    console.log("comes here to the method2") 
   
