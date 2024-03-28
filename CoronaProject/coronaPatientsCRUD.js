import pool from './database.js'
async function getCompanyName(companyCode){
    const [[ company ]] = await pool.query(`select companyName from vaccinationcompany_tbl where companyCode=?`,[companyCode]);
    return company.companyName;
  }
 export async function getVaccinationCompay(companyCode){
    const [[ company ]] = await pool.query(`select * from vaccinationcompany_tbl`);
    return company;
  }
  export async function getCoronaPatients() {
    const [allPatients] = await pool.query('select * from corona_patients_tbl');
    for (const element of allPatients) {
          if (element.vaccinationCompany1 != null) {
              const companyName = await getCompanyName(element.vaccinationCompany1);
              element.vaccinationCompany1 = companyName;
          }
          if (element.vaccinationCompany2 != null) {
            const companyName = await getCompanyName(element.vaccinationCompany2);
            element.vaccinationCompany2 = companyName;
          }
          if (element.vaccinationCompany3 != null) {
            const companyName = await getCompanyName(element.vaccinationCompany3);
            element.vaccinationCompany3 = companyName;
          }
          if (element.vaccinationCompany4 != null) {
            const companyName = await getCompanyName(element.vaccinationCompany4);
            element.vaccinationCompany4 = companyName;
        }
    }
  
    return allPatients;
  }

export async function getCoronaPatient(Id) {
    const [[patient]] = await pool.query(`select * from corona_patients_tbl where Id=?`, [Id]);
    if (patient.vaccinationCompany1 != null) {
        const companyName = await getCompanyName(patient.vaccinationCompany1);
        patient.vaccinationCompany1 = companyName;
    }
    if (patient.vaccinationCompany2 != null) {
      const companyName = await getCompanyName(patient.vaccinationCompany2);
      patient.vaccinationCompany2 = companyName;
    }
    if (patient.vaccinationCompany3 != null) {
      const companyName = await getCompanyName(patient.vaccinationCompany3);
      patient.vaccinationCompany3 = companyName;
    }
    if (patient.vaccinationCompany4 != null) {
      const companyName = await getCompanyName(patient.vaccinationCompany4);
      patient.vaccinationCompany4 = companyName;
  }
return patient;
}


export async function postCoronaPatient(Id, vaccinationDate1=null, vaccinationDate2=null, vaccinationDate3=null, vaccinationDate4=null, vaccinationCompany1=null, vaccinationCompany2=null, vaccinationCompany3=null, vaccinationCompany4=null,positiveDate=null,recoveryDate=null) {
    const correctedQuery = `insert into corona_patients_tbl(Id, vaccinationDate1, vaccinationDate2, vaccinationDate3, vaccinationDate4, vaccinationCompany1, vaccinationCompany2, vaccinationCompany3, vaccinationCompany4,positiveDate,recoveryDate) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)`;
    const [{ insertPatient }] = await pool.query(correctedQuery, [Id, vaccinationDate1, vaccinationDate2, vaccinationDate3, vaccinationDate4, vaccinationCompany1, vaccinationCompany2, vaccinationCompany3, vaccinationCompany4,positiveDate,recoveryDate]);
  
    return await getCoronaPatient(Id);
}
  
export async function updateCoronaPatient(Id, data) {
    const fieldsToUpdate = Object.keys(data).filter(field => field !== "Id");
    const valuesToUpdate = fieldsToUpdate.map(field => data[field]);
  
    // יצירת משפט SET באופן דינמי בהתבסס על fieldsToUpdate
    const setClause = fieldsToUpdate.map((field, index) => `${field} = ?`).join(", ");
  
    const query = `UPDATE corona_patients_tbl SET ${setClause} WHERE Id = ?`;
    await pool.query(query, [...valuesToUpdate, Id]);
  
    return await getCoronaPatient(Id); // החזרת נתוני המטופל המעודכנים
}
  
export async function deleteCoronaPatient(Id) {
    const query = `DELETE FROM corona_patients_tbl WHERE Id = ?`;
    await pool.query(query, [Id]);
  }
let a = {
    vaccinationCompany1:`1`
};
