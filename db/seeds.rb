User.create(name: "Akshat Pegwar", email: "akshatp@shriffle.com", password: "akshat123", role: "admin")
User.create(name: "Akshat Admin", email: "akshatpegwar5@gmail.com", password: "admin123", role: "admin")
User.create(name: "Mohit Kumrawat", email: "mohitk@shriffle.com", password: "mohit123", role: "sub_admin")
User.create(name: "Ritik Dhote", email: "ritikd@shriffle.com", password: "ritik123", role: "health_worker")
User.create(name: "Ram Kushwah", email: "ramkrishnak@shriffle.com", password: "ram123", role: "patient")

Hospital.create(name: "Apollo Hospital", location: "Scheme no. 78", user_id: 1)
Hospital.create(name: "Medanta Hospital", location: "Vijay Nagar", user_id: 2)

TestCenter.create(name: "Center-1 for Apollo", hospital_id: 1, location: "Scheme no 78")
TestCenter.create(name: "Center-1 for Medanta", hospital_id: 2, location: "Vijay Nagar")

Appointment.create(user_id: 1, description: "Annual Physical", hospital_id: 1, test_center_id: 1)
Appointment.create(user_id: 2, description: "Blood Test", hospital_id: 2, test_center_id: 2)
