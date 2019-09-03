import React from "react";
import { 
    Col, 
    Container, 
    Row,
    ToggleButton,
    ToggleButtonGroup } from 'react-bootstrap'
import { AutoSizer, MultiGrid } from 'react-virtualized'
import styles from './Grid.css';
import _ from 'lodash'


export class Summary extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            event: 'practice',
            bhajan_summary: {},
            attendance_summary: {},

            sortedDates: [],
            sortedPeople: [],

            overscanColumnCount: 0,
            overscanRowCount: 10,
            rowHeight: 40,
        };


        this._cellRenderer = this._cellRenderer.bind(this);
        this._getColumnWidth = this._getColumnWidth.bind(this);
        this._getRowClassName = this._getRowClassName.bind(this);
        this._noContentRenderer = this._noContentRenderer.bind(this);
        this._getRowHeight = this._getRowHeight.bind(this);
    }
   
    componentDidMount() {
        this.fetchSummaryTable();
    }

    componentWillUnmount() {
        
    }

    fetchSummaryTable() {
        let loadUrl = `http://localhost:1234/renditions/summarize?event=${this.state.event}`; 
        fetch(loadUrl)
        .then(res => res.json())
        .then(data => {
            // Create indexes
            console.log(data.attendance_summary);

            let dates = _.sortBy(_.keys(data.bhajan_summary));
            let people = [];
            for (let _people of _.values(data.bhajan_summary))  {
                people = people.concat(_.keys(_people))
            }
            
            let uniqPeople = _.sortBy(_.uniq(people));
            
            console.log(dates, uniqPeople)
            this.setState({
                ...data,
                sortedDates: dates,
                sortedPeople: uniqPeople,
            })
        });
    }


    handleChange (e) {
        this.setState({ event: e }, () => this.fetchSummaryTable())
    }


    _getRowClassName(row) {
        return row % 2 === 0 ? "evenRow" : "oddRow";
    }
      
      
    _cellRenderer({columnIndex, key, rowIndex, style}) {
        let rowClassName = this._getRowClassName(rowIndex);
        if (columnIndex === 0 && rowIndex === 0)  {
            if (this.state.sortedDates.length === 0) return null;
            else return <div className={`cell`} style={style}></div>
        }

        let dateStr = this.state.sortedDates[columnIndex - 1];
        let peopleStr = this.state.sortedPeople[rowIndex - 1];
        
        if (rowIndex === 0) {
            return <div className="cell topRow" style={style}>{this.state.sortedDates[columnIndex-1]}</div>;
        } else if (columnIndex === 0) {
            return <div className="cell leftRow" style={style}>{this.state.sortedPeople[rowIndex-1]}</div>;
        } else {
            let classNames = `cell ${rowClassName} `
            if (this.state.attendance_summary[dateStr][peopleStr] === true)
                classNames += 'summary-attended'
            else if (this.state.attendance_summary[dateStr][peopleStr] === false)
                classNames += 'summary-not-attended'
            
            return <div className={classNames} style={style}>{_.join(this.state.bhajan_summary[dateStr][peopleStr])}</div>;
        }
    }

    _noContentRenderer() {
        return null; //<div className="noCells">No cells</div>;
      }    


    _getRowHeight({index}) {
        switch (index) {
            default:
              return 80;
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
        return (
        <Container>
            <Row>
                <Col>
                    <ToggleButtonGroup 
                        type="radio" 
                        name="options"
                        defaultValue='practice'
                        value={this.state.event} 
                        onChange={(e) => this.handleChange(e)}>
                        <ToggleButton variant="outline-primary" value='practice'>Practice</ToggleButton>
                        <ToggleButton variant="outline-primary" value='satsang'>Satsang</ToggleButton>
                    </ToggleButtonGroup>
                </Col>
            </Row>

            <Row>
            <AutoSizer disableHeight>
            {({width}) => (
                <MultiGrid
                fixedColumnCount={1}
                fixedRowCount={1}

                cellRenderer={this._cellRenderer}
                
                classNameBottomLeftGrid="BodyGrid namesGrid"
                classNameBottomRightGrid="BodyGrid"
                classNameTopLeftGrid="BodyGrid topLeftGrid"
                classNameTopRightGrid="BodyGrid datesGrid"
                

                columnWidth={this._getColumnWidth}
                rowHeight={this._getRowHeight}
                
                columnCount={this.state.sortedDates.length+1}
                rowCount={this.state.sortedPeople.length+1}

                height={500}
                noContentRenderer={this._noContentRenderer}
                overscanColumnCount={this.state.overscanColumnCount}
                overscanRowCount={this.state.overscanRowCount}
                
                width={width}
                />
            )}
            </AutoSizer>

            </Row>
        </Container>);
    }
}