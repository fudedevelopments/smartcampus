import { Schema } from "../../data/resource";
import { env } from "$amplify/env/list-user-in-group"
import { CognitoIdentityProviderClient, ListUsersInGroupCommand } from "@aws-sdk/client-cognito-identity-provider";

type Handler = Schema["listUsersInGroup"]["functionHandler"]
const client = new CognitoIdentityProviderClient()

export const handler: Handler = async (event) => {
    const { groupName } = event.arguments
    const command = new ListUsersInGroupCommand({
        GroupName: groupName,
        UserPoolId: env.AMPLIFY_AUTH_USERPOOL_ID
    })
    const response = await client.send(command)
    return response.Users!.map(user => user.Attributes)
}