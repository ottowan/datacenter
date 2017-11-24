/**
 * Case.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {
  connection: 'datacenterMysqlServer',
  tableName: 'case',
  attributes: {
    id: {
      type: 'int',
      unique: true,
      primaryKey: true,
      autoIncrement: true,
      columnName: 'id'
    },
    black_abb: {
      type: 'string',
      columnName: 'black_abb'
    },
    black_no: {
      type: 'string',
      columnName: 'black_no'
    },
    black_year: {
      type: 'string',
      columnName: 'black_year'
    },
    recieve_date: {
      type: 'date',
      columnName: 'recieve_date'
    },
    red_abb: {
      type: 'string',
      columnName: 'red_abb'
    },
    red_no: {
      type: 'string',
      columnName: 'red_no'
    },
    red_year: {
      type: 'string',
      columnName: 'red_year'
    },
    judgement_date: {
      type: 'date',
      columnName: 'judgement_date',
      required: false
    },
    injustice_local: {
      type: 'int',
      columnName: 'injustice_local'
    },
    injustice_inter: {
      type: 'int',
      columnName: 'injustice_inter'
    },
    accusation_tail: {
      type: 'string',
      columnName: 'accusation_tail'
    },
    comment: {
      type: 'string',
      columnName: 'comment'
    },
    department: {
      model: 'department'
    },
    sector: {
      model: 'sector'
    },
    casetype: {
      model: 'casetype'
    },
	 // Modifies case input before validation
	  beforeValidate: function(case, cb){
		// Make sure birthdate is not saved as 0000-00-00
		if(!case.judgement_date || case.judgement_date == '0000-00-00'){
		  case.judgement_date = null;
		}
		cb();
	  },
	},
  }
};

