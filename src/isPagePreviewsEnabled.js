/**
 * @module isPagePreviewsEnabled
 */

/**
 * Given the global state of the application, creates a function that gets
 * whether or not the user should have Page Previews enabled.
 *
 * Page Previews is disabled when the Navigation Popups gadget is enabled.
 *
 * If Page Previews is configured as a user preference, then the user must
 * either be logged in and have enabled the preference or be logged out and have
 * not disabled previews via the settings modal.
 *
 * @param {mw.user} user The `mw.user` singleton instance
 * @param {Object} userSettings An object returned by `userSettings.js`
 * @param {mw.Map} config
 *
 * @return {boolean|null} Null when there is no way the popup type can be enabled at run-time.
 */
export default function isPagePreviewsEnabled( user, userSettings, config ) {
	return null;
}
