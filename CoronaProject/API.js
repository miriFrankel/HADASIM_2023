import express from "express";
import { deletePatient, getPatient, getPatients, postPatient, updatePatient } from './patientsCRUD.js';
import { deleteCoronaPatient, getCoronaPatient, getCoronaPatients, postCoronaPatient, updateCoronaPatient } from "./coronaPatientsCRUD.js";
import cors from 'cors';

import bodyParser from "body-parser";
const PORT = process.env.PORT || 8080;
// create application/json parser
var jsonParser = bodyParser.json()
const app = express();
app.use(cors({
    origin: 'http://localhost:3000'
  }));
  // all of the regular patients data
  app.get('/patients', async (req, res) => {
      const  [allPatients]  = await getPatients()
    res.json(allPatients);
    
})

app.get('/patient/:id', async (req, res) => {
    const { id } = req.params;
    const data = await getPatient(id);
    res.json(data)
})

app.post('/patients', jsonParser, async (req, res) => {
    const details = req.body;
    console.log("hete dcldc:"+ req.body)
    const data = await postPatient(details);
    res.json(data)
})

app.put('/patients', jsonParser, async (req, res) => {
    const  Id  = req.body.selectedPatient;
    const  patientData  =req.body.updatedPatDat
    const data = await updatePatient(Id,patientData);
    res.json(data)
})
app.delete('/patient/:id', async (req, res) => {
    const  Id  = req.params;
    await deletePatient(Id.id);
    res.json();
})



//all of the corona patients data
app.get('/coronaPatients', async (req, res) => {
    const allPatients = await getCoronaPatients()
    res.json(allPatients);
    
})

app.get('/coronaPatient/:id', async (req, res) => {
    const { id } = req.params;
    const data = await getCoronaPatient(id);
    res.json(data)
})

app.post('/coronaPatients', jsonParser, async (req, res) => {
    
    const details = req.body;
    if (!details.Id) {
        return res.status(400).json({ error: "Missing required fields" });
    }
    const data = await postCoronaPatient(details);
    res.json(data)
})

app.put('/coronaPatients', jsonParser, async (req, res) => {
    const  Id  = req.body.selectedPatient;
    const  patientData  =req.body.updatedPatDat
    const data = await updatePatient(Id,patientData);
    res.json(data)
})
app.delete('/coronaPatient/:id', async (req, res) => {
    const  Id  = req.params;
    await deleteCoronaPatient(Id.id);
    res.json();
})
app.listen(PORT,()=>{console.log("listen in port 8080")})