import { type ClientSchema, a, defineData } from '@aws-amplify/backend';

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
  }).authorization((allow) => [
    allow.owner()
  ]),
  
  StaffUserProfile: a.model({
    id : a.id().required(),
    name: a.string().required(),
    email: a.string().required(),
    department: a.string().required(),
    qualification: a.string().required()
  }).authorization((allow) => [
    allow.owner(),
  ]),


  Status: a.enum([
    "PENDING",
    "REJECTED",
    "APPROVED",
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
    //details about the event
    eventname: a.string().required(),
    location: a.string().required(),
    date: a.date().required(),
    registeredUrl: a.string().required(),
    validDocuments: a.string().array().required(),
    proctorstatus: a.ref('Status').required(),
    AcStatus: a.ref('Status').required(),
    HodStatus: a.ref('Status').required(),


  })
    .secondaryIndexes((index)=>[index('Hod'), index('Ac'),index('Proctor')])
    .authorization((allow) => [
    allow.owner(),
    allow.ownerDefinedIn('Proctor'),
    allow.ownerDefinedIn('Ac'),
    allow.ownerDefinedIn('Hod'),
  ])

});

export type Schema = ClientSchema<typeof schema>;

export const data = defineData({
  schema,
  authorizationModes: {
    defaultAuthorizationMode: 'userPool',
  },
});
