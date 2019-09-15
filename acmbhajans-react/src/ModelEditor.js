import React from "react";
import 'react-virtualized/styles.css'
import { AutoSizer, List } from 'react-virtualized'
import 'bootstrap/dist/css/bootstrap.css';
import { Button, Modal, Form } from 'react-bootstrap';
import Snackbar from '@material-ui/core/Snackbar';

export class ModelEditor extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            rowCount: 0,
            overscanRowCount: 100,
            showEditForm: false,

            loadingSnackbarOpen: false,
            snackbarMessage: '',
        };
        
        this.renderRow = this.renderRow.bind(this);
        this.generateForm = this.generateForm.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);

        
    }

    
    showMessage(message) {
      this.setState({
          loadingSnackbarOpen: true,
          snackbarMessage: message
      });
  }

  closeSnackbar() {
      this.setState({
          loadingSnackbarOpen: false
      });
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
     this.fetchNewData();
    }

    fetchNewData() {
      let loadUrl = this.props.URL;
      if (this.props.urlparams)
      loadUrl += this.props.urlparams();
      console.log('Loading URL --- ', loadUrl);
      
      fetch(loadUrl)
      .then(res => res.json())
      .then(data => {
          this.props.setState({
            ...data
          })
      });
    }

    componentDidUpdate() {
      console.log('componentDidUpdate');
    }

    handleSubmit(event) {
      let loadUrl = this.props.URL;
      if (this.props.urlparams)
        loadUrl += this.props.urlparams();
      console.log('Loading URL --- ', loadUrl);

      this.setState({ showEditForm: false });
      fetch(loadUrl, {
        method: 'POST', mode: 'cors', cache: 'no-cache',
        headers: { 'Content-type': 'application/json' },
        body: JSON.stringify(this.props.state.forms[this.props.modelfield])})
      .then(response => response.json())
      .then(data => {
          this.showMessage('Saved data')
            let updateFunc = () => {
              console.log('Updating grid');
              this.list.forceUpdateGrid()}
            
            this.props.setState({ 
                ...data
            }, updateFunc);

            setTimeout(updateFunc, 500);
        });

      event.preventDefault();
    }



    render() {
        console.log('Re-rendering');

        return (<div>
            <div className="actionbar">
             <Button 
                variant="primary" 
                onClick={() => {
                    this.props.setState({                        
                        forms: { 
                            ...this.props.state.forms,
                            [this.props.modelfield]: this.props.initForms[this.props.modelfield]()
                        }
                    });
                    this.setState({
                      showEditForm: true 
                    })}}>
                Add {this.props.pageName}
            </Button>

            { this.props.additionalButtons && this.props.additionalButtons}
            </div>
            
            { this.state.showEditForm && this.generateForm() }
            
            <AutoSizer disableHeight>
            {({width}) => (
                <List
                    ref={ref => { this.list = ref }}
                    className="List"
                    height={500}
                    overscanRowCount={10}
                    rowCount={this.props.state[this.props.modelfield].length}
                    rowHeight={50}
                    rowRenderer={this.renderRow}
                    width={width}
                />
            )}
            </AutoSizer>


            <Snackbar
                anchorOrigin={{
                vertical: 'bottom',
                horizontal: 'left',
                }}
                open={this.state.loadingSnackbarOpen}
                autoHideDuration={1000}
                onClose={() => this.closeSnackbar()}
                ContentProps={{
                'aria-describedby': 'message-id',
                }}
                message={<span id="message-id">{this.state.snackbarMessage}</span>}
            />
            </div>
        );
    }

    

    renderRow({index, key, style}) {
        const datum = this.props.state[this.props.modelfield][index];
        
        let populateForm = (a,b) => {}
        if (this.props.populateForm) 
          populateForm = this.props.populateForm;

        let loadForm = () => {
          this.props.setState({
            forms: { 
                ...this.props.state.forms,
                [this.props.modelfield]: {
                    ...this.props.state.forms[this.props.modelfield],
                    ...datum,
                    ...populateForm(datum, this.props.state) 
                }
              }
        });
          
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
          <div className="database-row" key={key} style={style} onClick={loadForm}>
            <div>{formattedRow}</div>
          </div>
        );
      }
}
