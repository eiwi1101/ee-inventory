import React from 'react'
import {useQuery} from "@apollo/react-hooks"
import { gql } from 'apollo-boost'
import ListItemText from "@material-ui/core/ListItemText"
import List from "@material-ui/core/List"
import {makeStyles} from "@material-ui/core/styles"
import ListItemLink from "./ListItemLink"

const getCategories = gql`
query getCategories {
    getCategories {
        id
        name
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

  const categories = data.getCategories;

  categories.map(c => {
    c.slug = (c.name || "").toLowerCase().replace(/[^a-z]/g, '-').replace(/-+/g, '-');
  })

  return (
    <List dense>
      { categories.map((category) => (
        <ListItemLink key={category.id} className={styles.nested} primary={category.name} to={'/categories/' + category.id + '-' + category.slug} />
      )) }
    </List>
  )
}