import React from 'react'
import ListItem from "@material-ui/core/ListItem"
import ListItemText from "@material-ui/core/ListItemText"
import List from "@material-ui/core/List"
import {ExpandLess, ExpandMore} from "@material-ui/icons"
import Collapse from "@material-ui/core/Collapse"
import Categories from "./Categories"
import Divider from "@material-ui/core/Divider"
import Drawer from "@material-ui/core/Drawer"
import {makeStyles} from "@material-ui/core/styles"
import ListItemLink from "./ListItemLink"

const drawerWidth = 300;

const useStyles = makeStyles(theme => ({
  drawer: {
    width: drawerWidth,
    flexShrink: 0,
  },
  drawerPaper: {
    width: drawerWidth,
  },
  toolbar: theme.mixins.toolbar,
}));



export default function Sidenav() {
  const classes = useStyles();

  const [open, setOpen] = React.useState(true);

  const handleClick = () => {
    setOpen(!open);
  };

  return (
    <Drawer
      className={classes.drawer}
      variant="permanent"
      classes={{
        paper: classes.drawerPaper,
      }}
    >
      <div className={classes.toolbar} />
      <List>
        <ListItem button onClick={handleClick}>
          <ListItemText primary="Components" />
          {open ? <ExpandLess /> : <ExpandMore />}
        </ListItem>
        <Collapse in={open} timeout="auto" unmountOnExit>
          <Categories />
        </Collapse>

        <ListItemLink primary={'Projects'} to={'/projects'} />
        <ListItemLink primary={'Orders'} to={'/orders'} />
        <ListItemLink primary={'Stock Locations'} to={'/stock-locations'} />
      </List>

      <Divider />

      <ListItem button>
        <ListItemText primary={'Suppliers'} />
      </ListItem>

      <ListItem button>
        <ListItemText primary={'Manufacturers'} />
      </ListItem>

      <ListItem button>
        <ListItemText primary={'Categories'} />
      </ListItem>

      <ListItem button>
        <ListItemText primary={'Part Types'} />
      </ListItem>
    </Drawer>
  )
}