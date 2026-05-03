(() => {
  const searchInput = document.getElementById('search');
  const emptyMsg    = document.querySelector('.search-empty');
  if (!searchInput) return;

  const allCards = Array.from(document.querySelectorAll('.card[data-search]'));

  function normalise(s) { return s.toLowerCase().replace(/[-_]/g, ' '); }

  function update() {
    const query = normalise(searchInput.value.trim());

    // track visible cards per category
    const categoryVisible = {};

    allCards.forEach(card => {
      const haystack = normalise(card.dataset.search || '');
      const visible  = !query || haystack.includes(query);
      card.style.display = visible ? '' : 'none';

      const section = card.closest('.category');
      if (section) {
        const id = section.id;
        categoryVisible[id] = (categoryVisible[id] || 0) + (visible ? 1 : 0);
      }
    });

    // show/hide category sections
    document.querySelectorAll('.category').forEach(section => {
      const count = categoryVisible[section.id] || 0;
      section.style.display = count > 0 ? '' : 'none';

      // update live count badge
      const badge = section.querySelector('.category-count');
      if (badge) {
        const total = section.querySelectorAll('.card').length;
        badge.textContent = query ? `${count} / ${total}` : `${total}`;
      }
    });

    // global empty state
    const anyVisible = Object.values(categoryVisible).some(v => v > 0);
    if (emptyMsg) emptyMsg.style.display = anyVisible || !query ? 'none' : 'block';
  }

  searchInput.addEventListener('input', update);

  // keyboard shortcut: Ctrl+K / Cmd+K focuses search
  document.addEventListener('keydown', e => {
    if ((e.ctrlKey || e.metaKey) && e.key === 'k') {
      e.preventDefault();
      searchInput.focus();
      searchInput.select();
    }
    if (e.key === 'Escape') {
      searchInput.value = '';
      update();
      searchInput.blur();
    }
  });
})();
