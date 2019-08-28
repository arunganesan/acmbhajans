import React from "react";
import { Card, Button, Form, Row, Col, Container } from 'react-bootstrap'
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";

import _ from 'lodash'
import moment from 'moment';
import { getDay, addDays } from "date-fns";
import { findEltName } from './Fields'


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
            bhajans: [],
            ready_list: {},
        };


        this.fetchRequest = this.fetchRequest.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
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
        return addDays(today, offset);
    }

    componentDidMount() {
        // need to load the list of bhajans, 
        // this person's ready list, and their 
        // input for this week if possible

       this.fetchRequest();
    }

    fetchRequest() {
        console.log('This.props has ', this.props);
        let loadUrl = 'http://localhost:1234/request/edit'
        loadUrl += '?date=' + moment(this.state.form.weekend).format('YYYY-MM-DD');
        loadUrl += '&person_id=' + this.props.personId;
        fetch(loadUrl)
        .then(res => res.json())
        .then(data => {
            this.setState({
              ...data,
              form: {
                  ...data.requests[0]
              }
            })
        });
    }

    componentWillUnmount() {
        
    }


    handleSubmit(event) {
        // Send to server
        // Show a "saved" message
        console.log('This.props has ', this.props);
        let loadUrl = 'http://localhost:1234/request/edit'
        loadUrl += '?date=' + moment(this.state.form.weekend).format('YYYY-MM-DD');
        loadUrl += '&person_id=' + this.props.personId;
        
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
                      ...data.requests[0]
                  }
              })
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

    render() {
        return (<div>
            <Form onSubmit={this.handleSubmit}>
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
                                });

                                this.fetchRequest();
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
                        <Form.Check 
                            type="checkbox" 
                            label="Attending Practice"
                            checked={this.state.form.will_attend_practice} 
                            onChange={event => this.setState({
                                form: {
                                    ...this.state.form,
                                    will_attend_practice: event.target.checked
                                }
                            })}/>
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
                            <Form.Check 
                                type="checkbox" 
                                label="Attending Satsang"
                                checked={this.state.form.will_attend_satsang} 
                                onChange={event => this.setState({
                                    form: {
                                        ...this.state.form,
                                        will_attend_satsang: event.target.checked
                                    }
                                })}/>
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
                                { this.generateBhajans(
                                    'satsang', 
                                    this.props.personId in this.state.ready_list ? 
                                    this.state.ready_list[this.props.personId] :
                                    null )}
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
                        <Card.Title>Ready-list</Card.Title>
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
            </Form>
        </div>);
    }
}
