import { deleteCoronaPatient, postCoronaPatient } from './coronaPatientsCRUD.js';
import pool from './database.js'


export async function getPatients() {
    const allPatients = await pool.query('select * from patientsdata_tbl');
    return allPatients;
}

export async function getPatient(Id) {
const [[patient]] = await pool.query(`select * from patientsdata_tbl where Id=?`,[Id]);
return patient;
}


export async function postPatient({ Id, firstName = null, lastName = null, city = null, street = null, streetNumber = null, birthday = null, phone = null, mobilePhone = null }) {
    const correctedQuery = `insert into patientsdata_tbl(Id, firstName, lastName, city, street, streetNumber, birthday, phone, mobilePhone) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)`;
    const [{ insertPatient }] = await pool.query(correctedQuery, [Id, firstName, lastName, city, street, streetNumber, birthday, phone, mobilePhone]);
    
    let data= await getPatient(Id);
    await postCoronaPatient(data.Id)
    return data;
}
  
export async function updatePatient(Id, data) {
    const fieldsToUpdate = Object.keys(data).filter(field => field !== "Id");
    const valuesToUpdate = fieldsToUpdate.map(field => data[field]);
  
    // יצירת משפט SET באופן דינמי בהתבסס על fieldsToUpdate
    const setClause = fieldsToUpdate.map((field, index) => `${field} = ?`).join(", ");
  
    const query = `UPDATE patientsdata_tbl SET ${setClause} WHERE Id = ?`;
    await pool.query(query, [...valuesToUpdate, Id]);
  
    return await getPatient(Id); // החזרת נתוני המטופל המעודכנים
}
  
export async function deletePatient(Id) {
    const query = `DELETE FROM patientsdata_tbl WHERE Id = ?`;
    await deleteCoronaPatient(Id)
    await pool.query(query, [Id]);
  }
//  let data = await postPatient({Id:21212})
//   console.log(data)
 

