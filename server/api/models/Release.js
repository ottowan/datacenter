/**
 * Acquit.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {
  connection: 'datacenterMysqlServer',
  tableName: 'release',
  attributes: {
    id: {
      type: 'int',
      unique: true,
      primaryKey: true,
      autoIncrement: true,
      columnName: 'id'
    },
    warrant_detention_date: {
      type: 'date',
      columnName: 'warrant_detention_date'
    },
    warrant_release_date: {
      type: 'date',
      columnName: 'warrant_release_date'
    },
    warrant_imprison_date: {
      type: 'date',
      columnName: 'warrant_imprison_date'
    },
    warrant_arrest_had: {
      type: 'int',
      columnName: 'warrant_arrest_had'
    },
    warrant_arrest_finish: {
      type: 'int',
      columnName: 'warrant_arrest_finish'
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
    case: {
      model: 'case'
    },
    accused: {
      model: 'accused'
    },
    prosecutor: {
      model: 'prosecutor'
    }
  }
};

