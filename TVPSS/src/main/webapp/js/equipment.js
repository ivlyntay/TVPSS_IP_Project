document.addEventListener('DOMContentLoaded', () => {
    const modal = document.getElementById('confirmationModal');
    const selectButtons = document.querySelectorAll('.select-btn');
    const confirmBtn = document.querySelector('.confirm-btn');
    const cancelBtn = document.querySelector('.cancel-btn');
    const selectedLevelSpan = document.getElementById('selectedLevel');
    const backBtn = document.querySelector('.back-btn');
    const nextBtn = document.querySelector('.next-btn');
    let currentButton = null;

    // Handle select button clicks
    selectButtons.forEach(button => {
        button.addEventListener('click', () => {
            currentButton = button;
            const level = button.getAttribute('data-level');
            selectedLevelSpan.textContent = level;
            modal.classList.add('show');
        });
    });

    // Handle confirm button click
    confirmBtn.addEventListener('click', () => {
        if (currentButton) {
            // Remove active class from all buttons
            selectButtons.forEach(btn => {
                btn.classList.remove('active');
                btn.textContent = 'Select';
            });
            
            // Add active class to current button and change text
            currentButton.classList.add('active');
            currentButton.textContent = 'Selected';
        }
        modal.classList.remove('show');
    });

    // Handle cancel button click
    cancelBtn.addEventListener('click', () => {
        modal.classList.remove('show');
    });

    // Handle back button
    backBtn.addEventListener('click', () => {
        window.location.href = 'program_status.jsp';
    });

    // Handle next button
    nextBtn.addEventListener('click', () => {
        // Check if any level is selected
        const selectedLevel = document.querySelector('.select-btn.active');
        if (!selectedLevel) {
            alert('Please select an equipment level before proceeding.');
            return;
        }
        // Navigate to next page
        window.location.href = 'next_page.jsp';
    });

    // Close modal when clicking outside
    modal.addEventListener('click', (e) => {
        if (e.target === modal) {
            modal.classList.remove('show');
        }
    });
});/**
 * 
 */