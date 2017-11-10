/**
 * Imprisoned.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {
  connection: 'datacenterMysqlServer',
  tableName: 'imprisoned',
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
    requester_name: {
      type: 'string',
      columnName: 'requester_name'
    },
    arrest_date: {
      type: 'date',
      columnName: 'arrest_date'
    },
    imprisoned_time: {
      type: 'int',
      columnName: 'imprisoned_time'
    },
    imprisoned_start_date: {
      type: 'date',
      columnName: 'imprisoned_start_date'
    },
    imprisoned_end_date: {
      type: 'date',
      columnName: 'imprisoned_end_date'
    },
    temporary_release_time: {
      type: 'date',
      columnName: 'temporary_release_time'
    },
    bail_price: {
      type: 'double',
      columnName: 'bail_price'
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
    bailtype: {
      model: 'bailtype'
    }
  }
};