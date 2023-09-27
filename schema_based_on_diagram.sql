CREATE TABLE patients (
  patient_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  date_of_birth DATE NOT NULL,
  PRIMARY KEY (patient_id)
);

CREATE TABLE medical_histories (
  id SERIAL PRIMARY KEY,
  admitted_at TIMESTAMP NOT NULL,
  status VARCHAR(255) NOT NULL,
  patient_id SERIAL NOT NULL,
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);


CREATE TABLE treatments (
  id INT NOT NULL AUTO_INCREMENT,
  type VARCHAR(255) NOT NULL,
  medical_history_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE invoices (
  id SERIAL PRIMARY KEY,
  total_amount DECIMAL(10,2) NOT NULL,
  generated_at TIMESTAMP NOT NULL,
  paid_at TIMESTAMP,
  medical_history_id SERIAL NOT NULL,
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items (
  invoice_id INT NOT NULL,
  unit_price DECIMAL(10,2) NOT NULL,
  quantity INT NOT NULL,
  total_price DECIMAL(10,2) NOT NULL,
  treatment_id INT NOT NULL,
  PRIMARY KEY (invoice_id, treatment_id),
  FOREIGN KEY (invoice_id) REFERENCES invoices(id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);
