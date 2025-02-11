import type { Schema } from "../../data/resource"
import { env } from "$amplify/env/create-user"
import {
    AdminAddUserToGroupCommand,
    AdminCreateUserCommand,
    CognitoIdentityProviderClient,
} from "@aws-sdk/client-cognito-identity-provider"

type Handler = Schema["createUser"]["functionHandler"]
const client = new CognitoIdentityProviderClient()

export const handler: Handler = async (event) => {
    const { username, email, password } = event.arguments
    const command = new AdminCreateUserCommand({
        UserPoolId: env.AMPLIFY_AUTH_USERPOOL_ID,
        Username: email,
        TemporaryPassword: password,
        UserAttributes: [{
            "Name": "name",
            "Value": username
        }]
    })

    const response = await client.send(command);

    if (response.User?.Username) {
        const commandgroup = new AdminAddUserToGroupCommand({
            Username: response.User.Username,
            GroupName: "STAFF",
            UserPoolId: env.AMPLIFY_AUTH_USERPOOL_ID,
        })
        await client.send(commandgroup)  // Fix: Send commandgroup instead of command
    }

    return response.User!.Username!
}
