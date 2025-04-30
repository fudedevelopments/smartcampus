import { defineBackend } from '@aws-amplify/backend';
import { auth } from './auth/resource';
import { data } from './data/resource';
import { storage } from './storage/resource';
import { getOndutyHttp } from './functions/getondutyhttp/resources';
import { HttpUserPoolAuthorizer } from 'aws-cdk-lib/aws-apigatewayv2-authorizers';
import { CorsHttpMethod, HttpApi, HttpMethod } from 'aws-cdk-lib/aws-apigatewayv2';
import { HttpLambdaIntegration } from 'aws-cdk-lib/aws-apigatewayv2-integrations';
import { Policy, PolicyStatement } from 'aws-cdk-lib/aws-iam';
import { Stack } from 'aws-cdk-lib';

  const backend = defineBackend({
  auth,
  data,
  storage,
  getOndutyHttp
  });

const apiStack = backend.createStack("api-stack");

const userPoolAuthorizer = new HttpUserPoolAuthorizer(
  "userPoolAuth",
  backend.auth.resources.userPool,
  {
    userPoolClients: [backend.auth.resources.userPoolClient],
  }
);

const httpLambdaIntegration = new HttpLambdaIntegration(
  "LambdaIntegration",
  backend.getOndutyHttp.resources.lambda
);

const httpApi = new HttpApi(apiStack, "HttpApi", {
  apiName: "NecHttp",
  corsPreflight: {
    // Modify the CORS settings below to match your specific requirements
    allowMethods: [
      CorsHttpMethod.GET,
      CorsHttpMethod.POST,
      CorsHttpMethod.PUT,
      CorsHttpMethod.DELETE,
    ],
    // Restrict this to domains you trust
    allowOrigins: ["*"],
    // Specify only the headers you need to allow
    allowHeaders: ["*"],
  },
  createDefaultStage: true,
});


httpApi.addRoutes({
  path: "/items",
  methods: [HttpMethod.GET, HttpMethod.PUT, HttpMethod.POST, HttpMethod.DELETE],
  integration: httpLambdaIntegration,
  authorizer: userPoolAuthorizer
});




backend.addOutput({
  custom: {
    API: {
      [httpApi.httpApiName!]: {
        endpoint: httpApi.url,
        region: Stack.of(httpApi).region,
        apiName: httpApi.httpApiName,
      },
    },
  },
});