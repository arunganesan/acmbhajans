import React from "react";
import { Button, Form, Row, Col, Container } from 'react-bootstrap'
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";
import moment from 'moment'
 
import { eachWeekendOfYear, getDay, addDays } from "date-fns";


export class InputPage extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            date: this.getNextWeekendDate(),
            attending_practice: false,
            attending_satsang: false,

            practice_bhajan: '',
            satsang_bhajan: '', 
            
            practice_note: '',
            satsang_note: '',
        };
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
        // TODO
        // need to load the list of bhajans, this person's ready list, and their input for this week if possible
    }

    componentWillUnmount() {
        
    }


    handleSubmit(event) {
        // Send to server
        // Show a "saved" message
        event.preventDefault();
    }

    generateBhajans () {
        return [1,2,3,4]
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
                            selected={this.state.date} 
                            onChange={this.handleChange}
                            filterDate={date => {
                                const day = getDay(date);
                                return day === 6;
                            }}
                            />
                    </Form.Group>
                    </Col>
                </Row>
                <Row>
                    <Col className="inputgroup">
                    <Form.Group>
                        <Form.Check 
                            type="checkbox" 
                            label="Attending Practice"
                            checked={this.state.attending_practice} 
                            onChange={event => this.setState({
                                attending_practice: event.target.checked
                            })}/>
                    </Form.Group>

                    <Form.Group>
                        <Form.Label>Practice Bhajan</Form.Label>
                        <Form.Control 
                            as="select"
                            value={this.state.practice_bhajan}
                            disabled={!this.state.attending_practice}
                            onChange={event => this.setState({ practice_bhajan: event.target.value })}
                        >
                            <option value=''>None</option>
                            { this.generateBhajans() }
                        </Form.Control>
                    </Form.Group>

                    <Form.Group>
                        <Form.Label>Practice Note</Form.Label>
                        <Form.Control 
                            type="text"
                            disabled={!this.state.attending_practice}
                            value={this.state.practice_note}
                            onChange={event => this.setState({ 
                                practice_note: event.target.value })}
                            />
                    </Form.Group>
                    </Col>

                    <Col className="inputgroup">
                    <Form.Group>
                        <Form.Check 
                            type="checkbox" 
                            label="Attending Satsang"
                            checked={this.state.attending_satsang} 
                            onChange={event => this.setState({
                                attending_satsang: event.target.checked
                            })}/>
                    </Form.Group>

                    <Form.Group>
                        <Form.Label>Satsang Bhajan</Form.Label>
                        <Form.Control 
                            as="select"
                            disabled={!this.state.attending_satsang}
                            value={this.state.satsang_bhajan}
                            onChange={event => this.setState({ 
                                satsang_bhajan: event.target.value })}
                        >
                            <option value=''>None</option>
                            { this.generateBhajans() }
                        </Form.Control>
                    </Form.Group>

                    <Form.Group>
                        <Form.Label>Satsang Note</Form.Label>
                        <Form.Control 
                            type="text"
                            disabled={!this.state.attending_satsang}
                            value={this.state.satsang_note}
                            onChange={event => this.setState({ 
                                satsang_note: event.target.value })}
                            />
                    </Form.Group>
                    </Col>
                </Row>

                <Row>
                    <Col><Button type="submit">Save</Button></Col>
                    
                </Row>
            </Container>
            </Form>
        </div>);
    }
}
