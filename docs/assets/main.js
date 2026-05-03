(() => {
  const searchInput = document.getElementById('search');
  const emptyMsg    = document.querySelector('.search-empty');
  const filterChips = Array.from(document.querySelectorAll('.filter-chip[data-filter]'));
  if (!searchInput) return;

  const allCards = Array.from(document.querySelectorAll('.card[data-search]'));
  let activeFilter = 'all';

  function normalise(s) { return s.toLowerCase().replace(/[-_]/g, ' '); }

  function setActiveFilter(nextFilter) {
    activeFilter = nextFilter;
    filterChips.forEach(chip => {
      const isActive = chip.dataset.filter === activeFilter;
      chip.classList.toggle('is-active', isActive);
      chip.setAttribute('aria-pressed', isActive ? 'true' : 'false');
    });
  }

  function update() {
    const query = normalise(searchInput.value.trim());

    // track visible cards per category
    const categoryVisible = {};

    allCards.forEach(card => {
      const haystack = normalise(card.dataset.search || '');
      const section = card.closest('.category');
      const sectionId = section ? section.id : '';
      const matchesFilter = activeFilter === 'all' || sectionId === activeFilter;
      const visible  = matchesFilter && (!query || haystack.includes(query));
      card.style.display = visible ? '' : 'none';

      if (section) {
        categoryVisible[sectionId] = (categoryVisible[sectionId] || 0) + (visible ? 1 : 0);
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
    const hasActiveConstraint = Boolean(query) || activeFilter !== 'all';
    if (emptyMsg) emptyMsg.style.display = anyVisible || !hasActiveConstraint ? 'none' : 'block';
  }

  filterChips.forEach(chip => {
    chip.addEventListener('click', () => {
      const nextFilter = chip.dataset.filter || 'all';
      if (activeFilter === nextFilter && nextFilter !== 'all') {
        setActiveFilter('all');
      } else {
        setActiveFilter(nextFilter);
      }
      update();
    });
  });

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
      setActiveFilter('all');
      update();
      searchInput.blur();
    }
  });

  setActiveFilter('all');
  update();
})();
