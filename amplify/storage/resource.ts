import { defineStorage } from "@aws-amplify/backend";

export const storage = defineStorage({
    name: 'Smartcampues',
    access: (allow) => ({
        'ondutydocs/*': [
            allow.groups(['ADMINS', 'STAFF']).to(['read', 'write', 'delete']),
            allow.authenticated.to(['read', 'write', 'delete'])
        ],
        'eventimages/*': [
            allow.groups(['ADMINS', 'STAFF']).to(['read', 'write', 'delete']),
            allow.authenticated.to(['read', 'write','delete']),
        ],
    })
});