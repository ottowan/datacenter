/**
 * Sector.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {
  connection: 'datacenterMysqlServer',
  tableName: 'sector',
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
    department: {
      model: 'department'
    },
  }
};

