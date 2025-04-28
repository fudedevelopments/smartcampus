import { type ClientSchema, a, defineData } from '@aws-amplify/backend';
import { createUser } from '../functions/createuser/resources';
import { listUsersInGroup } from '../functions/listusersingroup/resource';

const schema = a.schema({
  StudentsUserProfile: a.model({
    id : a.id().required(),
    name: a.string().required(),
    regNo: a.string().required(),
    email: a.string().required(),
    department: a.string().required(),
    year: a.string().required(),
    Proctor: a.string().required(),
    Ac: a.string().required(),
    Hod: a.string().required(),
    deviceToken: a.string().required(),
  }).authorization((allow) => [
    allow.owner(),
    allow.groups(["STAFF", "ADMINS"]).to(['read'])
  ]),
  
  StaffUserProfile: a.model({
    id : a.id().required(),
    name: a.string().required(),
    email: a.string().required(),
    department: a.string().required(),
    qualification: a.string().required(),
    deviceToken: a.string().required(),
  }).authorization((allow) => [
    allow.group("STAFF"),
    allow.group("ADMINS").to(['read']),
    allow.authenticated().to(['read']),
  ]),



  onDutyModel: a.model({
    id: a.id().required(),
    name: a.string().required(),
    regNo: a.string().required(),
    email: a.string().required(),
    department: a.string().required(),
    year: a.string().required(),
    Proctor: a.string().required(),
    Ac: a.string().required(),
    Hod: a.string().required(),
    eventname: a.string().required(),
    location: a.string().required(),
    date: a.date().required(),
    registeredUrl: a.string().required(),
    validDocuments: a.string().array().required(),
    proctorstatus: a.string().required(),
    AcStatus: a.string().required(),
    HodStatus: a.string().required(),
    createdAt: a.timestamp().required()
  })
    .secondaryIndexes((index)=>[index('Hod'), index('Ac'),index('Proctor')])
    .authorization((allow) => [
    allow.owner(),
    allow.ownerDefinedIn('Proctor'),
    allow.ownerDefinedIn('Ac'),
    allow.ownerDefinedIn('Hod'),
    ]),
  
  
  
  
    createUser: a
    .mutation()
    .arguments({
      username: a.string().required(),
      email: a.email().required(),
      password: a.string().required(),
    })
    .authorization((allow) => [allow.group("ADMINS")])
    .handler(a.handler.function(createUser))
    .returns(a.json()),
    
  listUsersInGroup: a
    .query()
    .arguments({
      groupName: a.string().required(),
    })
    .authorization((allow) => [allow.group("ADMINS")])
    .handler(a.handler.function(listUsersInGroup))
    .returns(a.json()),

});

export type Schema = ClientSchema<typeof schema>;

export const data = defineData({
  name: "NecBackend",
  schema,
  authorizationModes: {
    defaultAuthorizationMode: 'userPool',
  },
});
