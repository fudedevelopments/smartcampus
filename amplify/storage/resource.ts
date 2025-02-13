import { defineStorage } from "@aws-amplify/backend";

export const storage = defineStorage({
    name: 'Smartcampues',
    access: (allow) => ({
        'ondutydocs/*': [
            allow.authenticated.to(['read', 'write', 'delete'])
        ],
        'eventimages/*': [
            allow.authenticated.to(['read', 'write','delete']),
        ],
    })
});