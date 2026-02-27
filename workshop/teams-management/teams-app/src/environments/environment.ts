export const environment = {
  production: false,
  apiUrl: "http://teams-api-service:8080", // Use proxy path instead of direct URL
  keycloak: {
    url: "http://localhost:4444",
    realm: "teams",
    clientId: "teams-ui",
  },
};
