package Model;

public class User {
		private String firstName;
		private String lastName;
		private String emailAddress;
		private String password;
		public String getContact() {
			return contact;
		}
		public void setContact(String contact) {
			this.contact = contact;
		}

		private String contact;
		
		public String getFirstName() {
			return firstName;
		}
		public void setFirstName(String firstName) {
			this.firstName = firstName;
		}
		public String getLastName() {
			return lastName;
		}
		public void setLastName(String lastName) {
			this.lastName = lastName;
		}
		public String getEmailAddress() {
			return emailAddress;
		}
		public void setEmailAddress(String emailAddress) {
			this.emailAddress = emailAddress;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		
		public User() {
			
		}
		public User(String firstName, String lastName, String emailAddress, String password, String contact) {
			super();
			this.firstName = firstName;
			this.lastName = lastName;
			this.emailAddress = emailAddress;
			this.password = password;
			this.contact = contact;
		}
		
}
