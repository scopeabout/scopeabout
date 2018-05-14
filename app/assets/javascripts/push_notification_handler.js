class PushNotificationConsentHandler {
  constructor(options = {triggerEl: null, hideEl: null}) {
    this.options = options;
    if(!this.validOptions()) { return }
    if(this.permissionDenied()) { return }
    if(this.hasPushNotificationCookie()) { return }
    this.init();
  }

  validOptions() {
    return this.options.triggerEl !== null &&
           this.options.hideEl !== null;
  }

  init() {
    this.options.wrapperEl.style.display = 'block';

    this.options.hideEl.addEventListener('click', this.hidePushNotifications.bind(this), false);
    this.options.hideEl.addEventListener('click', this.clearCache, false);
    this.options.neverShowEl.addEventListener('click', this.neverShowPushNotifications.bind(this), false);
    this.options.neverShowEl.addEventListener('click', this.clearCache, false);

    this.options.triggerEl.addEventListener('click', this.requestPushNotifications.bind(this), false);
  }

  hidePushNotifications() {
    this.setPushNotificaitonCookie(false, 14);
  }

  neverShowPushNotifications() {
    this.setPushNotificaitonCookie(false, 3650);
  }

  hasPushNotificationCookie() {
    Cookies.get('push_notification_consented');
  }

  setPushNotificaitonCookie(value, daysToReset = 365) {
    Cookies.set('push_notification_consented', value, { path: '/', expires: daysToReset });
  }

  clearCache() {
    if(window.Turbolinks) {
      window.Turbolinks.clearCache();
    }
  }

  requestPushNotifications() {
    Notification.requestPermission().then((result) => {
      if (result === 'denied') {
        this.setPushNotificaitonCookie(false, 1);
        return;
      }
      if (result === 'default') {
        console.log('The permission request was dismissed.');
        return;
      }
      this.setPushNotificaitonCookie(true, 730);
      this.clearCache();
    })
  }

  permissionDenied() {
    return Notification.permission === 'denied';
  }
}