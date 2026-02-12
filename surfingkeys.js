// settings
// TODO: make a wonderful proxy switcher
settings.showProxyInStatusBar = false;

// tab navigation
api.map('{', 'E');
api.map('}', 'R');


function getMainMedia() {
	const list = [...document.querySelectorAll('video, audio')].filter(m => {
		const r = m.getBoundingClientRect();
		return r.width > 0 && r.height > 0;
	});
	if (!list.length) return null;

	const playing = list.find(m => !m.paused && !m.ended);
	if (playing) return playing;

	return list.sort((a, b) => {
		const ra = a.getBoundingClientRect();
		const rb = b.getBoundingClientRect();
		return (rb.width * rb.height) - (ra.width * ra.height);
	})[0];
}

function clamp(x, a, b) { return Math.max(a, Math.min(b, x)); }

function toast(s) {
	if (typeof Front !== "undefined" && Front.showPopup) Front.showPopup(s);
}


api.unmap('z');
api.unmap('c');
api.mapkey('z', 'Media: seek -3s', () => {
	const m = getMainMedia(); if (!m) return toast('No media found');
	m.currentTime = Math.max(0, m.currentTime - 3);
	toast(`⏪ ${m.currentTime.toFixed(1)}s`);
});
api.mapkey('c', 'Media: seek +3s', () => {
	const m = getMainMedia(); if (!m) return toast('No media found');
	m.currentTime = m.currentTime + 3;
	toast(`⏩ ${m.currentTime.toFixed(1)}s`);
});

api.mapkey('S', 'Media: play/pause', () => {
	const m = getMainMedia(); if (!m) return toast('No media found');
	if (m.paused) m.play(); else m.pause();
});

api.mapkey('W', 'Media: volume +', () => {
	const m = getMainMedia(); if (!m) return toast('No media found');
	m.volume = clamp(m.volume + 0.05, 0, 1);
	toast(`🔊 ${(m.volume * 100).toFixed(0)}%`);
});
api.mapkey('X', 'Media: volume -', () => {
	const m = getMainMedia(); if (!m) return toast('No media found');
	m.volume = clamp(m.volume - 0.05, 0, 1);
	toast(`🔉 ${(m.volume * 100).toFixed(0)}%`);
});

api.mapkey('E', 'Media: speed +', () => {
	const m = getMainMedia(); if (!m) return toast('No media found');
	m.playbackRate = clamp((m.playbackRate || 1) + 0.1, 0.1, 4);
	toast(`⏩ x${m.playbackRate.toFixed(2)}`);
});
api.mapkey('Q', 'Media: speed -', () => {
	const m = getMainMedia(); if (!m) return toast('No media found');
	m.playbackRate = clamp((m.playbackRate || 1) - 0.1, 0.1, 4);
	toast(`⏪ x${m.playbackRate.toFixed(2)}`);
});
