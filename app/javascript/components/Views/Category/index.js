import React from 'react'
import {useParams} from "react-router"
import {useQuery} from "@apollo/react-hooks"
import {gql} from "apollo-boost"
import { makeStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableCell from '@material-ui/core/TableCell';
import TableContainer from '@material-ui/core/TableContainer';
import TableHead from '@material-ui/core/TableHead';
import TablePagination from '@material-ui/core/TablePagination';
import TableRow from '@material-ui/core/TableRow';

const getCategory = gql`
    query getCategory($id: Int!) {
        getCategory(id: $id) {
            id
            name
            parts {
                id
                name
                description
                partNumber
                value
                valueUnit
                valueUnitName
                
                package {
                    name
                }
            }
        }
    }
`

const useStyles = makeStyles({
  root: {
    width: '100%',
  },
  container: {
    maxHeight: 440,
  },
});

export default function Category() {
  const params = useParams();
  params.id = parseInt(params.slug);

  const classes = useStyles();
  const [page, setPage] = React.useState(0);
  const [rowsPerPage, setRowsPerPage] = React.useState(10);

  const { loading, error, data } = useQuery(getCategory, { variables: { id: params.id, page, perPage: rowsPerPage }})

  if (loading) return <p>Loading...</p>;
  if (error) return <p>Error :(</p>;

  const category = data.getCategory;
  const parts = category.parts;

  const handleChangePage = (event, newPage) => {
    setPage(newPage);
  };

  const handleChangeRowsPerPage = event => {
    setRowsPerPage(+event.target.value);
    setPage(0);
  };

  const columns = [
    {
      id: 'id',
      label: 'ID',
    },
    {
      id: 'name',
      label: 'Name',
    },
    {
      id: 'description',
      label: 'Description',
    },
    {
      id: 'value',
      label: 'Value',
      format: (part) => {
        return (
          <span>
            { part.value }
            <small>{ part.valueUnit }</small>
          </span>
        )
      }
    },
    {
      id: 'package',
      label: 'Package',
      format: (part) => {
        return part.package && part.package.name
      }
    }
  ];

  return (
    <div>
      <Paper className={classes.root}>
        <TableContainer className={classes.container}>
          <Table stickyHeader aria-label="sticky table" size="small">
            <TableHead>
              <TableRow>
                {columns.map(column => (
                  <TableCell
                    key={column.id}
                    align={column.align}
                    style={{ minWidth: column.minWidth }}
                  >
                    {column.label}
                  </TableCell>
                ))}
              </TableRow>
            </TableHead>
            <TableBody>
              {parts.map(row => {
                return (
                  <TableRow hover role="checkbox" tabIndex={-1} key={row.id}>
                    {columns.map(column => {
                      const value = row[column.id];
                      return (
                        <TableCell key={column.id} align={column.align}>
                          {column.format ? column.format(row) : value}
                        </TableCell>
                      );
                    })}
                  </TableRow>
                );
              })}
            </TableBody>
          </Table>
        </TableContainer>
        <TablePagination
          rowsPerPageOptions={[10, 25, 100]}
          component="div"
          count={parts.length}
          rowsPerPage={rowsPerPage}
          page={page}
          onChangePage={handleChangePage}
          onChangeRowsPerPage={handleChangeRowsPerPage}
        />
      </Paper>
    </div>
  )
}