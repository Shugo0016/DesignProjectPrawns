// Check if the user is logged in
const isLoggedIn = localStorage.getItem('isLoggedIn');
const studentId = localStorage.getItem('student_id');

// Get the navbar container
const navLinks = document.querySelector('.nav-links');

// If the user is logged in, add the Profile link dynamically
if (isLoggedIn && studentId) {
    // Check if the Profile link already exists to avoid duplicates
    if (!document.querySelector('#profile-link')) {
        const profileLink = document.createElement('li');
        profileLink.id = 'profile-link';
        profileLink.innerHTML = `<a href="profile.html">Profile</a>`;
        navLinks.appendChild(profileLink);
    }
}