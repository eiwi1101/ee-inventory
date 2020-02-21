import React, { Component } from 'react'
import {useQuery} from "@apollo/react-hooks"
import { gql } from 'apollo-boost'
import ListItemIcon from "@material-ui/core/ListItemIcon"
import InboxIcon from "@material-ui/icons/MoveToInbox"
import MailIcon from "@material-ui/icons/Mail"
import ListItemText from "@material-ui/core/ListItemText"
import ListItem from "@material-ui/core/ListItem"
import List from "@material-ui/core/List"
import {makeStyles} from "@material-ui/core/styles"

const getCategories = gql`
query getCategories {
    getCategories {
        id
        name
        partTypes {
            id
            name
        }
    }
}
`

const useStyles = makeStyles(theme => ({
  nested: {
    paddingLeft: theme.spacing(4),
  },
}));

export default function Categories() {
  const { loading, error, data } = useQuery(getCategories);

  const styles = useStyles();

  if (loading) return <p>Loading...</p>;
  if (error) return <p>Error :(</p>;

  return (
    <List dense>
      { data.getCategories.map((category) => (
        <ListItem button key={category.id} className={styles.nested}>
          <ListItemText primary={category.name} />
        </ListItem>
      )) }
    </List>
  )
}