document.addEventListener('turbo:load', function() {
      const mypageBtnContainer = document.getElementById('mypageBtnContainer');
      const mypageDropdown = document.getElementById('mypageDropdown');
    
      mypageDropdown.style.display = 'none';
      if (mypageBtnContainer) {
        mypageBtnContainer.addEventListener('mouseover', function() {
          mypageDropdown.style.display = 'block';
        });
    
        mypageBtnContainer.addEventListener('mouseout', function() {
          mypageDropdown.style.display = 'none';
        });
      }}
    );