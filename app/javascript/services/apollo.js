import ApolloClient from 'apollo-boost';

const client = new ApolloClient({
  uri: `${window.location.origin}/graphql`,
});

export default client
