import React from "react";
import 'react-virtualized/styles.css'
import { AutoSizer, List } from 'react-virtualized'
import { EditForm } from './EditForm.js'
import styles from './EditBhajans.css';

import 'bootstrap/dist/css/bootstrap.css';
import { Button, Modal } from 'react-bootstrap';


export class Ragas extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            schema: [],
            database: [],
            rowCount: 0,
            overscanRowCount: 10,
            showEditForm: false,
        };

        this._rowRenderer = this._rowRenderer.bind(this);
    }

    generateDummyDatabase() {
        let database = []
        for (let i = 0; i < 100; i++) 
            database.push({
                index: i, 
                name: `Bhajan ${i}`, 
                deity: 'Siva', 
                beat: 8, 
                language: 'Tamil'
            });
        
        return database;
    }

    componentDidMount() {
        // Make AJAX calls here
        let database = this.generateDummyDatabase();
        console.log(database);
        this.setState({ 
            database: database,
        });


        fetch('http://localhost:1234/raga/edit')
            .then(res => res.json())
            .then(data => {
                this.setState({
                    'schema': data['schema'] })
            });
    }

    componentWillUnmount() {
        // Clean up. Like removing timers.
    }

    render() {
        return (<div>
             <Button 
                variant="primary" 
                onClick={() => this.setState({ showEditForm: true })}>
                Add Raga
            </Button>
            
            <EditForm
                schema={this.state.schema}
                show={this.state.showEditForm}
                onHide={() => this.setState({ showEditForm: false })}
            />


            <AutoSizer disableHeight>
            {({width}) => (
                <List
                    ref="List"
                    className="List"
                    height={500}
                    overscanRowCount={10}
                    // noRowsRenderer={this._noRowsRenderer}
                    rowCount={this.state.database.length}
                    rowHeight={50}
                    rowRenderer={this._rowRenderer}
                    // scrollToIndex={scrollToIndex}
                    width={width}
                />
            )}
            </AutoSizer>
            </div>
        );
    }

    

    _rowRenderer({index, key, style}) {
        const datum = this.state.database[index];

        return (
          <div className="row" key={key} style={style} onClick={() => this.setState({ showEditForm: true })}>
            <div>{datum.name} - {datum.deity} - {datum.language}</div>
          </div>
        );
      }
}
