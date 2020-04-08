// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import PropTypes from 'prop-types'
import client from "../services/apollo"
import {ApolloProvider} from '@apollo/react-hooks'

import Layout from "./Layout"
import {
  BrowserRouter as Router,
  Switch,
  Route
} from 'react-router-dom'
import Category from "./Views/Category"

const App = props => (
  <ApolloProvider client={client}>
    <Router>
      <Layout>
        <Switch>
          <Route path={'/categories/:slug'}>
            <Category />
          </Route>
        </Switch>
      </Layout>
    </Router>
  </ApolloProvider>
)

export default App