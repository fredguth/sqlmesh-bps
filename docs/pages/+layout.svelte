<script>
	import '@evidence-dev/tailwind/fonts.css';
	import '../app.css';
	import { page } from '$app/stores';
	import { browser } from '$app/environment';
	import { showQueries } from '@evidence-dev/component-utilities/stores';
	import BreadCrumbs from '$lib/BreadCrumbs.svelte';
	showQueries.set(false); // do not show queries as default

	// Remove splash screen from app.html
	if (browser) {
		const splash = document.getElementById('__evidence_project_splash');
		splash?.remove();
	}

	export let data;

</script>

<slot/>