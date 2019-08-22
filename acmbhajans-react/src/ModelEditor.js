import React from "react";
import 'react-virtualized/styles.css'
import { AutoSizer, List } from 'react-virtualized'
import 'bootstrap/dist/css/bootstrap.css';
import { Button, Modal, Form } from 'react-bootstrap';

export class ModelEditor extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            rowCount: 0,
            overscanRowCount: 100,
            showEditForm: false,
        };
        
        this.props.setState({
          form: this.props.initForm()
        });

        this.renderRow = this.renderRow.bind(this);
        this.generateForm = this.generateForm.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    generateForm() {
      let onHide = () => this.setState({ showEditForm: false })
      
     
      return (<Modal
        show={this.state.showEditForm}
        onHide={onHide}
        {...this.props}
        size="lg"
        aria-labelledby="contained-modal-title-vcenter"
        centered
      >
        <Form onSubmit={this.handleSubmit}>
          <Modal.Header closeButton>
            <Modal.Title id="contained-modal-title-vcenter">
              {this.props.pageName}
            </Modal.Title>
          </Modal.Header>
          <Modal.Body>
            {this.props.editForm}
          </Modal.Body>
          <Modal.Footer>
            <Button type="submit">Submit form</Button>
            <Button onClick={onHide}>Close</Button>
          </Modal.Footer>
        </Form>
      </Modal>);
    }

    
    componentDidMount() {
        fetch(this.props.URL)
        .then(res => res.json())
        .then(data => {
            this.props.setState({
                ...data
            })
        });
    }


    handleSubmit(event) {
      this.setState({ showEditForm: false });

      fetch(this.props.URL, {
        method: 'POST', mode: 'cors', cache: 'no-cache',
        headers: { 'Content-type': 'application/json' },
        body: JSON.stringify(this.props.state.form)})
      .then(response => response.json())
      .then(data => {
            this.props.setState({ 
                contents: data['contents']
            })
            this.list.forceUpdateGrid();
        });

      event.preventDefault();
    }

    render() {
        return (<div>
             <Button 
                variant="primary" 
                onClick={() => {
                    this.props.setState({ 
                      form: this.props.initForm()
                    });
                    this.setState({
                      showEditForm: true 
                    })}}>
                Add {this.props.pageName}
            </Button>
            
            { this.state.showEditForm && this.generateForm() }
            
            <AutoSizer disableHeight>
            {({width}) => (
                <List
                    ref={ref => { this.list = ref }}
                    className="List"
                    height={1500}
                    overscanRowCount={10}
                    rowCount={this.props.state.contents.length}
                    rowHeight={50}
                    rowRenderer={this.renderRow}
                    width={width}
                />
            )}
            </AutoSizer>
            </div>
        );
    }

    

    renderRow({index, key, style}) {
        const datum = this.props.state.contents[index];
        
        let loadForm = () => {
          this.props.setState({
            form: {
                ...this.state.form,
                ...datum,
                ...this.props.populateForm(datum, this.props.state) 
              }});
          
          this.setState({
            showEditForm: true 
          })};
        
        let formattedRow = '';
        
        if (this.props.formatRow) {
            formattedRow = this.props.formatRow(datum);
        } else if ('name' in datum) {
          formattedRow = datum['name'];
        } else {
          formattedRow = JSON.stringify(datum);
        }
        
        return (
          <div className="row" key={key} style={style} onClick={loadForm}>
            <div>{formattedRow}</div>
          </div>
        );
      }
}
