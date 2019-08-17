import React from "react";
import 'react-virtualized/styles.css'
import styles from './EditBhajans.css';

import 'bootstrap/dist/css/bootstrap.css';
import { Button, Modal } from 'react-bootstrap';



export class EditForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
        };
    }


    componentDidMount() {
        // ...
    }

    componentWillUnmount() {
        // Clean up. Like removing timers.
    }

    generateFromModal (schema) {
        console.log(JSON.stringify(schema));
        return (
            <pre>
            {
              schema.map((val, idx) => {
                  return (
                      <div>{val[0]} => { val[1] }</div>
                  );
              })
            }
            </pre>
        );
        // return (
        //     <pre>
        //         {JSON.stringify(schema, 0, 2)}
        //     </pre>
        // )
    }

    render() {
        return (
            <Modal
              {...this.props}
              size="lg"
              aria-labelledby="contained-modal-title-vcenter"
              centered
            >
              <Modal.Header closeButton>
                <Modal.Title id="contained-modal-title-vcenter">
                  Edit form
                </Modal.Title>
              </Modal.Header>
              <Modal.Body>
                    {this.generateFromModal(this.props.schema)}
              </Modal.Body>
              <Modal.Footer>
                <Button onClick={this.props.onHide}>Close</Button>
              </Modal.Footer>
            </Modal>
          );
    }
}
