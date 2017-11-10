/**
 * Accused.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  connection: 'datacenterMysqlServer',
  tableName: 'accused',
  attributes: {
    id: {
      type: 'int',
      unique: true,
      primaryKey: true,
      autoIncrement: true,
      columnName: 'id'
    },
    name: {
      type: 'string',
      columnName: 'name'
    },
    card_id: {
      type: 'string',
      columnName: 'card_id'
    },
    national: {
      type: 'int',
      columnName: 'national'
    },
    gender: {
      type: 'int',
      columnName: 'gender'
    },
    lawyer_name: {
      type: 'string',
      columnName: 'lawyer_name'
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
    prosecutor: {
      model: 'prosecutor'
    }
  }
};

