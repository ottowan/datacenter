/**
 * Appeal.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {
  connection: 'datacenterMysqlServer',
  tableName: 'appeal',
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
      columnName: 'judgement_date'
    },
    judgement_detail: {
      type: 'string',
      columnName: 'judgement_detail'
    },
    judgement_dismiss_other: {
      type: 'string',
      columnName: 'judgement_dismiss_other'
    },
    judgement_paper_status: {
      type: 'int',
      columnName: 'judgement_paper_status'
    },
    judgement_paper_date: {
      type: 'date',
      columnName: 'judgement_paper_date'
    },
    comment: {
      type: 'string',
      columnName: 'comment'
    },

    //Object data
    department: {
      model: 'department'
    },
    sector: {
      model: 'sector'
    },
    casetype: {
      model: 'casetype'
    },
    case: {
      model: 'case'
    },
    accused: {
      model: 'accused'
    },
    prosecutor: {
      model: 'prosecutor'
    },
    highjudgementtype: {
      model: 'highjudgementtype'
    },
    dismissaltype: {
      model: 'dismissaltype'
    }
  }
};

