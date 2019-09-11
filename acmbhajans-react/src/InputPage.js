import React from "react";
import { Card, Button, Form, Row, Col, Container } from 'react-bootstrap'
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";

import _ from 'lodash'
import moment from 'moment';
import { getDay, addDays } from "date-fns";
import { findElt, findEltName } from './Fields'

import { AutoSizer, Grid } from 'react-virtualized'
import { MdDone, MdClear } from 'react-icons/md'

import {URLBASE} from './Config'

export class InputPage extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            form: {
                weekend: this.getNextWeekendDate(),
                id: '',

                will_attend_practice: false,
                practice_request_id: '',
                practice_note: '',

                will_attend_satsang: false,
                satsang_request_id: '',
                satsang_note: '',
            },
            requests: [],
            bhajans: [],
            people: [],
            ready_list: {},

            overscanColumnCount: 0,
            overscanRowCount: 10,
            rowHeight: 40,
        };


        this.fetchRequest = this.fetchRequest.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);

        this._cellRenderer = this._cellRenderer.bind(this);
        this._getColumnWidth = this._getColumnWidth.bind(this);
        this._getRowClassName = this._getRowClassName.bind(this);
        this._noContentRenderer = this._noContentRenderer.bind(this);
        this._getRowHeight = this._getRowHeight.bind(this);
    }
   
    getNextWeekendDate() {
        let today = new Date();
        let dayNum = getDay(today);

        let offset;
        if (dayNum === 6)
            offset = 7;
        else if (dayNum === 7)
            offset = 6;
        else
            offset = 6 - dayNum;
        let newDate = addDays(today, offset);
        console.log('Returning ', newDate);
        return newDate;
    }

    componentDidMount() {
        // need to load the list of bhajans, 
        // this person's ready list, and their 
        // input for this week if possible

       this.fetchRequest();
    }

    fetchRequest() {
        console.log('This.props has ', this.props);
        let loadUrl = `${URLBASE()}/request/edit`
        let dateStr = moment(this.state.form.weekend).format('YYYY-MM-DD');;
        loadUrl += `?date=${dateStr}&from=${dateStr}&to=${dateStr}`;
        loadUrl += '&person_id=' + this.props.personId;
        loadUrl += '&personal_request';
        fetch(loadUrl)
        .then(res => res.json())
        .then(data => {
            this.setState({
              ...data,
              form: {
                  ...data.personal_request[0]
              },
            }, () => { this.list && this.list.forceUpdate && this.list.forceUpdate() });
        });
    }

    componentWillUnmount() {
        
    }


    handleSubmit(event) {
        // Send to server
        // Show a "saved" message
        console.log('This.props has ', this.props);
        let loadUrl = `${URLBASE()}/request/edit`
        let dateStr = moment(this.state.form.weekend).format('YYYY-MM-DD');;
        loadUrl += `?date=${dateStr}&from=${dateStr}&to=${dateStr}`;
        loadUrl += '&person_id=' + this.props.personId;
        loadUrl += '&personal_request'
        
        fetch(loadUrl, {
          method: 'POST', mode: 'cors', cache: 'no-cache',
          headers: { 'Content-type': 'application/json' },
          body: JSON.stringify(this.state.form)})
        .then(response => response.json())
        .then(data => {
            console.log("Got response: ", data);
              this.setState({ 
                  ...data,
                  form: {
                      ...data.personal_request[0]
                  }
              }, () => this.list.forceUpdate())
          });

        event.preventDefault();
    }

    generateBhajans (label, filterBy) {
        let choices = this.state.bhajans;
        if (filterBy != null) 
            choices = choices.filter(choice => filterBy.includes(choice.id));
        

        return choices.map(choice => <option
            key={label + '-' + choice.id} 
            value={choice.id}>
                {choice.name}
        </option>);
    }

    selectBhajan(bhajan_id) {
        this.setState({
            form: {
                ...this.state.form,
                will_attend_satsang: true,
                satsang_request_id: bhajan_id,
            }
        })
    }


    _getRowClassName(row) {
        return row % 2 === 0 ? "evenRow" : "oddRow";
    }
      
      
    _cellRenderer({columnIndex, key, rowIndex, style}) {
        let rowClassName = this._getRowClassName(rowIndex);
        
        if (rowIndex === 0) {
            let header = ''

            switch (columnIndex) {
                case 0:
                    header = 'Name'
                    break
                case 1:
                    header = 'Will attend practice'
                    break
                case 2:
                    header = 'Practice request'
                    break
                case 3:
                    header = 'Will attend practice'
                    break
                case 4:
                    header = 'Bhajan request'
                    break
                default:
                    header = ''
            }
            
            return <div className="cell top-next-week-row" style={style}>{header}</div>;
        } else {
            let content = ''
            let request = this.state.requests[rowIndex-1];
            let firstColumnClass = 'next-week-first-column';
            let bhajan;

            switch (columnIndex) {
                case 0:
                    content = findEltName(request.person_id, this.state.people)
                    break
                case 1:
                    content = ''
                    if (request.will_attend_practice === true)
                        content = <MdDone />
                    else if (request.will_attend_practice === false) 
                        content = <MdClear />
                    break;
                case 2:
                    bhajan = findElt(request.practice_request_id, this.state.bhajans)
                    if (bhajan !== null) 
                        content = bhajan.name;
                    break
                case 3:
                    content = ''
                    if (request.will_attend_satsang === true)
                        content = <MdDone />
                    else if (request.will_attend_satsang === false) 
                        content = <MdClear />
                    break;
                case 4:
                    bhajan = findElt(request.satsang_request_id, this.state.bhajans)
                    if (bhajan !== null) 
                        content = bhajan.name;
                    break
                default:
                    content = ''
                    break
            }
            
            return <div className={`cell ${rowClassName} ` + (columnIndex === 0 ? firstColumnClass : '')} style={style}>{content}</div>;
        }
    }

    _noContentRenderer() {
        return null; //<div className="noCells">No cells</div>;
      }    


    _getRowHeight({index}) {
        switch (index) {
            default:
              return 50;
          }
      }
    _getColumnWidth({index}) {
        switch (index) {
          case 0:
            return 250;
          default:
            return 125;
        }
      }


    render() {
        return (<div>
            { this.generateForm() }

            <Container><Row>
                <Col>
                <AutoSizer disableHeight>
            {({width}) => (
                <Grid
                    fixedColumnCount={1}
                    fixedRowCount={1}
                    ref={ref => { this.list = ref }}
                    cellRenderer={this._cellRenderer}
                    className="nextweek-table"
                    columnWidth={this._getColumnWidth}
                    rowHeight={this._getRowHeight}
                    columnCount={5}
                    rowCount={this.state.requests.length+1}
                    height={1000}
                    noContentRenderer={this._noContentRenderer}
                    overscanColumnCount={this.state.overscanColumnCount}
                    overscanRowCount={this.state.overscanRowCount}
                    width={width}
                    autoContainerWidth={true}
                />
            )}
            </AutoSizer>
            </Col>
            </Row>
            </Container>

           
    
        </div>);
    }



    generateForm() {
        return (<Form onSubmit={this.handleSubmit}>
            <Container>
                <Row>
                    <Col>
                    <Form.Group>
                        <Form.Label>Date &nbsp;&nbsp;</Form.Label>
                        <DatePicker 
                            selected={new Date(this.state.form.weekend + " GMT-0400")} 
                            onChange={date => {
                                this.setState({ 
                                    form: {
                                        ...this.state.form,
                                        weekend: moment(date).format("YYYY-MM-DD")
                                    }
                                }, () => this.fetchRequest());
                            }}
                            filterDate={date => getDay(date) === 6}
                            />
                    </Form.Group>
                    </Col>
                </Row>
                <Row>
                    
                    <Card className='next-week-card'>
                        <Card.Title>Practice</Card.Title>
                        <Card.Body>
                        <Form.Group>
                            <Form.Label>Attending practice</Form.Label>
                            <Form.Control 
                                as="select"
                                value={this.state.form.will_attend_practice}
                                onChange={event => this.setState({ 
                                    form: {
                                        ...this.state.form,
                                        will_attend_practice: event.target.value
                                    }
                                    })}
                            >
                                <option value={true}>Yes</option>
                                <option value={''}>Undecided</option>
                                <option value={false}>No</option>
                                
                            </Form.Control>
                        </Form.Group>

                        <Form.Group>
                            <Form.Label>Practice Bhajan</Form.Label>
                            <Form.Control 
                                as="select"
                                value={this.state.form.practice_request_id}
                                disabled={!this.state.form.will_attend_practice}
                                onChange={event => this.setState({ 
                                    form: {
                                        ...this.state.form,
                                        practice_request_id: event.target.value }})}
                                >
                                <option value=''>None</option>
                                { this.generateBhajans('practice', null) }
                            </Form.Control>
                        </Form.Group>

                        <Form.Group>
                            <Form.Label>Practice Note</Form.Label>
                            <Form.Control 
                                type="text"
                                disabled={!this.state.form.will_attend_practice}
                                value={this.state.form.practice_note}
                                onChange={event => this.setState({ 
                                    form: {
                                        ...this.state.form,
                                        practice_note: event.target.value}})}
                                />
                        </Form.Group>
                    </Card.Body>
                    </Card>
           

                    <Card className='next-week-card'>
                    <Card.Title>Satsang</Card.Title>
                        <Card.Body>
                        <Form.Group>
                            <Form.Label>Attending satsang</Form.Label>
                            <Form.Control 
                                as="select"
                                value={this.state.form.will_attend_satsang}
                                onChange={event => this.setState({ 
                                    form: {
                                        ...this.state.form,
                                        will_attend_satsang: event.target.value
                                    }
                                    })}
                            >
                                <option value={true}>Yes</option>
                                <option value={''}>Undecided</option>
                                <option value={false}>No</option>
                                
                            </Form.Control>
                        </Form.Group>

                        <Form.Group>
                            <Form.Label>Satsang Bhajan</Form.Label>
                            <Form.Control 
                                as="select"
                                disabled={!this.state.form.will_attend_satsang}
                                value={this.state.form.satsang_request_id}
                                onChange={event => this.setState({ 
                                    form: {
                                        ...this.state.form,
                                        satsang_request_id: event.target.value
                                    }
                                    })}
                            >
                                <option value=''>None</option>
                                { this.generateBhajans('satsang', null ) }
                                {/* 
                                    Uncomment to turn on read-to-sing list
                                    { this.generateBhajans(
                                    'satsang', 
                                    this.props.personId in this.state.ready_list ? 
                                    this.state.ready_list[this.props.personId] :
                                    null )} */}
                            </Form.Control>
                        </Form.Group>

                        <Form.Group>
                            <Form.Label>Satsang Note</Form.Label>
                            <Form.Control 
                                type="text"
                                disabled={!this.state.form.will_attend_satsang}
                                value={this.state.form.satsang_note}
                                onChange={event => this.setState({ 
                                    form: {
                                        ...this.state.form,
                                        satsang_note: event.target.value
                                    }
                                    })}
                                />
                        </Form.Group>
                    </Card.Body>
                    </Card>
                    
                    { this.props.personId && _.has(this.state.ready_list, this.props.personId) &&
                    <Card className='next-week-card'>
                        <Card.Title>Ready bhajans</Card.Title>
                        <Card.Body>
                        { this.state.ready_list[this.props.personId].map(bhajan_id => 
                            <Button variant='outline-primary' onClick={evt => this.selectBhajan(bhajan_id)} block>
                                {findEltName(bhajan_id, this.state.bhajans)}
                            </Button>
                        )}
                        </Card.Body>
                    </Card>
                    }
                    
                </Row>

                <Row>
                    <Col><Button onClick={this.handleSubmit}>Save</Button></Col>
                </Row>
        </Container>
    </Form>)
    }
}
