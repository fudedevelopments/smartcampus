import { defineAuth } from '@aws-amplify/backend';
import { createUser } from '../functions/createuser/resources';
import { listUsersInGroup } from '../functions/listusersingroup/resource';
import { preSignUp } from './presignup/resource';


export const auth = defineAuth({
  loginWith: {
    email: true,
  },
  triggers: {
    preSignUp
  },
  groups: ["ADMINS", "STAFF"],
  access: (allow) => [
    allow.resource(createUser).to(["createUser"]),
    allow.resource(listUsersInGroup).to(["listUsersInGroup"]),
  ],
});
