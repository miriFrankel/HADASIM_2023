import mysql from 'mysql2'
const pool = mysql.createPool({
    host: "127.0.0.1",
    password: 'miri5791',
    user: 'root',
    database:'coronadata'
}).promise();


export default pool;